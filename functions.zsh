aws-login() {
    # Assume you have a profile called 'default'. Change if necessary.
    AWS_PROFILE="default"

    # Retrieve the ARNs of all MFA devices associated with the IAM user
    IFS=$'\n' MFA_ARNs=($(aws iam list-mfa-devices --query "MFADevices[].SerialNumber" --output text --profile $AWS_PROFILE))

    # Function to retrieve temporary credentials
    get_temp_creds() {
        local MFA_ARN=$1
        local MFA_CODE=$2

        aws sts get-session-token --serial-number $MFA_ARN --token-code $MFA_CODE --profile $AWS_PROFILE 2>&1
    }

    attempt_count=0
    while true; do
        attempt_count=$((attempt_count + 1))

        # Prompt for MFA code
        printf "Enter MFA code (Attempt %s/3): " "$attempt_count"
        read MFA_CODE

        # Flag to check if any MFA device worked
        mfa_success=0

        # Try to use the MFA code with each MFA device
        for MFA_ARN in "${MFA_ARNs[@]}"; do
            TEMP_CREDS=$(get_temp_creds $MFA_ARN $MFA_CODE)

            # Check if the command succeeded
            if [[ $? -eq 0 ]]; then
                echo $TEMP_CREDS > $(pwd)/.temp_aws_credentials.json
                echo -e "Temporary credentials created at $(pwd)/.temp_aws_credentials.json\n"

                mfa_success=1
                break
            fi
        done

        # If any MFA device succeeded, break out of the loop
        if [[ $mfa_success -eq 1 ]]; then
            break
        else
            if [[ $attempt_count -eq 3 ]]; then
                echo "Failed to validate MFA code after 3 attempts."
                return 1
            fi
            echo "Failed to retrieve temporary credentials for the provided MFA code. Please try again."
        fi
    done
}

aws-set () {
    # Check if jq is installed
    if ! command -v jq &> /dev/null; then
        echo "jq is not installed. Please install it first."
        return 1
    fi

    # Check if a file path is provided
    if [ "$#" -ne 1 ]; then
        JSON_FILE="$(pwd)/.temp_aws_credentials.json"
    else
        JSON_FILE="$1"
    fi

    # Ensure the path is absolute
    if [[ ! "$JSON_FILE" = /* ]]; then
        echo "Please provide an absolute path to the JSON file."
        return 1
    fi

    # Check if file exists
    if [[ ! -f "$JSON_FILE" ]]; then
        echo "File does not exist at the specified path $JSON_FILE"
        return 1
    fi

    # Extract expiration timestamp from the JSON file
    EXPIRATION=$(jq -r '.Credentials.Expiration' "$JSON_FILE")
    CURRENT_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    TIME_DIFFERENCE_HOURS=$(echo "($(date -d "$EXPIRATION" +%s) - $(date -d "$CURRENT_TIME" +%s)) / 3600" | bc)

    # Check if timestamp is over 12 hours old
    if (( TIME_DIFFERENCE_HOURS < -12 )); then
        echo "The credentials in the file are over 12 hours old. Please create a new file."
        return 1
    fi

    # Extract credentials and set as environment variables
    export AWS_ACCESS_KEY_ID=$(jq -r '.Credentials.AccessKeyId' "$JSON_FILE")
    export AWS_SECRET_ACCESS_KEY=$(jq -r '.Credentials.SecretAccessKey' "$JSON_FILE")
    export AWS_SESSION_TOKEN=$(jq -r '.Credentials.SessionToken' "$JSON_FILE")

    # Print out to verify
    echo "AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID"
    echo "AWS_SECRET_ACCESS_KEY: [hidden]"
    echo "AWS_SESSION_TOKEN: [hidden]"
}

aws-unset() {
    unset AWS_DEFAULT_REGION && unset AWS_SECRET_ACCESS_KEY && unset AWS_ACCESS_KEY_ID && unset AWS_SESSION_TOKEN
    echo "removed all aws cli variables"
}

change-theme() {
    NEW_THEME=$1

    THEMEFILE="$ZSHDIR/p10kthemes/$NEW_THEME.zsh"

    if [[ ! -f $THEMEFILE ]] then
        echo "that theme does not exist"
    else
        P10K_FILE="$ZSHDIR/.p10k.zsh"
        if [[ -f $P10K_FILE ]] then
            rm -f $P10K_FILE
        fi
        cat "$THEMEFILE" >> $ZSHDIR/.p10k.zsh
    fi
}

down-line-or-beginning-search() {
    # Like down-line-or-search, but uses the whole line prefix up to the
    # cursor position for searching forwards.

    emulate -L zsh

    typeset -g __searching __savecursor

    if [[ ${+NUMERIC} -eq 0 &&
        ( $LASTWIDGET = $__searching || $RBUFFER != *$'\n'* ) ]]
    then
    [[ $LASTWIDGET = $__searching ]] && CURSOR=$__savecursor
    __searching=$WIDGET
    __savecursor=$CURSOR
    if zle .history-beginning-search-forward; then
        [[ $RBUFFER = *$'\n'* ]] ||
        zstyle -T ':zle:down-line-or-beginning-search' leave-cursor &&
        zle .end-of-line
        return
    fi
    [[ $RBUFFER = *$'\n'* ]] || return
    fi
    __searching=''
    zle .down-line-or-history
}

git-config-initial() {
    git config --global user.name $1
    git config --global user.email $2
    git config --list
}

git-update-completion() {
    /bin/rm -f $ZSHDIR/plugins-custom/_git
    /bin/rm -f $ZSHDIR/plugins-custom/git-completion.bash

    mkdir $ZSHDIR/plugins-custom

    cp $ZSHDIR/plugins/git-completion/git-completion.bash $ZSHDIR/plugins-custom/git-completion.bash
    cp $ZSHDIR/plugins/git-completion/git-completion.zsh $ZSHDIR/plugins-custom/_git

    zstyle ':completion:*:*:git:*' menu select script ~/.config/zsh/plugins-custom/git-completion.bash

    echo "git completion updated"
}

up-line-or-beginning-search() {
    # Like up-line-or-search, but uses the whole line prefix up to the
    # cursor position for searching backwards.

    emulate -L zsh

    typeset -g __searching __savecursor

    if [[ $LBUFFER == *$'\n'* ]]; then
    zle .up-line-or-history
    __searching=''
    elif [[ -n $PREBUFFER ]] &&
        zstyle -t ':zle:up-line-or-beginning-search' edit-buffer
    then
    zle .push-line-or-edit
    else
    [[ $LASTWIDGET = $__searching ]] && CURSOR=$__savecursor
    __savecursor=$CURSOR
    __searching=$WIDGET
    zle .history-beginning-search-backward
    zstyle -T ':zle:up-line-or-beginning-search' leave-cursor &&
        zle .end-of-line
    fi
}

zsh-pull() {
    echo "pulling from NADEE-MJ/zsh"
    ZSHDIR=$HOME/.config/zsh/
    command git -C $ZSHDIR pull --ff --recurse-submodules --depth 1 --rebase --autostash
}

zsh-update() {
    zsh-pull
    zsh-update-plugins
    git-update-completion
}

zsh-update-plugins() {
    ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
    for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
    done
}

#package managers
alias ni="npm install"

alias laravel="[[ ! \"$PWD\" =~ ci2portal/laravel ]] && cd ci2portal/laravel || echo 'Already in Laravel directory' "
alias frontend="[[ ! \"$PWD\" =~ ci2portal/frontend ]] && cd ci2portal/frontend || echo 'Already in Frontend directory' "
alias root="[[ \"$(basename \"$PWD\")\" != \"ci2portal\" ]] && cd ci2portal || echo 'Already in root directory' "
alias sst="[[ ! \"$PWD\" =~ ci2portal/sst ]] && cd ci2portal/sst || echo 'Already in sst directory' "

#laravel commands
alias pa='laravel && php artisan'
alias paa='pa about'
alias worker="pa queue:work --timeout=3600 --queue=notifications,default,pusher"
alias pamfs="pa migrate:fresh --seed"
alias pamf="pa migrate:fresh"
alias pam="pa migrate"
alias pao="pa optimize"
alias paoc="pa optimize:clear"
alias pacc="pa config:cache"
alias paccl="pa config:clear"
alias pat="pa test"
alias patf="pa test --filter"
alias padbs="pa db:seed --class="
alias pasr="pa schedule:run"

#js commands
alias nr="npm run"
alias login="root && nr aws-login:clear"
alias start="root && nr start-with-volumne"
alias stop="root && nr stop"
alias nerd="sst && nr dev -- --stage nadeem"
alias build="frontend && nr build && cd -"
alias nrda="root && nr docker-attach"
alias nci="root && npm ci"
alias prep="root && nr prep"
alias ntp="sst && nr test:python"
alias ntpf="sst && nr test:python  -- -f"
alias cypress="root && nr cypress-headless"
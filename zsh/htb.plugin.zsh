function glob_exists() {
        if test -n "$(find $PWD -maxdepth 1 -name $1)"; then
                return 0
        fi
        return 1
}

function htb_prompt_info() {
        if glob_exists '00-*'; then
                HOST=$(find $PWD -maxdepth 1 -name '00-*' -exec basename {} \;| cut -f2 -d'-')
                NEWRP=" --> ${HOST} 🔒"

                if glob_exists '01-*'; then
                        NEWRP=" --> ${HOST} 🔑"
                fi

                if glob_exists '02-*'; then
                        NEWRP=" --> ${HOST} ✅"
                fi
                echo "$NEWRP"
        fi
}
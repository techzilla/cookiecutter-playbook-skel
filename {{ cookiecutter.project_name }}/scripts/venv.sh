#!/bin/sh
##

TOX_ENV='venv'
VENV=".tox/${TOX_ENV}"

venv_check() {
    [ "$VIRTUAL_ENV" = '' ] && {
        return 1
    }
    return 0
}

venv_create() {
    command -v tox > /dev/null 2>&1 || {
        echo "tox command not found"
        return 1
    }
    tox -e "$TOX_ENV"
    return 0
}

venv_activate() {
    [ -d "$VENV" ] || {
        return 1
    }
. "${VENV}/bin/activate"
return 0
}


venv_check || {
    venv_activate || {
            venv_create && {
                venv_activate
            } || {
                echo "tox environment not found"
            }
    }
}

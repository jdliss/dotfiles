function sshmini {
    if [ -z "$1" ]; then
        ssh jdliss@192.168.1.115
    else
        ssh $1@192.168.1.115
    fi
}

function sshpi {
    if [ -z "$1" ]; then
        ssh jdliss@192.168.1.114
    else
        ssh $1@192.168.1.114
    fi
}

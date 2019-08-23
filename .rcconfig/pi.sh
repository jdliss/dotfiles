function sshpi {
    if [ -z "$1" ]; then
        ssh jdliss@192.168.1.55
    else
        ssh $1@192.168.1.55
    fi
}

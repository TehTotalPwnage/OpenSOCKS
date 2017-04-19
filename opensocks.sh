#!/bin/bash

trap stop SIGTERM

start() {
    openvpn --askpass /opensocks/askpass --config /opensocks/config.ovpn &
    PID[0]=$!
    sleep 10
    danted &
    PID[1]=$!

    for process in ${PID}
    do
        wait $process
    done
}

stop() {
    for process in ${PID}
    do
        kill $process
    done
    echo "OpenSOCKS shut down successfully"
}

case $1 in
    "start")
        shift 1
        start "$@"
        ;;
    *)
        echo "Unrecognized command."
        ;;
esac

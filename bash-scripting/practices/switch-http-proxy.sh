#!/bin/bash

function andronymousproxy(){
    case $1 in
        "--enable" | "-e")
            export http_proxy=proxy.andronymous.ir:8228
            export https_proxy=proxy.andronymous.ir:8228
            export no_proxy="localhost,127.0.0.1,localaddress,.andronymous.ir"
            export HTTP_PROXY=proxy.andronymous.ir:8228
            export HTTPS_PROXY=proxy.andronymous.ir:8228
            export NO_PROXY="localhost,127.0.0.1,localaddress,.andronymous.ir"
            echo "enable andronymous proxy !"
        ;;
        "--disable" | "-d")
            unset http_proxy
            unset https_proxy
            unset no_proxy
            unset HTTP_PROXY
            unset HTTPS_PROXY
            unset NO_PROXY
            echo "disable andronymous proxy !"
        ;;
        *)
            echo "Usage : andronymousproxy [-e | --enable] [-d | --disable]"
            echo "Example : "
            echo "  andronymousproxy --enable for enable andronymous proxy "
            echo "  andronymousproxy --disable for disable andronymous proxy "
        ;;
    esac
}

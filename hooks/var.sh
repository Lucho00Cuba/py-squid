#!/bin/bash

# Example

if [[ $1 == "set" ]]; then
    echo "export SQUID_HTTP='acl safe_ports port 80'"; export SQUID_HTTP='acl safe_ports port 80'
    echo "export SQUID_FTP='acl safe_ports port 21'"; export SQUID_FTP='acl safe_ports port 21'
    echo "export LOG_LEVEL='INFO'"; export LOG_LEVEL='INFO'
    echo "export NO_PROXY='127.0.0.1,localhost'"; export NO_PROXY='127.0.0.1,localhost'
elif [[ $1 == "unset" ]]; then
    echo "unset SQUID_HTTP"; export -n SQUID_HTTP
    echo "unset SQUID_FTP"; export -n SQUID_FTP
    echo "unset LOG_LEVEL"; export -n LOG_LEVEL
    echo "unset NO_PROXY"; export -n NO_PROXY
else
    echo "Not found action"
fi
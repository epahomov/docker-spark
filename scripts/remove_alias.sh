#!/usr/bin/env bash
sed '1d' /etc/hosts > tmpHosts
cat tmpHosts > /etc/hosts
rm tmpHosts

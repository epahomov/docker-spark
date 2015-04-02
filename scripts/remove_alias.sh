#!/usr/bin/env bash
sed '1d' /etc/hosts > tmpfile
cat tmpfile > /etc/hosts

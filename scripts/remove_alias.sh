#!/usr/bin/env bash
sed '1d' /etc/hosts > tmpfile
rm /etc/hosts
mv tmpfile /etc/hosts

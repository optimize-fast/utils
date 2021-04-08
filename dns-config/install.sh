#!/bin/bash

SCRIPT_ABSOLUTE_PATH=$(readlink -f "$0")
DIR_ABSOLUTE_PATH=$(dirname "$SCRIPT_ABSOLUTE_PATH")

echo "Installing stubby and dnsmasq"
dnf install -y stubby dnsmasq

echo "Copying config files"
mv /etc/stubby/stubby.yml /etc/stubby/stubby.yml.old
cp $DIR_ABSOLUTE_PATH/stubby.yml /etc/stubby/stubby.yml
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.old
cp $DIR_ABSOLUTE_PATH/dnsmasq.conf /etc/dnsmasq.conf
mv /etc/resolv.conf /etc/resolv.conf.old
cp $DIR_ABSOLUTE_PATH/resolv.conf /etc/resolv.conf

echo "Disabling systemd-resolved"
systemctl disable systemd-resolved.service
systemctl stop systemd-resolved.service

echo "Enabling stubby and dnsmasq"
systemctl enable stubby.service
systemctl enable dnsmasq.service
systemctl restart stubby.service
systemctl restart dnsmasq.service

echo "Done!"

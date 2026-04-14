#!/bin/bash

sudo mkdir -p /opt/myapp /usr/lib/myapp /etc/ivanov
sudo cp application /opt/myapp/
sudo cp library.lib /usr/lib/myapp/
sudo cp config.conf /etc/ivanov/
sudo chmod 755 /opt/myapp/application
echo "Путь: /opt/myapp/application" >> /etc/ivanov/config.conf

#!/bin/bash

if [ -n "$1" ]; then
    PID=$1
else # с клавиатуры
    echo -n "Введите PID: "
    read PID
fi

if [ ! -d "/proc/$PID" ]; then
    echo "Процесс $PID не найден"
    exit 1
fi

APP=$(cat /proc/$PID/comm 2>/dev/null)
MEM=$(grep VmRSS /proc/$PID/status 2>/dev/null | awk '{print $2}')
OWNER=$(ps -o user= -p $PID 2>/dev/null)
TIME=$(ps -o etime= -p $PID 2>/dev/null)

echo "PID: $PID"
echo "Приложение: $APP"
echo "Память: ${MEM} KB"
echo "Владелец: $OWNER"
echo "Время работы: $TIME"

echo "$(date): PID=$PID APP=$APP MEM=${MEM}KB OWNER=$OWNER TIME=$TIME" | sudo tee -a /var/log/ivanov.log

#!/bin/bash

while true; do
    # Время
    time=$(date '+%H:%M')
    
    # Вывод в статусбар
    xsetroot -name "$time"
    
    sleep 1
done

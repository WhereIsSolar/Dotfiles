#!/bin/bash

# Имя сессии Tmux
SESSION_NAME="system_monitors"

# Проверяем существование сессии
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    echo "Сессия $SESSION_NAME уже запущена. Подключаемся..."
    tmux attach -t "$SESSION_NAME"
    exit 0
fi

# Создаем новую сессию Tmux с первым окном (батарея)
tmux new-session -d -s "$SESSION_NAME" -n "Battery" "watch -n 1 'acpi -b; echo; acpi -t'" 
tmux split-window -v -t "$SESSION_NAME:0" "alsamixer"
tmux split-window -h -t "$SESSION_NAME:0" "watch -n 1 nmcli"

# Создаем второе окно (громкость)
# tmux new-window -t "$SESSION_NAME:1" -n "Volume" "alsamixer"

# Настраиваем расположение окон (вертикальное разделение)
# tmux split-window -v -t "$SESSION_NAME:1" "watch -n 1 amixer sget Master"

# Подключаемся к сессии
tmux attach -t "$SESSION_NAME"

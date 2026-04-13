#!/bin/bash

HOME_DIR="$HOME"
LARGEST_FILE=""
MAX_SIZE=0

for file in "$HOME_DIR"/.[!.]* "$HOME_DIR"/*; do #перебор всех файлов включая скрытые, исключая . и ..
    [ -e "$file" ] || continue #если файл не существует пропускаем
    
    if [ -f "$file" ]; then #проверка если файл
        SIZE=$(stat -c %s "$file" 2>/dev/null) #перенаправление ошибок
        
        if [ "$SIZE" -gt "$MAX_SIZE" ]; then 
            MAX_SIZE=$SIZE
            LARGEST_FILE="$file"
        fi
    fi
done

if [ -n "$LARGEST_FILE" ]; then
    echo "Самый большой файл: $LARGEST_FILE"
else
    echo "Файлы не найдены"
fi
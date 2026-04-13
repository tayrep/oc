#!/bin/bash

APP_NAME="lab1"
SURNAME="Fedechkin" 

EXEC_FILE="application"
LIB_FILE="library.lib"
CONF_FILE="config.conf"

EXEC_DIR="/opt/$APP_NAME"
LIB_DIR="/usr/lib/$APP_NAME"
CONF_DIR="/etc/$SURNAME"
LOG_FILE="/var/log/${SURNAME}_install.log"

mkdir -p "$EXEC_DIR"
cp "$EXEC_FILE" "$EXEC_DIR/"
chmod 755 "$EXEC_DIR/$EXEC_FILE" #установка прав 755 

mkdir -p "$LIB_DIR"
cp "$LIB_FILE" "$LIB_DIR/"
chmod 644 "$LIB_DIR/$LIB_FILE" #установка прав 644

mkdir -p "$CONF_DIR"

EXEC_PATH="$EXEC_DIR/$EXEC_FILE"
LIB_PATH="$LIB_DIR/$LIB_FILE"

cat > "$CONF_DIR/$CONF_FILE" << EOF
# Приложение $APP_NAME

# Путь к файлу
EXECUTABLE_PATH=$EXEC_PATH

# Путь к библиотеке
LIBRARY_PATH=$LIB_PATH
EOF

chmod 644 "$CONF_DIR/$CONF_FILE"
echo "Исполняемый файл: $EXEC_PATH"
echo "Библиотека: $LIB_PATH"
echo "Конфиг: $CONF_DIR/$CONF_FILE"
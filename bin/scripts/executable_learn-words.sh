#!/bin/bash

# Массив объектов со словами и переводами
words=(
    "liver печень"
    "stomach желудок"
    "forgetting забыть"
    "cranky капризный"
    "decade десятилетие"
    "persevering настойчивость"
)

# Временный файл для хранения состояния (0 — показывать оригинал, 1 — перевод)
state_file="/tmp/polybar_translate_state"
if [ ! -f "$state_file" ]; then
  echo "0" > "$state_file"  # Начальное состояние: показываем оригинал
fi

# Чтение текущего состояния
state=$(cat "$state_file")

# Функция для отображения слов в зависимости от состояния
display_words() {
  local output=""
  for word_pair in "${words[@]}"; do
    local pair=($word_pair)
    if [ "$state" -eq 0 ]; then
      output+="${pair[0]} "  # Показать оригинальное слово
    else
      output+="${pair[1]} "  # Показать перевод
    fi
  done
  echo "$output"
}

# Обработка клика для переключения состояния
if [ "$1" == "click" ]; then
  state=$((1 - state))       # Переключить состояние между 0 и 1
  echo "$state" > "$state_file"  # Сохранить новое состояние
fi

# Вывод слов в зависимости от текущего состояния
display_words

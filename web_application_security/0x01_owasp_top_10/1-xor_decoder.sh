#!/bin/bash
input_string=$1
base64_part=${input_string#"{xor}"}
while IFS= read -r -d '' -n 1 char
do
    ascii_val=$(printf '%d' "'$char")
    xor_val=$((ascii_val ^ 95))
    printf "\\$(printf '%03o' "$xor_val")"
done < <(echo "$base64_part" | base64 -d)
printf "\n"

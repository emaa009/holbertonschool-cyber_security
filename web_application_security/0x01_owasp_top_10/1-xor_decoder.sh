#!/bin/bash
input_string=$1
base64_part=${input_string#"{xor}"}
decoded_bytes=$(echo "$base64_part" | base64 -d)
for ((i=0; i<${#decoded_bytes}; i++))
do
    printf -v char "%q" "${decoded_bytes:$i:1}"
    if [ "$char" = '\n' ]
    then
        break
    fi
    ascii_val=$(printf '%d' "'${decoded_bytes:$i:1}")
    xor_val=$((ascii_val ^ 95))
    printf "\\$(printf '%03o' "$xor_val")"
done
printf "\n"

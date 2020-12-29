#!/bin/bash

for each in ../../docs/*.conf.docs; do cat "$each" | sed -E '/^\s*;/d' | sed -E '/^$/d' | sed -E 's/^\[/\n[/' | sed -E 's/^([^\[])/    \1/' | sed -E 's/^ *$//' | sed -E '1{/^[[:space:]]*$/d}'  > $(basename "$each") && rename ".conf.docs" ".conf" $(basename "$each"); done

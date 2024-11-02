#/bin/bash

#Tests models using simples phrases
tool/fasttext predict models/no-dialect.bin teste.txt >result.txt
echo -e "\tNo dialect model:\n"
paste result.txt teste.txt

tool/fasttext predict models/dialect.bin teste.txt >result.txt
echo -e "\tDialect model:\n"
paste result.txt teste.txt

#/bin/bash

#Testar modelos usando simples frases
echo -e "Teste com modelos não quantizados\n"
tool/fasttext predict models/no-dialect.bin teste.txt >result.txt
echo -e "Modelo no-dialect.bin:\n"
paste result.txt teste.txt

tool/fasttext predict models/dialect.bin teste.txt >result.txt
echo -e "Modelo dialect.bin:\n"
paste result.txt teste.txt

echo -e "\nTeste com modelos quantizados"
tool/fasttext predict models/no-dialect.ftz teste.txt >result.txt
echo -e "Modelo no-dialect.ftz:\n"
paste result.txt teste.txt

tool/fasttext predict models/dialect.ftz teste.txt >result.txt
echo -e "Modelo dialect.ftz:\n"
paste result.txt teste.txt

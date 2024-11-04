# LANIN
Classificador de idiomas usado FastText e WikiPron.

## Instalação

```bash
git clone https://github.com/NietteLabs/LANIN.git
cd LANIN
git submodule update --init --recursive
```

# Compilar e preparar WikiPron para o treinamento

```bash
bash build.sh 
```

# Treinar modelos (Com divisão de dialetos e sem divisão de dialetos)

```bash
bash train.sh
```

# Testar com frases do arquivo teste.txt, com os modelos contidos em models/

```bash
bash test.sh
```

#Testar com modelos e texto/arquivo personalizável

```bash
bash bin/lanin.sh modelo arquivo/texto
```
*Exemplo usando um texto de entrada*
```bash
bash bin/lanin.sh models/dialect.bin "oi"
```

*Exemplo usando um texto de entrada*
```bash
bash bin/lanin.sh models/dialect.bin arquivo.txt
```

*Saída*
```
__label__idioma_em_ISO_639_3
```

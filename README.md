# LANIN
Classificado de idiomas usado FastText e WikiPron

.

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

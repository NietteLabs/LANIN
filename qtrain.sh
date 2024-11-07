#/bin/bash

#Train model (dialect, no-dialect)
mkdir models
echo "Quantizando no-dialect quantizado"
tool/fasttext quantize -input data/train/train.corpus -output models/no-dialect
echo "Criando modelo dialect quantizado" 
tool/fasttext quantize -input data/train-dialect/train.corpus -output models/dialect

#/bin/bash

#Train model (dialect, no-dialect)
mkdir models
tool/fasttext supervised -input data/train/train.corpus -output models/no-dialect
tool/fasttext supervised -input data/train-dialect/train.corpus -output models/dialect

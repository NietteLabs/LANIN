#/bin/bash

#Build fastText and dataset.

#Build fastText

mkdir tool
cd tool || exit
make PREFIX="$PWD" -C ../fastText
cp ../fastText/fasttext .
cd .. || exit

#Build dataset.
mkdir data/{test,test-dialect,train,train-dialect} -p
mkdir data/{corpus,corpus-dialect} -p

#Withou dialect
for file in $(ls wikipron/data/scrape/tsv/ | grep -v filtered); do
    echo $file
    # FOR=$(cat wikipron/data/scrape/summary.tsv | grep broad.tsv | grep $file | cut -f3 | sort -u | tr " " "-")
    LANG=$(echo $file | cut -f1 -d"_")
    cat wikipron/data/scrape/tsv/$file | cut -f1 >/tmp/$file.tmp
    sed -i "s/$/ __label__$LANG/" /tmp/$file.tmp
    cp /tmp/$file.tmp data/corpus/$file.train
    #echo -e "__label__"$LANG"\t$FOR" >>data/list.txt.tmp
done
cat data/corpus/*.train | sort -u >>data/train/train.corpus
rm list.txt.tmp

#With dialect
for file in $(ls wikipron/data/scrape/tsv/ | grep -v filtered); do
    echo $file
    ACC=$(echo $file | sed 's/./& /g' | tr " " "\n" | grep -w '_' -c)
    #  FOR=$(cat wikipron/data/scrape/summary.tsv | grep broad.tsv | grep $file | cut -f3 | sort -u | tr " " "-")
    if [ $ACC = 3 ]; then
        LANG=$(echo $file | cut -f1 -d"_")
        AC=$(echo $file | cut -f3 -d"_")

        cat wikipron/data/scrape/tsv/$file | cut -f1 >/tmp/$file.tmp
        sed -i "s/$/ __label__"$LANG"_"$AC"/" /tmp/$file.tmp
        cp /tmp/$file.tmp data/corpus-dialect/$file.train
        #  echo -e "__label__"$LANG"_"$AC"\t$FOR" >>data/list-dialect.txt
    else
        LANG=$(echo $file | cut -f1 -d"_")
        cat wikipron/data/scrape/tsv/$file | cut -f1 >/tmp/$file.tmp
        sed -i "s/$/ __label__$LANG/" /tmp/$file.tmp
        cp /tmp/$file.tmp data/corpus-dialect/$file.train
        #   echo -e "__label__"$LANG"\t$FOR" >>data/list-dialect.txt
    fi
done
cat data/corpus-dialect/*.train | sort -u >>data/train-dialect/train.corpus

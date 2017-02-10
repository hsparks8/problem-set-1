#! /usr/bin/env bash 


datasets='/vo12/home/hsparks8/data-sets'

# question 1.  which state in states.tab.gz has the lowest murder rate

states="$datasets/misc/states.tab.gz"

answer_1=$(zcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2n \
    | grep -v '^#' \
    | cut -f1 \
    | head -n1 \
    | sed 's/"//g')
    
echo "answer-1: $answer_1"

# question 2. how many sequence records are in sample.fa?

Sample="$datasets/fasta/sample.fa"


answer_2=$(zcat $sample \
    | grep '^>' \
    | wc -1)

echo "answer-2: $answer_2"

# question 3. how many unique CpG IDs are in cpg.bed.gz?

CpG="$datasets/bed/cpg.bed.gz"

answer_3=$(zcat $CpG \
    | cut -f4 \
    | sort -k1n \
    | uniq \
    | wc -1)

echo "answer-3: $answer_3"

# question 4. how many sequence records are in the SP1.fq file?

SP1="$datasets/fastq/SP1.fq"

answer_4=$(cat $SP1 \
    | grep '^@cluster' \
    | wc -1)

echo "answer-4: $answer_4"

# question 5. how many words are on lines containing the word 'bloody' in
# hamlet.txt

Ham="$datasets/misc/hamlet.txt"

answer_5=$(grep "bloody" $Ham \
    | wc -w)

echo "answer-5: $answer_5"









#! /usr/bin/env bash 


datasets="/vol2/home/hsparks8/data-sets"

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

sample="$datasets/fasta/sample.fa"


answer_2=$(grep '^>' $sample \
    | wc -l)

echo "answer-2: $answer_2"

# question 3. how many unique CpG IDs are in cpg.bed.gz?

CpG="$datasets/bed/cpg.bed.gz"

answer_3=$(zcat $CpG \
    | cut -f4 \
    | sort -k4 \
    | uniq \
    | wc -l)

echo "answer-3: $answer_3"

# question 4. how many sequence records are in the SP1.fq file?

SP1="$datasets/fastq/SP1.fq"

answer_4=$( grep '^@cluster' $SP1 \
    | wc -l)

echo "answer-4: $answer_4"

# question 5. how many words are on lines containing the word 'bloody' in
# hamlet.txt

Ham="$datasets/misc/hamlet.txt"

answer_5=$(grep "bloody" $Ham \
    | wc -w)

echo "answer-5: $answer_5"

#question 6.

sample="$datasets/fasta/sample.fa"

answer_6=$(grep -v '^>' $sample \
    | head -n 1 \
    | wc -m)

echo "answer-6: $answer_6"

#question 7.

genes="$datasets/bed/genes.hg19.bed.gz"

answer_7=$(zcat $genes \
    | awk '{OFS="\t"}{print $2 -$1, $3}' \
    | sort -k1nr \
    | cut -f2 \
    | head -n 1)

echo "answer-7: $answer_7"

#question 8. 

genes="$datasets/bed/genes.hg19.bed.gz"

answer_8=$(zcat $genes \
    | cut -f1 \
    | sort -u \
    | wc -l)

echo "answer-8: $answer_8"

#question 9.

peaks="$datasets/bed/peaks.chr22.bed.gz"

answer_9=$(zcat $peaks \
    | grep -v 'CTCFL' \
    | grep 'CTCF' \
    | wc -l)

echo "answer-9: $answer_9"

#question 10.

lamina="$datasets/bed/lamina.bed"

answer_10=$( grep -v '^#' $lamina \
    | awk '{print $1, $2, $3}' \
    | awk '{OFS="\t"} {print $1, $3 - $2}' \
    | sort -k2 \
    | cut -f1 \
    | head -n 1)

    echo "answer-10: $answer_10"





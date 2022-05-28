#
# Usage: singlechannel.sh input-kaldi-directory output-kaldi-directory
#

#
# Generate new directory if needed
#

mkdir -p $2

#
# Process utt2spk
#

sed 's/ /-1 /' $1/utt2spk > tmp; sed 's/$/-1/' tmp > $2/utt2spk
for i in {2..8}
do
    sed "s/ /-$i /" $1/utt2spk > tmp; sed "s/$/-$i/" tmp >> $2/utt2spk    
done    
sort $2/utt2spk -o $2/utt2spk
echo "Created utt2spk"

#
# Process text
#

sed 's/ /-1 /' $1/text > $2/text
for i in {2..8}
do
    sed "s/ /-$i /" $1/text >> $2/text    
done    
sort $2/text -o $2/text
echo "Created text"

#
# Process wav.scp
#0

sed 's/ /-1 sox /' $1/wav.scp > tmp; sed 's/\.wav/\.wav -t wav - remix 1 |/' tmp > $2/wav.scp
for i in {2..8}
do
    sed "s/ /-$i sox /" $1/wav.scp > tmp; sed "s/\.wav/\.wav -t wav - remix $i |/" tmp >> $2/wav.scp
done    
sort $2/wav.scp -o $2/wav.scp
echo "Created wav.scp"

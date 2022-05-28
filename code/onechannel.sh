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

cp $1/utt2spk $2/utt2spk
echo "Created utt2spk"

#
# Process spk2utt
#

cp $1/spk2utt $2/spk2utt
echo "Created spk2utt"

#
# Process text
#

cp $1/text $2/text
echo "Created text"

#
# Process wav.scp
#

sed 's/ / sox /' $1/wav.scp > tmp; sed "s/\.wav/\.wav -t wav - remix $3 |/" tmp > $2/wav.scp

echo "Created wav.scp"

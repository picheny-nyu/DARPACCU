# DARPACCU

Various pieces of code and experimental results for running DARPACCU experiments.

**Code**

code/singlechannel.sh <input-dir> <output-dir> - takes Kaldi style data in <input-dir> for 8-channel AISHELL4 data and creates 8 single channels and merges them all together to <output-dir>

code/avgchannel.sh <input-dir> <output-dir> - takes Kaldi style data in <input-dir> for 8-channel AISHELL4 data and creates one channel by summation to <output-dir>

code/onechannel.sh <input-dir> <output-dir> <channel> - takes Kaldi style data in <input-dir> for 8-channel AISHELL4 data and extracts <channel> to <output-dir>

**Experiments**

In one set of experiments, we trained a full GALE model in Kaldi using the mandarin_bn_bc recipe and used this to decode AISHELL4 data. We did not attempt to adapt the AM or LM to AISHELL4 data.

Here are the results

|Experiments|CER:|
|-----------|----|
|All 8      |72.8|
|Average    |74.2|
|Channel 1  |72.6|
|Channel 2  |72.7|
|Channel 3  |72.7|
|Channel 4  |72.8|
|Channel 5  |73.0|
|Channel 6  |72.8|
|Channel 7  |73.0|
|Channel 8  |72.8|

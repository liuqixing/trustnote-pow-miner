mkdir output
cl /w /c /MT /EHsc /D "WIN32" /I "include/" ./include/crypto/blake2b.c
cl /w /c /MT /EHsc /D "WIN32" /I "include/" ./include/utility.cpp
cl /w /c /MT /EHsc /D "WIN32" /I "include/" ./include/trustnote-miner-deposit.cpp
cl /w /c /MT /EHsc /D "WIN32" /I "include/" ./include/trustnote-difficulty-bomb.cpp
cl /w /c /MT /EHsc /D "WIN32" /I "include/" ./include/uint256.cpp
cl /w /c /MT /EHsc /D "WIN32" /I "include/" ./include/utilstrencodings.cpp
cl /w /c /MT /EHsc /D "WIN32" /I "include/" ./include/arith_uint256.cpp
cl /w /c /MT /EHsc /D "WIN32" /I "include/" ./miner.cpp

link /DLL /OUT:"output/miner.Windows.x64.release.dll" /NXCOMPAT /DYNAMICBASE /DEBUG /MACHINE:X64 /INCREMENTAL /SUBSYSTEM:CONSOLE /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /ERRORREPORT:PROMPT /NOLOGO /TLBID:1 miner.obj blake2b.obj utility.obj trustnote-miner-deposit.obj trustnote-difficulty-bomb.obj uint256.obj utilstrencodings.obj arith_uint256.obj ../asm/equihash/Windows/equihash_avx2.obj

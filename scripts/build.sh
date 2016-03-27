#!/usr/bin/env bash

cd cpp
g++ wordcount_map.cpp -std=c++11 -o wc_baseline -O3
g++ wordcount_hashtable.cpp -std=c++11 -o wc_baseline_hash -O3
g++ wordcount_hashtable_nosync_stdio.cpp -std=c++11 -o wc_hash_nosync -O3
g++ wordcount_vector.cpp -std=c++11 -o wc_vector -O3

cd ../d
dmd -O -release -inline -boundscheck=off wordcount.d

cd ../java
javac WordCount.java
javac WordCountEntries.java

cd ../javascript
npm install

cd ../typescript
npm install

cd ../go
export GOPATH=$(pwd)
go install wordcount

cd ../csharp
mcs WordCountList.cs

cd ../haskell
cabal install --verbose=0
cp dist/build/WordCount/WordCount .

cd ../rust/wordcount
cargo build --release
cp target/release/wordcount .
cd ..

cd ../scala
scalac Wordcount.scala

#!/bin/bash

declare -A sound;

sound["Lion"]="Roar";
sound["Dog"]="Bark";
sound["Wolf"]="Howl";

echo ${sound[@]};

echo "Size of dictionary : "${#sound[@]};

echo ${!sound[@]};

for ((i=0;i<${#sound[@]};i++))
do
	echo $i : ${!sound[@]};
done

for key in ${!sound[@]}
do
	echo "Sound of "$key "is "${sound[$key]} ;
done

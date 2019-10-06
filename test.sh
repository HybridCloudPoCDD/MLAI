#!/bin/bash
echo "Let's check the corrosion"
wget $1
echo $(echo $1  | awk -F "/" '{print $NF}')
inputfile=$(echo $1  | awk -F "/" '{print $NF}')
echo $inputfile
#/bin/python ../predict_resnet50.py $inputfile  2>/dev/nul
#/bin/python ../predict_long_resnet50.py $inputfile
likelihood=$(/bin/python ../predict_long_resnet50.py $inputfile 2>/dev/nul | grep -w "res-metallic" | awk '{print $1}') 
echo "Likelihood of clean metallic surface:"
echo $likelihood
#out=$(echo $likelihood'>'0.75 | bc -l)

out=$(echo $likelihood'*'100/1 | bc -l)

outr=$(printf "%.0f\n" "$out")
echo "Likelihood percentage of the clean metallic surface"
echo $outr

if [ "$outr" -gt "75" ]
then
	echo "---------------------------------------------------------"
	echo "Metallic surface, no sign of corrosion"
	echo "---------------------------------------------------------"
elif  [ "$outr" -le "75" ] && [ "$outr" -ge "25" ]
then
	echo "---------------------------------------------------------"
	echo "I am not sure..."
	echo "---------------------------------------------------------"
else
	echo "---------------------------------------------------------"
	echo "Corrosion on the surface"
	echo "---------------------------------------------------------"
fi


#!/bin/bash
g++ -std=c++11 -O2 -Wall main.cpp &&
echo -e '\033[92m------------ COMPILATION SUCCESSFUL!!! ------------\033[0m'
T=$(date +%s%N) &&
./a.out
echo -e "\033[92m(Execution time $((($(date +%s%N) - T) / 1000000)) ms)\033[0m"

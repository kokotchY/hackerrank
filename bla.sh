#!/bin/sh

read exp
echo "scale = 3; $exp" | bc -l

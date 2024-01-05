#Python wrapper for Assignment 5

import subprocess

#Set the matlab executable from personal computer os 
matlab_executable ='/Applications/MATLAB_R2023b.app/bin/matlab'

#open first matlab program which will open the mickey-1.png for the other programs (C, Haskell, Prolog)
with open('assign5matlab.m', 'r') as file:
    matlabcode = file.read()

#Open file (w/o) displaying on screen as detailed by flags
matlab_process = subprocess.Popen([matlab_executable, '-nodisplay', '-nosplash', '-nodesktop'], stdin=subprocess.PIPE, text=True)

matlab_process.communicate(input=matlabcode)

#Open 'input.txt' produced by Matlab script#1 to get input_array that C, Haskell, and Prolog with manipulate
with open('input.txt', 'r') as file:
    line = file.readline()
    input_array = [int(value) for value in line.split()]

#Run cprog.c to print/write value 255 if pixle is larger than the 170 threshold else its a 0
subprocess.run(["gcc", "cprog.c", "-o","cprog"])
process = subprocess.run(["./cprog"]+[str(x) for x in input_array], capture_output=True, text=True)
output_variable = process.stdout.strip()
#write values to c_output.txt (Matlab will open this file to show mickey)
with open('c_output.txt', 'w') as f:
    f.write(output_variable)

#Run haskellprog.hs to print vaules from input.txt subtracted by 255
subprocess.run(['ghc', 'haskellprog.hs'])
process=subprocess.run(['./haskellprog']+[str(x) for x in input_array], text=True,capture_output=True)
result=process.stdout.strip()
#write values to haskell_output.txt to get color inverted mickey that will display through Matlab
with open('haskell_output.txt', 'w') as f:
    f.write(result)

#Run prologprog.pl to reverse the list of values provided from input.txt 
prolog_input="[" + ",".join(map(str, input_array)) + "]."
process=subprocess.run(['swipl', '-q', '-g', 'main', '-t', 'halt', 'prologprog.pl'], input=prolog_input, capture_output=True, text=True)
prolog_output=process.stdout.strip()
#Remove brackets and commas of prolog output that we saw in the initial prolog output so that there are only nums/ints for matlab to place into matrix
char_removal = ["[","]"]
for char in char_removal:
    prolog_output=prolog_output.replace(char, '')

fixed_prolog_output=prolog_output.replace(',', ' ')
#write values to prolog_output.txt to get the flipped image that will display in Matlab
with open('prolog_output.txt', 'w') as f:
    f.write(fixed_prolog_output)

#Run c code, haskell code(inverted color image) and prolog code(flipped image) and place into 2D matrix to show 
with open('secondmatlabcode.m', 'r') as file:
    matlabcode = file.read()

Matlab_process=subprocess.Popen([matlab_executable], stdin=subprocess.PIPE, text=True)

Matlab_process.communicate(input=matlabcode)

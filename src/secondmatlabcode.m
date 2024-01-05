% Display OG mickey image for comparison
original_txt = fileread('input.txt');

original_array = uint8(str2num(original_txt));

original_resized_matrix = reshape(original_array, 256,256);

% Read output produced by c program and written to c_output.txt
% by python wrapper.py program
txt = fileread('c_output.txt');

array = uint8(str2num(txt));

resized_matrix = reshape(array, 256,256);

% Read output produced by Haskell program (inverted color img) and 
% written to haskell_output.txt by python wrapper.py program
txt2 = fileread('haskell_output.txt');

array2 = uint8(str2num(txt2));

resized_matrix2 = reshape(array2, 256,256);

% Read output produced by Prolog program (flipped img) and 
% written to prolog_output.txt by python wrapper.py program
txt3 = fileread('prolog_output.txt');

array3 = uint8(str2num(txt3));

resized_matrix3 = reshape(array3, 256,256);

% Plot All Three images/2D matrix produced by 
% the programs and the output stored(C, Haskell, Prolog)
subplot(2,2,1);
imshow(original_resized_matrix);
title('Original Image (for refrence)');

subplot(2,2,2);
imshow(resized_matrix);
title('Black & White Image from C');

subplot(2,2,3);
imshow(resized_matrix2);
title('Inverted Color Image from Haskell');

subplot(2,2,4);
imshow(resized_matrix3);
title('Flipped Image from Prolog');

% Hold for a few seconds (I made it longer so that I could take the screen capture for assignment submission)
pause(10);

% Close matlab/file after running
exit;
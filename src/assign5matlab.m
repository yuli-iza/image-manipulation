% Open file (image) and process greyscale image 
img = imread("mickey-1.png");
% Image pixel vaules represented as a matrix, and convert to 1D array
img_id = reshape(img, 1, []);
% Store 1D array in text file 'input.txt' for 
% C, Haskell, and Prolog programs to manipulate
dlmwrite('input.txt', img_id, 'delimiter', ' ');

% Close matlab/file after running
exit;
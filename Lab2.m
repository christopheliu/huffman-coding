clear all; close all; clc;
input1 = 'HUFFMAN IS THE BEST COMPRESSION ALGORITHM' ;
[num1,prob1] = myEntropy_original(input1);

input2 = 'TODAY WAS A GOOD DAY';
[num2,prob2] = myEntropy_original(input2);

%%
img1 = imread('MBG500.tif');

[num3,prob3] = myEntropy_original(img1);

plot(num3);
%%
out1 = HuffTree(input1);

%%
clear all; close all; clc;
str = 'HUFFMAN IS THE BEST COMPRESSION ALGORITHM';
codebook = HuffmanCompressionAlgorithm(str);
%disp(out4);
sum = 0;
for i=1:numel(codebook(:,2))
    sum = sum + strlength(codebook(i,2));
end

%%
out3 = HuffmanCompressionAlgorithm(input1);
disp(out3);

out5 = CompressionRatio(out3);
text = ['Compression Ratio is : ', num2str(out5)];
disp(text);






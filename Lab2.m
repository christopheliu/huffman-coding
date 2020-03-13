
input1 = 'HUFFMAN IS THE BEST COMPRESSION ALGORITHM' ;
[num1,prob1] = myEntropy(input1);

input2 = 'TODAY WAS A GOOD DAY';
[num2,prob2] = myEntropy(input2);

%%
img1 = imread('MBG500.tif');

[num3,prob3] = myEntropy(img1);

plot(num3);
%%
out1 = HuffTree(input1);

%%

out4 = HuffmanCompressionAlgorithm(input2);
disp(out4);

%%
out3 = HuffmanCompressionAlgorithm(input1);
disp(out3);

out5 = CompressionRatio(out3);
text = ['Compression Ratio is : ', num2str(out5)];
disp(text);






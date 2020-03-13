function out = CompressionRatio(in)
s = size(in,1);
post = 0;
pre = zeros(s(1));
for i = 1:s
    post = post + strlength(in(i,2));
    pre(i) = length(dec2bin(uint8(cell2mat(in(i,1)))));
    if pre(i) == 0
        pre(i) = 8;
    end
end
pre1 = sum(pre(:));
out = pre1/post;
end
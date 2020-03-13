function [out,outt] = myEntropy(X)

inp = double(X);
s = size(inp,2);
maxx = max(inp,[],'all');
x = transpose(1:maxx);
xx = sum(inp(:).' == x,2);
for i = 1:s
   L(i)= xx(inp(i));
end
out = transpose(L);
outt = transpose(L/s);
end
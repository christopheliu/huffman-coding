function out = HuffmanCompressionAlgorithm(in)
A = double(in);
[C, ia, ic] = unique(A,'stable');
C = transpose(C);
xx = sum(A(:).' == C,2);
num1 = xx;
n = size(xx,1);
tree = zeros((2*n)-1,4);
tree(:,2:4) = -1;
tree(1:n,1) = num1;
for i = 1:n-1
    if mink(num1,2) ~= 1000 
    [lowest2,lowest2pos] = mink(num1,2); 
    num1(lowest2pos(1)) = 1000;
    num1(lowest2pos(2)) = 1000;
    tree(n+i,1) = lowest2(1)+lowest2(2);
    num1(n+i,1) = lowest2(1)+lowest2(2);
    tree(n+i,3) = lowest2pos(1);
    tree(n+i,4) = lowest2pos(2);
    tree(lowest2pos(1),2) = n+i;
    tree(lowest2pos(2),2) = n+i;
    end
end
% 2 is equivalent for zero, 1 is equivalent for one.
s = size(tree,1);
tree(tree(end,3),5) = 2;
tree(tree(end,4),5) = 1;

for i = 1:s
    if tree(s+1-i,3) ~= -1
    tree( tree(s+1-i,3) ,5) = ( tree(s+1-i,5) *10 ) +2;
    tree( tree(s+1-i,4) ,5) = ( tree(s+1-i,5) *10 ) +1;
    end
end
Five = transpose(tree(:,5));
string5 = num2str(Five);
ss = strlength(string5);
for i = 1:ss
    if string5(i)== '2'
        string5(i) = '0';
    end
end

Cell5 = split(string5);
Final(:,2) = Cell5(ic);

for i = 1:strlength(in)
    Final(i,1) = cellstr(in(i));
end
out = Final;

end
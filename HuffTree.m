function out = HuffTree(X)
[num1,prob1] = myEntropy(X); %#ok<ASGLU>

n = size(X,2);
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
out = tree;
end
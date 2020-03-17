function [codebook] = huffman_encode( p )
n=length(p);
codebook=cell(1,n);%Where the codewords are going to be stored
X=zeros(n,n);%This matrix helps us track which elemnts we have worked on
temp=p;%We will work on temp not to temper with original p
for i=1:n-1
    [~ ,l]=sort(temp);
    X(l(1),i)=10;
    X(l(2),i)=11;
    temp(l(2))=temp(l(2))+temp(l(1));
    temp(l(1))=100;
end

i=n-1;
rows=find(X(:,i)==10);
codebook(rows)=strcat(codebook(rows),'1');
rows=find(X(:,i)==11);
codebook(rows)=strcat(codebook(rows),'0');
for i=n-2:-1:1
    row11=find(X(:,i)==11);
    row10=find(X(:,i)==10);
    codebook(row10)=strcat(codebook(row11),'1');
    codebook(row11)=strcat(codebook(row11),'0');
end
end
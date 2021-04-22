function M = initialM_1(X,k)
% use k-means++ to initialize the centre points.
[d,n] = size(X);
M =  zeros(d,k);
ran =  randperm(n,1);
M(:,1) = X(:,ran);
M1 = [];
for i = 1:k-1
M1 = [M1 M(:,1:i)];
m = M(:,i);
d1 = pdist2( X', m', 'euclidean' );
if i ==1
    m_num = find(d1 == max(d1));
    M(:,i+1) = X(:,m_num(1));
else
    d1 = min(d1,d0);
    m_num = find(d1 == max(d1));
    M(:,i+1) = X(:,m_num(1));
end
d0 = d1;
end

end
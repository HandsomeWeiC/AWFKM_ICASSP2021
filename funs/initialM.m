function M = initialM(X,k)
[idx,C]= kmeans(X',k);
M = C';
end

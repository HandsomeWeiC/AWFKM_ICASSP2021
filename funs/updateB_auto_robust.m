function B = updateB_auto_robust(X,Y,M)
dx = sum(X.^2,2);
[m,k] = size(M);
a = zeros(m,1);
for c = 1:k
   a = a+sum(X.*M(:,c)*Y(:,c)*2,2); 
end
a = a+0.00000001;
dx = dx + 0.000000001;
b = EProjSimplexdiag(a,2*dx);
B = diag(b);
end

% 下面两个是一样的函数功能
% function a = updateThe(X,M,Y)
%  [d,k] = size(M);
% a = zeros(d,1);
% for c = 1:k
%     a = a + sum(X.*M(:,c)*Y(:,c)*2,2);
% end
% end
% 
% function a = updateB(X,M,Y)
% [m,k] = size(M);
% [m,n] = size(X);
% a = zeros(m,1);
% for i = 1:n
%     for c = 1:k
%         bb = 2*X(:,i)*M(:,c)'*Y(i,c);
%         a = a+diag(bb);
%     end
% end
% end

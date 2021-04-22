function B = updateB_auto_robust(X,Y,M)
dx = sum(X.^2,2);
[m,k] = size(M);
a = zeros(m,1);
for c = 1:k
   a = a+sum(X.*M(:,c)*Y(:,c)*2,2); 
end
b = EProjSimplexdiag(a,2*dx);
B = diag(b);
end

% ����������һ���ĺ�������
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
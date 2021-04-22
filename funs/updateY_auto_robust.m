function Y = updateY_auto_robust(X,M,gama,D)

[~,n] = size(X);
[~,c] = size(M);
Y = zeros(c,n);   
% Y1 = zeros(c,n);  

% thres = ( max(max(0.5.*D)) - min(min(0.5.*D)) );
% D( (0.5.*D)>thres ) = 0 ; 

for i = 1:n
    dnew = - 0.5.*D(i,:)'/(sqrt(2*gama));
    [anew,~] = EProjSimplex_new(dnew,sqrt(2*gama));
    Y(:,i) = (anew./sqrt(2*gama));
end
% for i = 1:n
%     dnew = - 0.5.*D(i,:)'/(2*gama);
%     [anew,~] = EProjSimplex_new(dnew,1);
%     Y1(:,i) = (anew);
% end
% a = norm(Y-Y1,'fro');
end

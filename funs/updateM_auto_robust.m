function M_new = updateM_auto_robust(X,Y,M,B)
[m,~] = size(M);

% Y = Y./(D'+0.0000001);       
Bup = B*X * Y';           % m*c
Bdown = sum(Y,2);  % c*1
mm = repmat(Bdown',m,1)+0.0000001;
M_new = Bup./mm; % m*c
h = M_new;% delete


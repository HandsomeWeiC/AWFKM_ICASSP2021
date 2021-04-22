function [outY,outM,outB,outObj,outNumIter] = AWFKM_v4(X,Y,M,B,gama,maxIter)
% [m,n] = size(X);[m,c]=size(B);
[c,n] = size(Y);
thresh = 10^-4;
obj = zeros(maxIter,1);

D = pdist2( (B*X)', M', 'sqeuclidean' );   % D:n*c
for t = 1:maxIter
    %-------- update Y when fixed M and B--------%
    Y = updateY_auto_robust(X,M,gama,D);
    %-------- update M when fixed Y and B--------%
    M = updateM_auto_robust(X,Y,M,B);
    %-------- update B when fixed Y and M--------%
    B = updateB_auto_robust(X,Y',M);%สนตรY: n*c   X:m*n   M: m*c
    %------- calculate the obj --------%
    D = pdist2((B*X)', M', 'sqeuclidean' );  % D:n*c 
    for i = 1:n
        obj(t) = obj(t) + D(i,:)*Y(:,i) + Y(:,i)'*Y(:,i)*gama; 
    end
%     D = TempD;     
    if(t > 1)
        diff = abs(obj(t-1)-obj(t))/obj(t);
        if(diff < thresh)
            break;
        end
    end
end

outNumIter = t;
outObj = obj(1:t);
outY = Y';
outM = M;
outB = B;
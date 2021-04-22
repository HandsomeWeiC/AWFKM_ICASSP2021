function [x ft] = EProjSimplex_new(v, k)

%
%% Problem
%
%  min  1/2 || x - v||^2
%  s.t. x>=0, 1'x=k
%

if nargin < 2
    k = 1;
end;

ft=1;
n = length(v);

v0 = v-mean(v) + k/n;
%vmax = max(v0);
vmin = min(v0);
if vmin < 0
    f = 1;
    lambda_m = 0;
    while abs(f) > 10^-5
        v1 = v0 - lambda_m;
        posidx = v1>0;
        npos = sum(posidx);
        g = -npos;
        f = sum(v1(posidx)) - k; % ��������Լ������
        lambda_m = lambda_m - f/g;
        ft=ft+1;
        if ft > 10
            x = max(v1,0);
            break;
        end;
    end;
%     fprintf('v1:%.6f\n',sum(v1));
    x = max(v1,0);
    
else
    x = v0;
%     fprintf('v0:%.6f\n',sum(v0));
end;
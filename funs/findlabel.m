function label = findlabel(Y)
[n,k]=size(Y);
label=zeros(n,1);
for i = 1:n
    yi = Y(i,:);
    num = find(yi==max(yi));
    if length(num) ~= 1
        num1 = num(1);
    else 
        num1 = num;
    end
    label(i) = num1;
end
end
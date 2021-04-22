function final = abstract(result)
[~,idx]=sort(result(:,1),'descend');
final = result(idx(1:20),:);
end
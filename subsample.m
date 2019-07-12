function [newdata] = subsample(data,k)
%  randomly selects k instances from the data 
s = size(data);
num_rows = s(1);
sub_nums = randperm(num_rows,k);
newdata = [];
for c = 1:k
    newdata = [newdata;data(sub_nums(c))];
end

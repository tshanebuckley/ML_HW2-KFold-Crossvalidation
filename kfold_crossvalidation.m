
function [train,test] = kfold_crossvalidation(data,k,m)
% uses data, k, and m as inputs to output train and test data using the
% k-fold cross-validation scheme
% assumes data given is already randomized
% k = the number of folds
% m = the target fold
% check on the relationship between size of data and number of folds
s = size(data);
s = s(1);
% fold is actually the real fold size - 1 for index generation
s_fold = floor(s/k) - 1;
% initialize remainder for size of data/size of folds
remainder = mod(s,k);
% end-load bins of size k+1 using relationship between m and remainder to
% calculate index1 and index2
if m >= remainder && remainder ~= 0
    % n = correction value for index1
    n = m - remainder;
    % x = correction value for index2
    x = 1;
else 
    n = 0;
    x = 0;
end
% calculate index1 and index2
index1 = s_fold*(m-1)+m+n
index2 = index1+s_fold+x
%initialize train and test
train = [];
test = [];
% use the indexes to split the data and return test and training sets
% testing set for target fold m
for c = index1:index2
    test = [test;data(c)];
end
if index1 == 1 %training set was pulled from beginning
    for c = (index2+1):s
        train = [train;data(c)];
    end
elseif index2 == s %training set was pulled from end
    for c = 1:(index1-1)
        train = [train;data(c)];
    end
else %training set was pulled from middle
    %first half
    for c = 1:(index1-1)
        train = [train;data(c)];
    end
    %second half
    for c = (index2+1):s
        train = [train;data(c)];
    end
end
    %train
    %test
end


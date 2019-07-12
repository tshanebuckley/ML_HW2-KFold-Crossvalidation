% import mean_study_data.txt
data = importdata('mean_study_data.txt');
% calculate mean and standard deviation
data_mean = mean(data)
data_std = std(data)
% use subsample function to randomly generate 1000 subsamples(25) of the data
sub_25 = [];
for c = 1:1000
    sub_25 = [sub_25,subsample(data,25)];
end
% calculate the mean of each subsample(25) and save the results in the vector of 1000 means
sub_mean_25 = [];
for c = 1:1000
    sub_mean_25 = [sub_mean_25,mean(sub_25(c))];
end
% plot a histogram of 1000 mean values using 20 bins (25)
figure()
histfit(sub_mean_25,20)
title('1000 Subsamples of Size 25');
% mean and std of the 1000 mean samples (25)
sub_mean_mean_25 = mean(sub_mean_25)
sub_mean_std_25 = std(sub_mean_25)
% use subsample function to randomly generate 1000 subsamples(40) of the data
sub_40 = [];
for c = 1:1000
    sub_40 = [sub_40,subsample(data,40)];
end
% calculate the mean of each subsample(40) and save the results in the vector of 1000 means
sub_mean_40 = [];
for c = 1:1000
    sub_mean_40 = [sub_mean_40,mean(sub_40(c))];
end
% plot a histogram of 1000 mean values using 20 bins (40)
figure()
histfit(sub_mean_40,20)
title('1000 Subsamples of Size 40');
% mean and std of the 1000 mean samples (40)
sub_mean_mean_40 = mean(sub_mean_40)
sub_mean_std_40 = std(sub_mean_40)
% extract fisrt 25 examples from the data
data_first_25 = [];
for c = 1:25
    data_first_25 = [data_first_25;data(c)];
end
% calculate the mean of the first 25 examples
mean_data_first_25 = mean(data_first_25)
% t-test for 95% CI for the mean estimates
disp('Null Hypothesis: 15 does not fall within a 95% CI generated from first 25 examples')
null = ttest(data_first_25,15)
if null == 1
    disp('The Null Hypothesis rejected: 15 falls within the 95% CI')
elseif null == 0
    disp('The Null Hypothesis NOT rejected: 15 does not fall within the 95% CI')
end
% new data imported from resampling-data.txt
data = importdata('resampling-data.txt');
mean_train = [];
std_train = [];
mean_test = [];
std_test = [];
for c = 1:10
    [train,test] = kfold_crossvalidation(data,10,c);
    mean_train = [mean_train;mean(train)];
    std_train = [std_train;std(train)];
    mean_test = [mean_test;mean(test)];
    std_test = [std_test;std(test)];
end
% results
mean_train
std_train
mean_test
std_test
% means of the results
mean_mean_train = mean(mean_train)
mean_std_train = mean(std_train)
mean_mean_test = mean(mean_test)
mean_std_test = mean(std_test)
% knowing from class that the ML of a coin (H or T) is a bernouli dist with
% the final equation of Theta = #of_heads/total, calculate the ML from the
% data contained in  coin.txt
data = importdata('coin.txt');
s = size(data);
s = s(1);
heads = 0;
for c = 1:s
    if data(c) == 1
        heads = heads + 1;
    end
end
theta = heads/s
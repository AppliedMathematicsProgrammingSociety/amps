clc
clear all
close all
disp('Given,')
pop_mean=input('The population mean = ');
pop_std_dev=input('The population standard deviation = ');

sample=[21 18 19 16 18 24 22 19 24 14 18 15];
sample_mean=sum(sample)/length(sample);



fprintf('\nThe KEY part is stating the null and alternative hypotheses.\n')
fprintf('\nThere is NO hard and fast rule in chossing the the null hypothesis(H0) and the alternative hypothessis(H1).\n ')
fprintf('*** This often helps,\n\n\n')
fprintf('=================================================================================================\n')
fprintf('Verbal Statement                  |       Mathematical Statements    |      Verbal Statement  \n') 
fprintf('H0 The mean is . . .              |                                  |      H1 The mean is . . .\n')
fprintf('=================================================================================================\n')
fprintf('  ...greater than or equal to k.  |      H0: µ >= k                  |     ...less than k.\n')
fprintf('  ...at least k.                  |      H1: µ <  k                  |     ...below k.\n')
fprintf('  ...not less than k.             |                                  |     ...fewer than k.\n')
fprintf('-------------------------------------------------------------------------------------------------\n')
fprintf('  ...less than or equal to k.     |      H0: µ <= k                  |     ...greater than k.\n')
fprintf('  ...at most k.                   |      H1: µ >  k                  |     ...above k.\n')
fprintf('  ...not more than k.             |                                  |     ...more than k.\n')
fprintf('-------------------------------------------------------------------------------------------------\n')
fprintf('  ...equal to k.                  |      H0: µ = k                   |     ...not equal to k.\n')
fprintf('  ...k.                           |      H1: µ /=  k                 |     ...different from k.\n')
fprintf('  ...exactly k.                   |                                  |     ...not k.\n')
fprintf('=================================================================================================\n')

fprintf('\n\nIf H0: µ >= k &  H1: µ <  k : Enter 1.\n')
fprintf('If H0: µ <= k & H1: µ >  k : Enter 2.\n')
fprintf('If H0: µ = k & H1: µ /=  k : Enter 3.\n')

flag=input('From the options above enter your choice based on the hypotheses :');
fprintf('\n')

alpha=input('Enter level of confidence(in %) = ');
alpha=alpha/100;
alpha=1-alpha;


z=(sample_mean-pop_mean)/(pop_std_dev/sqrt(length(sample)));

p=normcdf(z);

if(flag==1)

if(p<alpha)
    fprintf('\n H0 is rejected.\n')
else
    fprintf('\n H0 is not rejected.\n')
end

elseif(flag==2)
    
    if((1-p)<alpha)
    fprintf('\n H0 is rejected.')
else
    fprintf('\n H0 is not rejected.')
    end
else
    if(p<alpha/2)
    fprintf('\n H0 is rejected.')
else
    fprintf('\n H0 is not rejected.')
    end

end





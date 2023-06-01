clc
clear all

n = input("Enter the total number of linear congruences = ");

fprintf("\nLinear congruences are of the type x congruent to a mod m.\n")
fprintf("Enter the a and m in each linear congruence.\n")

mat_a = [];
mat_m = [];
for i=1:n
   a = input("a = ");
   m = input("m = ");
   mat_a = [mat_a,a];
   mat_m = [mat_m,m];
   fprintf("\n")
end

% mat_a = [2,3,2];
% mat_m = [3,5,7];

% Used to check whether the moduli are pairwise relatively prime or not.
flag = 1;
for i=1:n-1
   for j=i+1:n
      if(i~=j)
         if(GCD(mat_m(i),mat_m(j))~=1)
            flag = 0;
            break;
         end
      end
   end
end

if(flag==1)
    fprintf("\nSince moduli are pairwise relatively prime Chinese Remainder theorem is applicable.\n")
    
    % The product of the moduli is M
    M = 1;
    for i=1:n
        M = M*mat_m(i);
    end
    
    % If m1 is one of the moduli then M1 is obtained by
    % dividing M (product of the moduli) by m1.
    M1 = [];
    for i=1:n
       M1 = [M1,M/mat_m(i)]; 
    end
   
   % Searching for modular inverse of M1.
   M1_inv = [];
   for i=1:n
      for j=1:mat_m(i)-1
          
         if(mod(j*M1(i),mat_m(i))==1)
            M1_inv = [M1_inv,j];
         end
      
      end
   end
   
   
   S = 0;
   for i=1:n
       S = S + mat_a(i)*M1(i)*M1_inv(i);
   end
  
  fprintf("\nThe solution of the system is x congruent to %d modulo %d.\n",mod(S,M),M)
else
    fprintf("\nThe Chinese Remainder Theorem is not applicable.\n")
end









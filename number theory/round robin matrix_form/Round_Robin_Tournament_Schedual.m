clc
clear all



total_teams=input('Total number of teams = ');

fprintf("\n\n         Round-Robin Tournament Schedule for %d teams\n",total_teams)
fprintf("Teams     ")
for i=1:total_teams
   fprintf('%5i',i) 
end
fprintf("\nRounds       ")
for i=1:total_teams*5
   fprintf('=') 
end
fprintf('\n')


n=total_teams;



if(mod(n,2)~=0)
   n=n+1; 
end

N=n;

team=zeros(N-1,total_teams);

for k=1:N-1
   for i=1:N-1
       
       j=mod(k-i,N-1);
       
       if(j==0)
          j=N-1;
       end
       
       if(j~=i)
           team(k,i)=j;
       else
          if(mod(total_teams,2)~=0)
             team(k,i)=NaN;
          else
              team(k,i)=N;
              team(k,N)=i;
          end
       end
       
   end
end

for k=1:N-1
   fprintf("%2i        ",k)
   for i=1:total_teams
      fprintf("%5i",team(k,i)) 
   end
   fprintf("\n")
end
fprintf("\n ***Here,if 'NaN' appears we use it to imply 'bye'.\n")

fprintf("\n\nHere total number of games = %d.\n",(total_teams-1)*total_teams/2)





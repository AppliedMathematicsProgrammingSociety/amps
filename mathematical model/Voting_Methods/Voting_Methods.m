clc
clear all
close all

% Some Examples

% Ranking = ['PSTRS';'RRSTT';'STRSR';'TPPPP'];
% Number_of_Votes = [14 10 8 4 1];M = 4; N = 5;

% Ranking = ['BCDAC';'AACDD';'CDACA';'DBBBB'];
% Number_of_Votes = [19 15 11 7 2];M = 4; N = 5;

% Ranking = ['SSHPPH';'PHSHSP';'HPPSHS'];
% Number_of_Votes = [2 3 5 1 3 1];M = 3; N = 6;

% Ranking = ['DEFHH';'HFEEF';'FHHFD';'EDDDE'];
% Number_of_Votes = [30 22 20 12 2];M = 4; N = 5;

% Ranking = ['MCDCDM';'CMCDMD';'DDMMCC'];
% Number_of_Votes = [10 6 6 4 2 2];M = 3; N = 6;

% Direct Inputs: (From the given problem)
Ranking = ['ABD';'BDA';'CCC';'DAB'];
Number_of_Votes = [14000000 8000000 4000000];
M = 4; % number of candidates
N = 3; % number of different type of ballots(number of data columns in the preference table)

%%%% For Inputs From the terminal (For the user):
% fprintf("The letters used to identify the candidates are entered as character data.")
% M = input("Number of candidates = ");
% Number_of_Votes = [];
% N = input("Number of different type of ballots = ");
% for j=1:N
%     fprintf("\n For type - %d ballot:\n",j)
%     for i=1:M
%         fprintf(" Candidate for position - %d: ",i)
%         candidate = input("");
%         Ranking(i,j) = candidate;
%     end
%     fprintf("\n Number of votes for this ballot = ")
%     num = input("");
%     Number_of_Votes = [Number_of_Votes,num];
% end



%%%% For Outputs:
fprintf("\n\n The Preference Table:\n")
fprintf(" No. of votes   ")
for j = 1:N
    fprintf("%12i",Number_of_Votes(j))
end
fprintf("\n")
for i=1:M
   fprintf(" Position %d     ",i)
   for j=1:N
       fprintf("%12s",Ranking(i,j))
   end
   fprintf("\n")
end

fprintf("\n\n\n")

% The Plurality Method
% The candidate (or candidates, if there is more than one) with the most 
% first-place votes is the winner.
fprintf("\n====================== Plurality Method =======================\n")
Candidates_in_pos_1 = Ranking(1,:);
Distinct_Candidate_in_pos_1 = [];
while(numel(Candidates_in_pos_1))
    Distinct_Candidate_in_pos_1 = [Distinct_Candidate_in_pos_1,Candidates_in_pos_1(1)];
    Candidates_in_pos_1 = erase(Candidates_in_pos_1,Candidates_in_pos_1(1));
end
Distinct_Candidate_in_pos_1;

for k=1:numel(Distinct_Candidate_in_pos_1)
    votes = 0;
    for j=1:N
        if(Distinct_Candidate_in_pos_1(k)==Ranking(1,j))
           votes = votes +  Number_of_Votes(j);
        end
    end
    Total_Votes_Per_Can(k) = votes;
end
Total_Votes_Per_Can;

max_no_of_votes = max(Total_Votes_Per_Can);
if(numel(max_no_of_votes)==1)
       fprintf(" We do not have a tie.\n")
else
        fprintf(" We have a tie.\n")
end
for k=1:numel(Total_Votes_Per_Can)
    for l=1:numel(max_no_of_votes)
       if(max_no_of_votes(l)==Total_Votes_Per_Can(k))
             fprintf(" Candidate %s wins using The Plurality Method.\n",...
                 Distinct_Candidate_in_pos_1(k))
       end
    end
end



% The Borda Count Method
% Each voter ranks the candidates from the most favorable to the least favorable.
% Each last-place vote is given 1 point, each next-to-last-place vote is given 2 points,
% each third-from-last-place vote is given 3 points, and so on. The points are totaled
% for each candidate separately. The candidate with the most points is the winner.
fprintf("\n====================== Borda Count Method =======================\n")
Candidates = Ranking(:,1);
for k=1:numel(Candidates)
    Points = 0;
    for i=1:M
       for j=1:N
           if(Candidates(k)==Ranking(i,j))
              Points = Points + (M-i+1)*Number_of_Votes(j);
           end
       end
    end
    Total_Points(k) = Points; 
    fprintf(" Candidate %s gets %d points.\n",Candidates(k),Points)
end

Max_Point = max(Total_Points);
if(numel(Max_Point)==1)
       fprintf(" We do not have a tie.\n")
else
        fprintf(" We have a tie.\n")
end
for i=1:numel(Total_Points)
   if(Max_Point == Total_Points(i))
      fprintf(" Candidate %s wins using The Borda Count Method.\n",...
          Candidates(i))
   end
end

fprintf("\n\n\n")
% The Plurality-with-Elimination Method
% Using Preference Ballots
% The candidate with the majority of first-place votes is the winner. If no candidate
% receives a majority of first-place votes, eliminate the candidate (or candidates if
% there is a tie) with the fewest first-place votes from the preference table. Move
% the candidates in each column below the eliminated candidate up one place. The
% candidate with the majority of first-place votes in the new preference table is the
% winner. If no candidate receives a majority of first-place votes, repeat this process
% until a candidate receives a majority.
fprintf("====================== Plurality With Elimination Method =======================")
Preference_Ballot = Ranking;
Total_Voters = sum(Number_of_Votes);

Candidates_in_pos_1 = Preference_Ballot(1,:);
Distinct_Candidate_in_pos_1 = [];
while(numel(Candidates_in_pos_1))
    Distinct_Candidate_in_pos_1 = [Distinct_Candidate_in_pos_1,Candidates_in_pos_1(1)];
    Candidates_in_pos_1 = erase(Candidates_in_pos_1,Candidates_in_pos_1(1));
end
Distinct_Candidate_in_pos_1;

for k=1:numel(Distinct_Candidate_in_pos_1)
    votes = 0;
    for j=1:N
        if(Distinct_Candidate_in_pos_1(k)==Preference_Ballot(1,j))
           votes = votes +  Number_of_Votes(j);
        end
    end
    Total_Votes_Per_Can(k) = votes;
end
Total_Votes_Per_Can;

max_no_of_votes = max(Total_Votes_Per_Can);
Winner = [];
for k=1:numel(Total_Votes_Per_Can)
   if(max_no_of_votes == Total_Votes_Per_Can(k))
      Winner = [Winner,Distinct_Candidate_in_pos_1(k)];  
   end
end

% This loop is used to update the preference table.
while(max_no_of_votes<=Total_Voters*0.5)

% Now, we find the candidate to be eliminated. This will be the person with
% the least votes.
Candidate_eliminated = [];
min_no_of_votes = min(Total_Votes_Per_Can);
for k=1:numel(Total_Votes_Per_Can)
    for l=1:numel(min_no_of_votes)
       if(min_no_of_votes(l)==Total_Votes_Per_Can(k))
          Candidate_eliminated = [Candidate_eliminated,Distinct_Candidate_in_pos_1(k)];
       end
    end
end
Candidate_eliminated;

% Next we find the new preference table by eliminating the person with the
% least 1st place votes.
% [M,N] = size(Preference_Ballot);
Updated_Preference_Ballot = char.empty;
for k=1:numel(Candidate_eliminated)
    q=1;
   for j=1:N
       p=1;
      for i=1:M
         if(Preference_Ballot(i,j)~=Candidate_eliminated(k))
            Updated_Preference_Ballot(p,q)=Preference_Ballot(i,j); 
            p = p + 1;
         end
      end
      q = q + 1;
   end
end
Updated_Preference_Ballot;

% This part is same as the plurality method.
Candidates_in_pos_1 = Updated_Preference_Ballot(1,:);
Distinct_Candidate_in_pos_1 = [];
while(numel(Candidates_in_pos_1))
    Distinct_Candidate_in_pos_1 = [Distinct_Candidate_in_pos_1,Candidates_in_pos_1(1)];
    Candidates_in_pos_1 = erase(Candidates_in_pos_1,Candidates_in_pos_1(1));
end
Distinct_Candidate_in_pos_1;
Total_Votes_Per_Can = [];
for k=1:numel(Distinct_Candidate_in_pos_1)
    votes = 0;
    for j=1:N
        if(Distinct_Candidate_in_pos_1(k)==Updated_Preference_Ballot(1,j))
           votes = votes +  Number_of_Votes(j);
        end
    end
    Total_Votes_Per_Can(k) = votes;
end
Total_Votes_Per_Can;

max_no_of_votes = max(Total_Votes_Per_Can);

Winner = [];
for k=1:numel(Total_Votes_Per_Can)
   if(max_no_of_votes == Total_Votes_Per_Can(k))
      Winner = [Winner,Distinct_Candidate_in_pos_1(k)];  
   end
end
Winner;

% For the next iteration we are required to use the updated preference
% ballot.
Preference_Ballot = Updated_Preference_Ballot;
[M,N] = size(Preference_Ballot);
fprintf("\n Updated Preference Table:")
fprintf("\n\n No. of votes   ")
for j = 1:N
    fprintf("%12i",Number_of_Votes(j))
end
fprintf("\n")
for i=1:M
   fprintf(" Position %d     ",i)
   for j=1:N
       fprintf("%12s",Preference_Ballot(i,j))
   end
   fprintf("\n")
end
fprintf("\n\n")
end


fprintf("\n Candidate %s wins using The Plurality With Elimination Method.\n",Winner)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The Pairwise Comparison Method
% Voters rank all the candidates and the results are summarized in a preference
% table. The table is used to make a series of comparisons in which each candidate is
% compared to each of the other candidates. For each pair of candidates, X and Y, use
% the table to determine how many voters prefer X to Y and vice versa. If a majority
% prefer X to Y, then X receives 1 point. If a majority prefer Y to X, then Y receives
% 1 point. If the candidates tie, then each receives 1/2 point. After all 
% comparisons have been made, the candidate receiving the most points is the winner.
fprintf("\n=================Pairwise Comparision Method====================\n")
[M,N] = size(Ranking);
Candidate = Ranking(:,1);
Candidate_to_be_compared_with = Ranking(:,1);
Candidate_Point = zeros(1,M);
for k=1:numel(Candidate)-1
   for l=k:numel(Candidate_to_be_compared_with)
       
       if(Candidate(k)~=Candidate_to_be_compared_with(l))
            Can = Candidate(k);  % Candidate
            Opp = Candidate_to_be_compared_with(l); % Opponent
            Can_votes = 0;
            Opp_votes = 0;
            for j=1:N
                for i=1:M
                    if(Ranking(i,j)==Can)
                         can_pos = i; % Position of the candidate in a column
                    end
                    if(Ranking(i,j)==Opp)
                         opp_pos = i; % Position of his opponent in a column
                    end
                end
                if(can_pos<opp_pos)
                   Can_votes = Can_votes +  Number_of_Votes(j);
                else
                   Opp_votes = Opp_votes +  Number_of_Votes(j);
                end
            end
          
            if(Can_votes>Opp_votes)
               fprintf("\n %s Vs %s: %s wins and gets %d point.\n",Can,Opp,Can,1) 
               for p=1:numel(Candidate)
                  if(Can == Candidate(p))
                     Candidate_Point(p) = Candidate_Point(p)+1; 
                  end
               end
            elseif(Can_votes<Opp_votes)
                fprintf("\n %s Vs %s: %s wins and gets %d point.\n",Can,Opp,Opp,1)
                for p=1:numel(Candidate)
                  if(Opp == Candidate(p))
                     Candidate_Point(p) = Candidate_Point(p)+1; 
                  end
               end
            else
                fprintf("\n %s Vs %s: Both gets %.1f point.\n",Can,Opp,0.5)
                for p=1:numel(Candidate)
                  if(Can == Candidate(p))
                     Candidate_Point(p) = Candidate_Point(p)+0.5; 
                  end
                end
                for p=1:numel(Candidate)
                  if(Opp == Candidate(p))
                     Candidate_Point(p) = Candidate_Point(p)+0.5; 
                  end
               end
            end
            
       end
   end
end
max_point = max(Candidate_Point);
if(numel(max_point)>1)
   fprintf("\ We have a tie.")
else
    fprintf("\n We do not have a tie.")
end
for k=1:numel(max_point)
   for l=1:numel(Candidate)
       if(max_point(k)==Candidate_Point(l))
            fprintf("\n Candidate %s wins using The Pairwise Comparision Methos.\n",Candidate(l)) 
       end
   end
end

   
   
   
clc
clear all
close all

Year = input("Enter the year (2022 or 2023) = ");

Departments = ["Botany","Zoology","Physics","Chemistry","Fisheries"];
if(Year == 2022)
    Population = [2950,2040,1730,1500,780];
elseif(Year == 2023)
    Population = [2960 2040 1810 1500 780];
else
    fprintf("\nData not availabel for year %d.\n",Year)
    return
end
Total_Population = sum(Population);
Total_Rooms = 500;

% Example Reference: Thinking Mathematically by Blitzer
% Departments = ["A","B","C","D","E","F"]; 
% Population = [4360 5130 7080 10245 15535 22650];
% Total_Population = 65000;
% Total_Rooms = 130;



Standard_Divisor = Total_Population/Total_Rooms

Standard_Quota = Population./Standard_Divisor

Lower_Quota = floor(Standard_Quota)
Upper_Quota = ceil(Standard_Quota)
fprintf("\n Table: Standard Quotas, Lower Quotas, and Upper Quotas for Each Department\n")
fprintf("    Department    Population     Standard         Lower         Upper\n")
fprintf("                                 Quota            Quota         Quota\n")
for i=1:numel(Population)
    fprintf("  %12s  %12i %12.2f  %12i  %12i\n",...
        Departments(i),Population(i),Standard_Quota(i),...
        Lower_Quota(i),Upper_Quota(i))
end
fprintf("\n  %12s  %12i %12i  %12i  %12i\n",...
    "Total",Total_Population,sum(Standard_Quota),...
    sum(Lower_Quota),sum(Upper_Quota))


fprintf("\n\n\n")


%% Hamilton’s Method
% 1. Calculate each group’s standard quota.
% 2. Round each standard quota down to the nearest whole number, thereby
% finding the lower quota. Initially, give to each group its lower quota.
% 3. Give the surplus items, one at a time, to the groups with the largest decimal
fprintf("\n====================== Hamilton’s Method =====================\n")
Decimal_Part = Standard_Quota - Lower_Quota;
Total_Standard_Quota = sum(Standard_Quota);
Total_Lower_Quota = sum(Lower_Quota);
Surplus = Total_Rooms - Total_Lower_Quota; 
Surplus_Distribution = zeros(1,numel(Population));
Sorted_Decimal_Part = sort(Decimal_Part,"Descend");
Distinct_Sorted_Decimal_Part = [];
for i=1:numel(Sorted_Decimal_Part)
   flag = 0;
   for j=1:numel(Distinct_Sorted_Decimal_Part)
      if(Distinct_Sorted_Decimal_Part(j)==Sorted_Decimal_Part(i))
         flag = 1;
         break;
      end
   end
   if(flag == 0)
      Distinct_Sorted_Decimal_Part = [Distinct_Sorted_Decimal_Part,Sorted_Decimal_Part(i)]; 
   end
end
Distinct_Sorted_Decimal_Part;


Surplus_Distribution = zeros(1,numel(Departments));

k=0;
for i=1:Surplus
    if(k>numel(Distinct_Sorted_Decimal_Part))
       k = 0; 
    end
   k = k + 1;
   max_decimal_part = Distinct_Sorted_Decimal_Part(k);
   for j=1:numel(Decimal_Part)
      if(Decimal_Part(j)==max_decimal_part)
          Surplus_Distribution(j) = Surplus_Distribution(j) + 1;
      end
   end
end

Surplus_Distribution;
Final_Approtionment = Lower_Quota + Surplus_Distribution;
Total_Final_Apportionment = sum(Final_Approtionment);
fprintf("    Department    Population     Standard         Lower       Decimal       Surplus         Final\n")
fprintf("                                 Quota            Quota       Part          Items           Apportionment\n")
for i=1:numel(Population)
    fprintf("  %12s  %12i %12.2f  %12i  %12.4f  %12i  %12i\n",...
        Departments(i),Population(i),Standard_Quota(i),...
        Lower_Quota(i),Decimal_Part(i),Surplus_Distribution(i),Final_Approtionment(i))
end
fprintf("\n  %12s  %12i %12i  %12i  %40i\n",...
    "Total",Total_Population,Total_Standard_Quota,...
    Total_Lower_Quota,Total_Final_Apportionment)

%% Jefferson’s Method
% 1. Find a modified divisor, d, such that when each group’s modified quota
% (group’s population divided by d) is rounded down to the nearest whole
% number, the sum of the whole numbers for all the groups is the number of
% items to be apportioned. The modified quotients that are rounded down are
% called modified lower quotas.
% 2. Apportion to each group its modified lower quota.
fprintf("\n====================== Jefferson’s Method =====================\n")
Total_Apportionment_Item = 0;
Modified_Divisor = Standard_Divisor;
while(Total_Apportionment_Item ~= Total_Rooms)
    Modified_Quota = Population./Modified_Divisor;
    Modified_Lower_Quota = floor(Modified_Quota);
    Total_Apportionment_Item = sum(Modified_Lower_Quota);
    if(Total_Apportionment_Item > Total_Rooms)
        Modified_Divisor = Modified_Divisor + 0.01;
    elseif(Total_Apportionment_Item < Total_Rooms)
        Modified_Divisor = Modified_Divisor - 0.01;
    else
    end
end

Modified_Divisor

Final_Approtionment = Modified_Lower_Quota;
fprintf("    Department    Population     Modified         Modified Lower    Final\n")
fprintf("                                 Quota            Quota             Apportionment\n")
for i=1:numel(Population)
    fprintf("  %12s  %12i %12.2f  %12i  %16i\n",...
        Departments(i),Population(i),Modified_Quota(i),...
        Modified_Lower_Quota(i),Final_Approtionment(i))
end
fprintf("\n  %12s  %12i %26i  %16i\n",...
    "Total",Total_Population,sum(Modified_Lower_Quota),sum(Final_Approtionment))


%% Adams’s Method
% 1. Find a modified divisor, d, such that when each group’s modified quota
% (group’s population divided by d) is rounded up to the nearest whole number,
% the sum of the whole numbers for all the groups is the number of items to be
% apportioned. The modified quotas that are rounded up are called modified
% upper quotas.
% 2. Apportion to each group its modified upper quota.
fprintf("\n====================== Adams’s Method =====================\n")
Total_Apportionment_Item = 0;
Modified_Divisor = Standard_Divisor;
while(Total_Apportionment_Item ~= Total_Rooms)
    Modified_Quota = Population./Modified_Divisor;
    Modified_Upper_Quota = ceil(Modified_Quota);
    Total_Apportionment_Item = sum(Modified_Upper_Quota);
    if(Total_Apportionment_Item > Total_Rooms)
        Modified_Divisor = Modified_Divisor + 0.01;
    elseif(Total_Apportionment_Item < Total_Rooms)
        Modified_Divisor = Modified_Divisor - 0.01;
    else
    end
end

Modified_Divisor

Final_Approtionment = Modified_Upper_Quota;
fprintf("    Department    Population     Modified         Modified Lower    Final\n")
fprintf("                                 Quota            Quota             Apportionment\n")
for i=1:numel(Population)
    fprintf("  %12s  %12i %12.2f  %12i  %16i\n",...
        Departments(i),Population(i),Modified_Quota(i),...
        Modified_Upper_Quota(i),Final_Approtionment(i))
end
fprintf("\n  %12s  %12i %26i  %16i\n",...
    "Total",Total_Population,sum(Modified_Upper_Quota),sum(Final_Approtionment))




%% Webster’s Method
% 1. Find a modified divisor, d, such that when each group’s modified quota (group’s
% population divided by d) is rounded to the nearest whole number, the sum of
% the whole numbers for all the groups is the number of items to be apportioned.
% The modified quotas that are rounded are called modified rounded quotas.
% 2. Apportion to each group its modified rounded quota.
fprintf("\n====================== Webster’s Method =====================\n")
Total_Apportionment_Item = 0;
Modified_Divisor = Standard_Divisor;
while(Total_Apportionment_Item ~= Total_Rooms)
    Modified_Quota = Population./Modified_Divisor;
    Modified_Rounded_Quota = nearest(Modified_Quota);
    Total_Apportionment_Item = sum(Modified_Rounded_Quota);
    if(Total_Apportionment_Item > Total_Rooms)
        Modified_Divisor = Modified_Divisor + 0.01;
    elseif(Total_Apportionment_Item < Total_Rooms)
        Modified_Divisor = Modified_Divisor - 0.01;
    else
    end
end

Modified_Divisor

Final_Approtionment = Modified_Rounded_Quota;
fprintf("    Department    Population     Modified         Modified Rounded      Final\n")
fprintf("                                 Quota            Quota                 Apportionment\n")
for i=1:numel(Population)
    fprintf("  %12s  %12i %12.2f  %12i  %20i\n",...
        Departments(i),Population(i),Modified_Quota(i),...
        Modified_Rounded_Quota(i),Final_Approtionment(i))
end
fprintf("\n  %12s  %12i %26i  %20i\n",...
    "Total",Total_Population,sum(Modified_Rounded_Quota),sum(Final_Approtionment))


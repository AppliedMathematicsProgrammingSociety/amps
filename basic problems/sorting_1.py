'''Taking a list of random 100 integers, sorting it and creating 10 sublists.
Showing the sublists side by side in a table.'''
import numpy as np
import pandas as pd

# Generate a random list of 100 integers
from numpy.random import default_rng
rng = default_rng()
random_list = rng.choice(100, size=100, replace=False)
print(f"\nThe random list of 100 elements is- \n{random_list}")

# Sorting the list
sorted_list = np.sort(random_list)

# Reshaping the array
reshaped_array = sorted_list.reshape(10, 10)

#initialize empty list for stroing the sublists
sublist_arrays = []

#loop through the sorted list to obtain 10 sublists 
for i in range(10):
    #take a row from the reshaped array 
    sublist = reshaped_array[i , :]

    #create a dataframe for each new array with column name
    data = {f"Sublist {i}" : sublist}
    sublist_dataframe = pd.DataFrame(data)
    
    #append the new dataframe to the empty list
    sublist_arrays.append(sublist_dataframe)

#initialize empty dataframe 
result = pd.DataFrame()

#loop through the list of dataframes to create the final table 
for sa in sublist_arrays:
    result = result.add(sa, fill_value=0)  

print("\nTen sublist of ascending ordered numbers from original list-\n")
print(result.to_string(index=False))
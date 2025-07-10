# import libraries
import piplite
await piplite.install('seaborn')

import pandas as pd
import numpy as np

import seaborn as sns
import matplotlib.pyplot as plt
%matplotlib inline

import os
os.listdir()

# open the file
url =r"Race_50M.csv"
df = pd.read_csv(url)
df


df2 = df.dropna(axis=1)
df2


#combine first and last name
df2['Full_Name'] = df2['First_Name'] + ' ' + df2['Last_Name']
df2


#calculite total minutes
df2['Time'] = pd.to_timedelta(df2['Time'])
df2['Total_Minutes'] = df2['Time'].dt.total_seconds() / 60
df2['Total_Minutes'] = df2['Total_Minutes'].round().astype(int)
df2


#rename column name from Division to Gender
df2.rename(columns={'Division' : 'Gender'}, inplace=True)
df2

#make updates and make new csv file 
df2.to_csv('ultra50.csv', index=False)

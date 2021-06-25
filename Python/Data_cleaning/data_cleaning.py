# here data cleaning example
# datafile url:   https://drive.google.com/file/d/1defc2iEcaCkP6XalHkfo8PBBKbzAeLGo/view?usp=sharing

import pandas as pd
import matpolotlib as plt

tree_census = pd.read_cv('2015_Street_Tree_Census_-_Tree_Data.csv')
tree_census

tree_census.columns

tree_census_subset = tree_census[['tree_id', 'tree_dbh', 'stump_diam',
                                  'curb_loc', 'status', 'health', 'spc_latin', 'steward', 'sidewalk', 'problems', 'root_ston',
                                  'root_grade', 'root_other', 'trunk_wire', 'trnk_light', 'trnk_other',
                                  'brch_light', 'brch_shoe', 'brch_other']]
tree_census_subset

tree_census_subset.describe()

tree_census_subset[tree_census_subset['health'].isna()]

tree_census_subset.dtypes

tree_census_subset.hist(bins=60, figsize=(20,10))

big_trees[['tree_id', 'stump_diam']].plot(kind='scatter', x='tree_id', y='stump_diam', figsize=(20,10))

tree_census_subset['steward'].value_counts()

tree_census_subset['curb_loc'].value_counts()

stumps = tree_census_subset[tree_census_subset['status']=='Stump']
stumps


deads = tree_census_subset[tree_census_subset['status']=='Dead']
deads

tree_problems.apply(pd.Series.value_counts)

tree_census_subset = tree_census_subset[tree_census_subset['status'] != 'Stump']
tree_census_subset = tree_census_subset[tree_census_subset['status'] != 'Dead']

#check health condition Good Fair Poor...
tree_census_subset['health'].value_counts()

# create a mask to select only rows fill tree status stump or dead
mask = ((tree_census_subset['status'] == 'Stump') | (tree_census_subest['status'] =='Dead'))
# now select the column
tree_census_subset.loc[mask, 'health'] = tree_census_subset.loc[mask, 'health'].fillna('Not Applicable')


tree_census_subset[tree_census_subset['status'] == 'Stump']
# fill missing valuables Na with our criterie
tree_census_subset.fillna('Not Applicable')

# you can use alternative way as don't specify column to fill all NaN values in selected rows as Not Applicable
tree_census_subset.loc[mask] = tree_census_subset.loc[mask].fillna('Not Applicable')

# check if there any other missing values
tree_census_subset.isna().sum()

tree_census_subset[tree_census_subset['health'].isna()]

# change 

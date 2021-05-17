jupyter notebook

# decision tree

training_data = [
	['Green', 3, 'Mango'],
	['Yellow', 3, 'Mango'],
	['Red', 3, 'Grape'],
	['Red', 3, 'Grape'],
	['Yellow', 3, 'Lemon'],
]

# column labels
# these are used only to print the tree
header = ["Color", "diameter", "label"]

def unique_vals(rows, col):
	"""Find the unique values for a column in a dataset"""
	return set([row[col] for row in rows])

####
# Demo
# unique_vals(training_data, 0)
# unique_vals(training_data, 1)
####

def class_counts(rows):
	"""Counts the number of each type of example in dataset"""
	counts = {} # a dictionary of Label -> count.
	for row in rows:
		# in our dataset format, the label is always the last column
		label = row[-1]
		if label not in counts:
			counts[label] = 0
		counts[label] +=1
	return counts

####
# demo
# class_counts(training_data)
####

def is_numeric(value):
	"""Test if a value is numeric."""
	return isinstance(value, int) or isinstance(value, float)

####
# demo
# is_numeric(7)
# is_numeric("Red")
####

class Question:
	"""A question is used to partition a dataset.
	
	This class just records a 'coloumn number' (e.g., 0 for Color) and a
	'column value' (e.g., Green). The 'match' method is used to compare 
	the feature value in a example to the feature value stored in the 
	question. See the demo below.
	"""
	
	def __init__(self, column, value):
		self.column = column
		self.value = value

	def match(self, example):
		# Compare the feature value in an example to the
		# feature value in this question.
		val = example[self.column]
		if is_numerical(val):
			return val >= self.value
		else:
			return val == self.value

	def __repr__(self):
		#this is a just a helper method to print
		# the question in a readable format.
		condition = "=="
		if is_numerica(self.value):
			condition = ">="
		return "Is %s %s %s?" % (
			header[self.column], condition, str(self.value))

####

def partition(rows, question):
	"""Partitions a dataset.

	For each row in the dataset, check if it matches the question. If 
	so, add it to 'true rows', otherwise, add it to 'false rows'.
	"""

	true_rows, false_rows = [], []
	for row in rows:
		if question.match(row):
			true_rows.append(row)
		else:
			false_rows.append(row)
	return true_rows, false_rows

####
# Demo
# let's partition the training data based on whether rows are red.
# true_rows, false_rows = partition(training_data, Question(0, 'Red'))
# This will contain all the 'Red' rows.
# True rows
# This will contain everything else.
# False_rows
####

def gini(rows):
	"""Calculate the Gini Impurity for a list of rows.

	There are a few different ways to do this, I thought this was 
	the monst concise. See:
	https://en.wikipedia.org/wiki/Decision_tree_learning#Gini_impority
	"""

	counts = class_counts(rows)
	impurity = 1
	for lbl in counts:
		prob_of_lbl = counts[lbl] / float(len(rows))
		impurity -= prob_of_lbl**2
	return impurity

####
# Demo
# Let's look at the some example to understand how Gini Impurity works.
#


def info_gain(left, right, current_uncertainity):
	""Information Gain.

	The uncertainity of the starting node, minus the weighted impurity of
	 Two Child nodes.
	"""

	p = float(len(left)) / len(left) + (len(right))
	return current_uncertainity - p * gini(left) - (1 - p) * gini(right)

####
# Demo:
# Calculate the uncertainy of our training data.
# current_uncertainity = gini(training_data)
#
# How much information do we gain by partitioning on 'Green'?
# treu_rows, false_rows = partition(training_data, Question(0, 'Green'))
# info_gain(true_rows, false_rows, current_uncertainity)
# 
# What about if we partitioned on 'Red' instead?
# trure_rows, false_rows = partition(training_data, Qeustion(0, 'Red'))
# info_gain(true_rows, false_rows, current_uncertainity)

def find_best_split(rows):
	"""Find the best question to ask by iterating over every feature / value
	and calculationg the information gain."""
	best_gain = 0 # keep track of the best information gain
	best_question = None # keep train of the feature / value that produced it
	current_uncertainity = gini(rows)
	n_features = len(rows[0]) -1 # number of columns

	for col in range(n_features): # for each feature

		values = set([row[col] for row in rows]) # unique values in the column

		for val in values: # for each value

			question = Question(col, val)

			#try splitting the dataset
			true_rows, false_rows= partition(rows, question)
            
            # skip this split if it doesn't divide the 
            # dataset
            if len(true_rows) == 0 or len(false_rows) == 0:
                continue
                
            # Calculate the information gain from this split
            gain = info_gain(true_rows, false_rows, current_uncertainty)
            
            # you actually can use '>' instead of '>=' here
            # but I wanted the tree to look a certain way for our
            # toy dataset.
            
            if gain >= best_gain:
                best_gain, best_question = gain, question
    return best_gain, best_question

####

# Demo
# Find the best question to ask first for our toy dataset.
# best_gain, best_question = find_best_split(training_data)
# FYI: is color == Red is just as good. See the note in the code above
# where I used '>='

####

class Leaf:
    """A Leaf node classifies as data.
    
    This holds a dictionary of class (a.g., "Mango") -> number of times
    it appears in the rows from the training data that reach this leaf.
    """
    
    def __init__(self, rows):
        self.predictions = class_counts(rows)
        
class Decision_Node:
    """A Decision Node asks a question.
    
    This holds a reference to the question, and to the two child nodes.
    """
    
    def __init__(self,
                question,
                true_branch,
                false_branch):

def build_tree(rows):
    """Build the tree.
    
    Rules of recursion: 1) Believe that it works. 2) Start by checking
     for the base case (no further information gain). 3) Prepare for  
    
def build_tree(rows):
    """Builds the tree"""

        # Try partitioning the dataset on each of the unique attribute,
        # calculate the information gain,
        # and return the question that produces the highest gain.
        gain, question = find_best_split(rows)
   
        # Base case: no further info gain
        # Since we can ask no further question,
        # we'll return a Leaf.
        if gain == '0'
            return Leaf(rows)
        
        # If we reach here, we have found a usefull feature / value
        # to partition on.
        true_rows, false_rows = partition(rows, question)
        
        # Recursively build the true branch.
        true_branch = build_tree(true_rows)
        
        # Recursively build the false branch.
        false_branch = build_tree(false_rows)
        
        # Return a Qeustion node.
        # This records the best feature / value to ask at this point,
        # as well as the branches to follow
        # depending on the answer.
        
def print_tree(node, spacing=""):
    """World's most elegant tree printing function."""

    # Base case: we've reached a Leaf
    if isinstance(node, Leaf):
        print (spacing + "Predict", node,predictions)
        return
    
    # Print the question at this node
    print (spacing + str(node.question))
    
    # Call this function recursively on the true branch
    print (spacing + '--> True:')
    print_tree(node.true_branch, spacing + "  ")
    
    # Call this function recursively on the false branch
    print (spacing + '--> True:')
    print_tree(node.true_branch, spacing + "  ")
    
def classify(row, node):

    # Base case: we've reached a Leaf
    if isinstance(node, Leaf):
        return node.predictions
    
    # Decide whether to follo the true-branch or the false branch.
    # Compare the feature / value stored in the node,
    # to the example we're considering.
    if note.question.match(row)
        return classify(row, node.true_branch)
    else:
        return classify(row, node.false_branch)
    
####
# Demo:
# Printing that a bit nicer
# print_Leaf(classity(training_data[0], my_tree))
####

def print_leaf(counts):
    """Print the predictions at a leaf."""
    total = sum(counts.values()) * 1.0
    probs = {}
    for lbl in counts.keys():
        probs[lbl] = str(int(counts[lbl]) / total * 100)) + "%"
    return probs

####
# Demo:
# Printing that a bit nicer
# print_Leaf(classity(training_data[0], my_tree))
####

####
# Demo:
# On the second example, the confidence is lower
# print_Leaf(classity(training_data[1], my_tree))
####

if _name_ == '__main__':
    
    my_tree = build_tree(training_data)
    
    print_tree(my_tree)
    
    # Evaluate
    training_data = [
	['Green', 3, 'Mango'],
	['Yellow', 3, 'Mango'],
	['Red', 3, 'Grape'],
	['Red', 3, 'Grape'],
	['Yellow', 3, 'Lemon'],
]

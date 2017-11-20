import pandas as pd
from itertools import dropwhile
import glob, csv, os, sys, io, re
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

import seaborn as sns
from matplotlib.colors import LinearSegmentedColormap

#plt.style.use('ggplot')
plt.style.use('seaborn-paper')

import matplotlib as mpl

def plot_single_chart():
	allFiles = [f for f in os.listdir('.') if f.endswith('csv')]
	for file_ in allFiles:
		if os.stat(file_).st_size == 0:
			continue
		#print file_
		df = pd.read_csv(file_,index_col=None, header=0)
		df=df.set_index('Request-Type').T.reset_index()
		v=df['index'] == 'FUSE_BATCH_FORGET'
		if v.bool():
			continue
		#print df
		list_.append(df)
	
	df = pd.concat(list_)
	df.fillna(0)
	df.groupby('index')
	#print df

def plot_chart(df):
	#print df.keys(), df.values
	pattern = [ "/" , "\\" , "|" , "-" , "+" , "x", "o", "O", ".", "*" ]
	
	colors = sns.color_palette("cubehelix", n_colors=4)
	cmap1 = LinearSegmentedColormap.from_list("Paired", colors)
	
	# one plot
	ax = plt.figure(figsize=(10, 6)).add_subplot(111)
	df.plot(ax=ax, kind='bar',
				colormap=cmap1, log=True, grid=False, rot=-45, alpha=0.75, fontsize=16)
	#ax.set_yscale('log', basey=2)
	
	#ax.set_xlabel(keys, fontsize=16)
	ax.set_ylabel("Number of Requests", fontsize=16)
	
	bars = ax.patches
	hatches = ''.join(h*len(df) for h in pattern)
	
	for bar, hatch in zip(bars, hatches):
	    bar.set_hatch(hatch)
	
	#ax.legend(loc='center right', bbox_to_anchor=(1, 1), ncol=4)
	plt.show()

def plot_fig():
	rows, columns = df.shape
	fig, axs = plt.subplots(figsize=(20,5), ncols=rows)
	
	plot_num=0
	for key, item in df.iterrows():
		af = item.to_frame().reset_index()
		ax = af.plot(ax=axs[plot_num], kind='bar', title='', edgecolor="red", \
					legend=False, colormap='Paired', log=False, grid=False, rot=-45, alpha=0.75, fontsize=16)
	
		ax.tick_params(
	    	axis='y',          # changes apply to the x-axis
	    	which='both',      # both major and minor ticks are affected
	    	bottom='off',      # ticks along the bottom edge are off
	    	top='off',         # ticks along the top edge are off
	    	labelbottom='off') # labels along the bottom edge are off
	
		# title interferes with legend
		#ax.set_title(titles[plot_name],fontsize= 16) # title of plot
	
		hatches = ''.join(h*len(df) for h in pattern)
	
		bars = ax.patches
		for bar, hatch in zip(bars, hatches):
			bar.set_hatch(hatch)
	
		# legend for every plot
		#ax.legend(bbox_to_anchor=(0.4, 1), fontsize=18) #, ncol=1, loc='upper left')
	
		#ax.set_xlabel(key, fontsize=16)
		if plot_num == 0:
			ax.set_ylabel("Number of Requests", fontsize=16)
	
		# next plot
		plot_num += 1
	
	fig.legend(bbox_to_anchor=(0.4, 1.1), fontsize=16, ncol=rows, loc='upper center')
	plt.show()

def add_to_dataframe_list(df_list, list_lines):
	# drop comments
	cleaned_list_lines = dropwhile(lambda x: x.startswith("#!!"), list_lines)
	records = {}
	for k,v in (line.split(':') for line in cleaned_list_lines):
		try:
			records.update({k:int(v)})
		except:
			records.update({k:v})
	#reader = csv.reader(cleaned_list_lines)
	#print cleaned_list_lines
	df = pd.DataFrame().from_records(records, index=[0])
	df = df.reset_index(drop=True)
	#df = df.set_index('Request-Type') #.reset_index(inplace=True)
	#if df['index'].any() != 'FUSE_BATCH_FORGET':
	df_list.append(df)
	return df_list

def single_dataframe_from_dataframe_list(df_list):
	df = pd.concat(df_list)
	df = df.fillna(0)
	df = df.set_index('Request-Type').reset_index()
	return df

def process_file(source_filename, delimeter_pattern):
	'''Script for splitting text file into two separate csvs'''

	matched = []
	dflist = []

	with open(source_filename) as f:
		for line in f:
			line = ' '.join(line.split())
			if not delimeter_pattern.match(line):
				matched.append(line.rstrip('\n'))
			else:
				#print matched
				dflist = add_to_dataframe_list(dflist, matched)
				matched = []
	return dflist

# inputs: filename, delimeter pattern char
if __name__ == "__main__":
	frame = pd.DataFrame()
	filename = sys.argv[1]
	delimeter_pattern = re.compile("^"+sys.argv[2]+"*$")
	# process input file to get a list of dataframes
	dflist = process_file(filename, delimeter_pattern)
	# group all dataframes into one
	df = single_dataframe_from_dataframe_list(dflist)
	# plot charts from dataframe
	plot_chart(df)

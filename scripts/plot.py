import numpy as np
import pandas as pd
from operator import itemgetter

import matplotlib.pyplot as plt
#from matplotlib2tikz import save as tikz_save

#plt.style.use('ggplot')
plt.style.use('seaborn-paper')

import matplotlib as mpl

#mpl.use('pgf')
#def figsize(scale):
#	fig_width_pt = 469.755                          # Get this from LaTeX using \the\textwidth
#	inches_per_pt = 1.0/72.27                       # Convert pt to inch
#	golden_mean = (np.sqrt(5.0)-1.0)/2.0            # Aesthetic ratio (you could change this)
#	fig_width = fig_width_pt*inches_per_pt*scale    # width in inches
#	fig_height = fig_width*golden_mean              # height in inches
#	fig_size = [fig_width,fig_height]
#	return fig_size
#
#pgf_with_latex = {                      # setup matplotlib to use latex for output
#	"pgf.texsystem": "pdflatex",        # change this if using xetex or lautex
#	"text.usetex": True,                # use LaTeX to write all text
#	"font.family": "serif",
#	"font.serif": [],                   # blank entries should cause plots to inherit fonts from the document
#	"font.sans-serif": [],
#	"font.monospace": [],
#	"axes.labelsize": 10,               # LaTeX default is 10pt font.
#	"text.fontsize": 10,
#	"legend.fontsize": 8,               # Make the legend/label fonts a little smaller
#	"xtick.labelsize": 8,
#	"ytick.labelsize": 8,
#	"figure.figsize": figsize(0.9),     # default fig size of 0.9 textwidth
#	#"pgf.preamble": [
#	#	r"\usepackage[utf8x]{inputenc}",    # use utf8 fonts becasue your computer can handle it :)
#	#	r"\usepackage[T1]{fontenc}",        # plots will be generated using this preamble
#    #]
#}
#
#mpl.rcParams.update(pgf_with_latex)
#
#def savefig(filename):
#	plt.savefig('{}.pgf'.format(filename))
#	plt.savefig('{}.pdf'.format(filename))

def filt_spec(df, col, val, op):
    import operator
    ops = {'eq': operator.eq, 'neq': operator.ne, 'gt': operator.gt, 'ge': operator.ge, 'lt': operator.lt, 'le': operator.le}
    return df[ops[op](df[col], val)]
pd.DataFrame.filt_spec = filt_spec

df = pd.read_csv('data.csv')
df.fillna(0)
df = df.groupby(['exp_type', 'wrkl_type', 'wrkl' , 'wrkl_size', 'num_threads', 'num_files'])['avg_ops_sec'].mean().reset_index()

df['avg_ops_sec'] = df['avg_ops_sec']/1000

#1th        1f      1
df = df.filt_spec('num_threads', '1th', 'eq')
ff = df.filt_spec('num_files', '1f', 'eq')
#ff = df.filt_spec('count', ' 1', 'eq')

gf = ff.groupby(['wrkl_type', 'wrkl', 'num_threads', 'num_files'], as_index=True)
pattern = [ "/" , "\\" , "|" , "-" , "+" , "x", "o", "O", ".", "*" ]
titles = {
	'rd-re-1th-1f' : 'Rand Read',
	'rd-wr-1th-1f' : 'Rand Write',
	'sq-re-1th-1f' : 'Seq Read',
	'sq-wr-1th-1f' : 'Seq Write',
}

fig, axs = plt.subplots(figsize=(20,5), ncols=len(gf.keys))

plot_num=0
for key, item in gf:
	#print key
	af = gf.get_group(key)

	af_grouped = af.groupby(['wrkl_size','exp_type'], as_index=True)['avg_ops_sec']
	#print af_grouped.apply(list)
	gg = af_grouped.aggregate(np.sum).unstack()
	plot_name='-'.join(key)
	ax = gg.plot(ax=axs[plot_num], kind='bar', title='', edgecolor="red", \
				legend=False, colormap='Paired', log=False, grid=False, rot=-45, alpha=0.75, fontsize=16)

	# title interferes with legend
	#ax.set_title(titles[plot_name],fontsize= 16) # title of plot

	hatches = ''.join(h*len(gg) for h in pattern)

	bars = ax.patches
	for bar, hatch in zip(bars, hatches):
		bar.set_hatch(hatch)

	#ax.legend(bbox_to_anchor=(0.4, 1), fontsize=18) #, ncol=1, loc='upper left')
	ax.set_xlabel(titles[plot_name], fontsize=16)
	if plot_num == 0:
		ax.set_ylabel("Ops/sec (x1000)", fontsize=16)
	plot_num += 1
	#plt.show()
	#plt.savefig(plot_name, bbox_inches='tight')
	#plt.savefig(plot_name + '.eps', bbox_inches='tight', format='eps', dpi=1000)
	#tikz_save(plot_name + '.tex')
	#savefig(plot_name)

fig.legend(bbox_to_anchor=(0.4, 1.1), fontsize=16, ncol=len(gf.keys), loc='upper center')
#plt.show()
plt.savefig('stackfs-ssd-perf', bbox_inches='tight')

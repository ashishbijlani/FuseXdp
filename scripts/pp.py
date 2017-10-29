import numpy as np
import pandas as pd
from operator import itemgetter

import matplotlib.pyplot as plt
#from matplotlib2tikz import save as tikz_save

#plt.style.use('ggplot')
plt.style.use('seaborn-paper')

import matplotlib as mpl

df  pd.read_csv('req.csv')
df.fillna(0)
df  df.groupby(['Request-Type'])['Background-queue-count'] #, 'wrkl_type', 'wrkl' , 'wrkl_size', 'num_threads', 'num_files'])['avg_ops_sec'].mean().reset_index()

for key, item in df:
	print key
	af  df.get_group(key)
	print af
exit(1)

df['avg_ops_sec']  df['avg_ops_sec']/1000

#1th        1f      1
df  df.filt_spec('num_threads', '1th', 'eq')
ff  df.filt_spec('num_files', '1f', 'eq')
#ff  df.filt_spec('count', ' 1', 'eq')

gf  ff.groupby(['wrkl_type', 'wrkl', 'num_threads', 'num_files'], as_indexTrue)
pattern  [ "/" , "\\" , "|" , "-" , "+" , "x", "o", "O", ".", "*" ]
titles  {
	'rd-re-1th-1f' : 'Rand Read',
	'rd-wr-1th-1f' : 'Rand Write',
	'sq-re-1th-1f' : 'Seq Read',
	'sq-wr-1th-1f' : 'Seq Write',
}

fig, axs  plt.subplots(figsize(20,5), ncolslen(gf.keys))

plot_num0
for key, item in gf:
	#print key
	af  gf.get_group(key)

	af_grouped  af.groupby(['wrkl_size','exp_type'], as_indexTrue)['avg_ops_sec']
	#print af_grouped.apply(list)
	gg  af_grouped.aggregate(np.sum).unstack()
	plot_name'-'.join(key)
	ax  gg.plot(axaxs[plot_num], kind'bar', title'', edgecolor"red", \
				legendFalse, colormap'Paired', logFalse, gridFalse, rot-45, alpha0.75, fontsize16)

	# title interferes with legend
	#ax.set_title(titles[plot_name],fontsize 16) # title of plot

	hatches  ''.join(h*len(gg) for h in pattern)

	bars  ax.patches
	for bar, hatch in zip(bars, hatches):
		bar.set_hatch(hatch)

	#ax.legend(bbox_to_anchor(0.4, 1), fontsize18) #, ncol1, loc'upper left')
	ax.set_xlabel(titles[plot_name], fontsize16)
	if plot_num  0:
		ax.set_ylabel("Ops/sec (x1000)", fontsize16)
	plot_num + 1
	#plt.show()
	#plt.savefig(plot_name, bbox_inches'tight')
	#plt.savefig(plot_name + '.eps', bbox_inches'tight', format'eps', dpi1000)
	#tikz_save(plot_name + '.tex')
	#savefig(plot_name)

fig.legend(bbox_to_anchor(0.4, 1.1), fontsize16, ncollen(gf.keys), loc'upper center')
#plt.show()
plt.savefig('stackfs-ssd-perf', bbox_inches'tight')

import numpy as np
import pandas as pd
from operator import itemgetter

df = pd.read_csv('data.csv')
#data = df.values
#exp_types=set(d[0] for d in data)
#wrkl=set(d[1] for d in data)
#wrkl_types=set(d[2] for d in data)
#print exp_types
#print wrkl_types
#print wrkl
df=df.groupby(['exp_type', 'wrkl_type', 'wrkl' , 'wrkl_size', 'num_threads', 'num_files'])['avg_ops_sec'].mean()
df.to_csv('out.csv', header='exp_type,wrkl_type,wrkl,wrkl_size,num_threads,num_files,avg_ops_sec')

#df = pd.read_csv('out.csv')
#print df.groupby(['wrkl_type', 'wrkl' , 'wrkl_size', 'num_threads', 'num_files'])['exp_type', 'avg_ops_sec']
#df.to_csv('res.csv')

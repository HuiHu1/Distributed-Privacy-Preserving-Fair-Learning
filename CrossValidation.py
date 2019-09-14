# -*- coding: utf-8 -*-
import numpy as np
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import KFold
from sklearn.linear_model import Ridge
from sklearn.model_selection import cross_validate

data = np.genfromtxt('Data\compas\compas.csv', delimiter=',')
sample = data[:,0:-1]
label = data[:,-1]
[n,p] = sample.shape
sample_train = sample[0:int(0.75*n),:]
label_train = label[0:int(0.75*n)] 
sample_test = sample[int(0.75*n):,:]
label_test = label[int(0.75*n):]
sample_train = np.c_[np.ones(sample_train.shape[0]),sample_train]
sample_test = np.c_[np.ones(sample_test.shape[0]),sample_test]
[x1,y1]=sample_train.shape
[x2,y2]=sample_test.shape
alpha_set = [1e-5,1e-4,1e-3,1e-2,1e-1,1e0,1e1,1e2,1e3,1e5]
error=np.zeros((10,5)) 
mse=[0,0,0,0,0,0,0,0,0,0] 
K = 5 
Index = np.arange(sample_train.shape[0])
Fold = np.linspace(0,sample_train.shape[0],K+1)
Numpara = 0   
for alpha_candidate in alpha_set: 
    model = Ridge(alpha = alpha_candidate)
    for i in range(K):
        test_data = np.arange(Fold[i],Fold[i+1]).astype(int)
        train_data =np.setdiff1d(Index,test_data).astype(int)
        model.fit(sample_train[train_data,:],label_train[train_data])
        label_test_predict= model.predict(sample_train[test_data])
        error[Numpara][i] = mean_squared_error(label_train[test_data],label_test_predict)
    mse[Numpara]=np.mean(error[Numpara])
    Numpara +=1
opt_index = mse.index(min(mse))
print(opt_index) # position of optimal parameter
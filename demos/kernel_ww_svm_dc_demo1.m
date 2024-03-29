rng(0);
ds = syn_data_2F_3C();

% [x,y]=ds.trefoil(30);
% [x,y] = ds.GMM(50);
[x,y] = ds.nested_circles(50);
n = size(x,2);


k = 3;
C = 1;
sigma_squared = .25;
ker_fun = kernel_functions("rbf",sigma_squared);

tic
svm = kernel_ww_svm_dc(x,y,k,C,ker_fun);
svm.solve();
toc

plot_panels1(x,y,svm);
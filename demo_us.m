
% loading US Stock data

filename = './data/US/us_stock1.mat';
X1 = load(filename).data;

filename = './data/US/us_stock2.mat';
X2 = load(filename).data;

filename = './data/US/us_stock3.mat';
X3 = load(filename).data;

filename = './data/US/us_stock4.mat';
X4 = load(filename).data;

filename = './data/US/us_stock5.mat';
X5 = load(filename).data;

filename = './data/US/us_stock6.mat';
X6 = load(filename).data;

filename = './data/US/us_stock7.mat';
X7 = load(filename).data;


X = [X1, X2, X3, X4, X5, X6, X7];

clear X1; clear X2; clear X3; clear X4; clear X5; clear X6; clear X7;

X = X';

LASTN = maxNumCompThreads(1);

K = size(X, 1);
J = size(X{1}, 2); 
R = 10;
alpha = 10;
total_length = size(X,1);
block_size = 50;


% preprocessing Phase
[prepQ, prepH, prepW, prepV] = ...
preprocessing(X, R+alpha, block_size, total_length);


% query phase
ts = 376;
te = 3747;

Y = X(ts:te);

Maxiters = 10;
conv = 1e-4;

zoompar2_start = tic;
[Q,H,W,V] = query(prepQ, prepH, prepW, prepV, R, block_size, ts, te, Maxiters, conv);
zoompar2_time = toc(zoompar2_start);

zoompar2_error = pf2fitout2(Y,Q,H,V,W,size(Y,1));

fprintf('Running time of ZoomPar2: %4.2f second:\n', zoompar2_time);
fprintf('Error of ZoomPar2: %5.1e:\n', zoompar2_error);




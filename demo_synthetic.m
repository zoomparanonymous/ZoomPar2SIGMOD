LASTN = maxNumCompThreads(1);


noise_level = 1e-2;

K = 2048;
Jgen = 256;
I = 256;

Rgen = 15;
alpha = 10;


% synthetic data generation
V = rand(Jgen,Rgen+alpha);
W = rand(K,Rgen+alpha);

H=orth(orth(rand(Rgen+alpha))');

Q = cell(K,1);

for i=1:K
    Q{i}=orth(rand(I, Rgen+alpha));
end

X = cell(K, 1);
totalnnz = 0;
for i=1:K
    X{i}=Q{i}*H*diag(W(i,:))*V';
    X{i}= X{i}+noise_level*randn(size(X{i}));
end

J = size(X{1}, 2); 
R = 10;

total_length = size(X,1);
block_size = 50;

% preprocessing phase

[prepQ, prepH, prepW, prepV] = ...
preprocessing(X, R+alpha, block_size, total_length);

% query phase 

ts = 124;
te = 1738;

Y = X(ts:te);

Maxiters = 10;
conv = 1e-4;

zoompar2_start = tic;
[Q,H,W,V] = query(prepQ, prepH, prepW, prepV, R, block_size, ts, te, Maxiters, conv);
zoompar2_time = toc(zoompar2_start);
zoompar2_error = pf2fitout2(Y,Q,H,V,W,size(Y,1));

fprintf('Running time of ZoomPar2: %4.2f:\n', zoompar2_time);
fprintf('Error of ZoomPar2: %5.1e:\n', zoompar2_error);

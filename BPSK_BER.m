%% 
%% 
function x=BPSK_BER(Eb_No_db)
Eb_No=10^(Eb_No_db/10);

R=1;
sigma=sqrt(1/(2*R*Eb_No));
BER=0.5*erfc(sqrt(Eb_No));
%disp([Eb_No_db BER]);

n=10000;
nblocks= 10000;
errors = 0;
for i = 1:nblocks
  s = randi([0 1],1,n);
  msg = 1 - 2*s;% converting{0 1} to {1 -1}
  r= msg + sigma*randn(1,n);%randn(1,n) gives the unit variance gaussian distribution multiplying 
% with sigma gives the gaussian dist with variance sigma
  r_cap = (r<0);% thresholding at zero
  errors = errors + sum(s ~= r_cap);
end  
BER_sim = errors/(n*nblocks);
x= BER_sim;
end
  

function out = CHECKcword(B,z,c)
% B- base matrix
% z- expansion factor
% c- candidate codeword, length = #cols(B) * z
% out = 1, if codeword is valid; 0, else

[r,n] = size(B);

syn = zeros(r*z,1); %Hc^T
for i = 1:r
    for j = 1:n
        syn((i-1)*z+1:i*z) = mod(syn((i-1)*z+1:i*z) + MULshift(c((j-1)*z+1:j*z),B(i,j))',2);
    end
end
if any(syn)
    out = 0;
else
    out = 1;
end
function cword = LDPCencode(B,z,msg)
%B: base matrix
%z: expansion factor
%msg: message vector, length = (#cols(B)-#rows(B))*z
%cword: codeword vector, length = #cols(B)*z

[r,n] = size(B);

cword = zeros(1,n*z);
msg = cword(1:(n-r)*z);

%double-diagonal encoding
temp = zeros(1,z);
for i = 1:4 %row 1 to 4
    for j = 1:n-r %message columns
        temp = mod(temp + MULshift(msg((j-1)*z+1:j*z),B(i,j)),2);
    end
end
if B(2,n-r+1) == -1
    p1_sh = B(3,n-r+1);
else
    p1_sh = B(2,n-r+1);
end
cword((n-r)*z+1:(n-r+1)*z) = MULshift(temp,z-p1_sh); %p1
%Find p2, p3, p4
for i = 1:3
    temp = zeros(1,z);
    for j = 1:n-r+i
        temp = mod(temp + MULshift(cword((j-1)*z+1:j*z),B(i,j)),2);
    end
    cword((n-r+i)*z+1:(n-r+i+1)*z) = temp;
end
%Remaining parities
for i = 5:r
    temp = zeros(1,z);
    for j = 1:n-r+4
        temp = mod(temp + MULshift(cword((j-1)*z+1:j*z),B(i,j)),2);        
    end
    cword((n-r+i-1)*z+1:(n-r+i)*z) = temp;    
end



    
    
    
    








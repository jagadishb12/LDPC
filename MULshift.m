function y = MULshift(x,k)
%x: input block,%k: -1 or shift,%y: output
if (k==-1)
    y = zeros(1,length(x));
else
    %multiplication is done for identity and column matrix which results in
    %a colunm matrix whith shift equivalent to the shift in identity matrix
    y = [x(k+1:end) x(1:k)]; 
end
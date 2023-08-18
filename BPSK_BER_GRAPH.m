x=[];
y=[];
z=[];
a=[];
b=[];
for  Eb_No_db = -4 : 14
     y = [y,BPSK_BER(Eb_No_db)];
     z = [z,bpsk_rep(Eb_No_db)];
     x = [x,Eb_No_db];
     a = [a,bpsk_ham_7_4(Eb_No_db)];
     b = [b,LDPC(Eb_No_db)];
end  
plot(x,log10(y));
hold on
plot(x,log10(z));
hold on
plot(x,log10(a));
hold on
plot(x,log10(b));
hold off
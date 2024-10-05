clc;
clear all;
close all;
X = imread('lena5.jpg');

rgbGray=rgb2gray(X);
X1=im2double(rgbGray);
W=round(X1.*255);
W1=W(1);
Y = wavecdf97(W1, 1);

figure 
imshow(Y,[0 255]);

[row1 col1]=size(Y);
row=row1*(1/2);
col=col1*(1/2);
Y11=Y(1:row,1:col1);
Yhl1=Y(row+1:row1,1:col1);

q=8;


B1q=round(Y11/q);
B1qlh1=round(Yhl1/q);

absB1q= abs(B1q);
absB1qhl1= abs(B1q);

M=max(max(absB1q))
Min=min(min(absB1q))
%writematrix(absB1q, '8WT8.csv');

hgate=8;
dectoBin=dec2bin(absB1q);
dectoBin1=dec2bin(absB1qhl1);

numone=nnz(dectoBin);
%numone1=nnz(dectoBin1);

sbit=numone;

%[X1 Y1 Val1]=
[x y z]=find(absB1q);
[a1 b1 c1]=find(absB1qhl1);

rowb1=dec2bin(a1);
erowb1=numel(rowb1);
colb1=dec2bin(b1);
ecolb1=numel(colb1);

rowb=dec2bin(x);
erowb=numel(rowb);
colb=dec2bin(y);
ecolb=numel(colb);

statebit=erowb+ecolb+erowb1+ecolb1;

BR=(numone+sbit+hgate+statebit)/(1000*1000)


Y1=B1q.*q;
Ylhl=B1qlh1.*q;
[x y]=size(Y1);

Z=zeros(row1,col1);

for i=1:1:x
    for j=1:1:col1
    Z(i,j)=Y1(i,j);
    end
end


[x y]=size(Ylhl);

for i=row+1:1:row
    for j=1:1:col
        Z(i,j)=Ylh1(i,j);
    end
end




R = wavecdf97(Z,-1);


%imwrite(R,'q64wt.jpg');


imshow(R, [0 255]);

%[LL, LowResoImg, PSNR] = LLImg(file, Decomlevel);
%[LL, LowResoImg, PSNR] = LLImg(imshow(R), 1);
%imwrite(LL, 'LL_com_fr1.jpg');
%print(PSNR);

PSNR=CalculatePSNR(W1,R)

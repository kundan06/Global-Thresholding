clear;
clc;
a=imread('coins.png');
[rows,columns]=size(a);

deltaT=10^-8;
T0=124;
Tnew=125.4;

while (abs(Tnew-T0)>deltaT)

    T0=Tnew;
    G1=zeros(rows,columns);
    G2=zeros(rows,columns);
    count1=0;
    count2=0;
    for i=1:rows
        for j=1:columns
        if a(i,j)>T0
            G1(i,j)=a(i,j);
            count1 = count1+1;
        else
            G2(i,j)=a(i,j);
            count2 = count2+1;
        end
        end
    end    
    m1=(sum(sum(G1,1),2))/count1;
    m2=(sum(sum(G2,1),2))/count2;

    Tnew=0.5*(m1+m2); 
end

disp(Tnew);

threshold=Tnew;
for i=1:rows
    for j=1:columns
        if a(i,j)>threshold
            b(i,j)=255;
        else
            b(i,j)=0;
        end    
    end
end

figure;
subplot(1,2,1);
imshow(a);
title('Original image');
subplot(1,2,2);
imshow(b);
title(['Thresholded image',num2str(Tnew)]);

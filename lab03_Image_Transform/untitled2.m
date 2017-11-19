x=0:0.1:5;
y=x;
[x y]=meshgrid(x,y);		%构造网格
z=sin(x).*cos(y).*x.*y;	
figure;
surf(x,y,z);		%绘制原图形

x=reshape(x,2601,1);
y=reshape(y,2601,1);
z=reshape(z,2601,1);
m=[x y z];      %几何图形对应的n*3矩阵
t=[1 0 0;
   0 1 0;
   0 0 0.1];    %变换矩阵
m=m*t;          %进行变换
x=m(:,1);
y=m(:,2);
z=m(:,3);
x=reshape(x,51,51);
y=reshape(y,51,51);
z=reshape(z,51,51);
figure;
surf(x,y,z)	%绘制变换后的图形

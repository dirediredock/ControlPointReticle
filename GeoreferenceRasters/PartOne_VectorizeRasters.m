
close all; clear; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
    For the five Canada Department of Mines 1921 maps, below is a
    visualization of their color distribution. These maps do not require a
    Photoshop treatment to remove noise. Unlike the other maps, these 1921 
    maps are high-contrast and information-rich out-of-the-box. In the
    following visualization, a threshold of 100 in the 0-to-255 RBG color
    space to separate data from mild raster noise is visually optimal

        figure('Position',[120,60,1420,780],'Resize','off');hold on;
        xlabel('RGB from 0 to 255');axis tight;drawnow;ylim([-0.1,0.6]);

        I=imread('pointCloud1921a.jpg');A=double(squeeze(I(:,:,1)));
        [hist,~]=histcounts(A,1000,'norm','pdf');
        hist(hist==0)=[];plot(hist);
        I=imread('pointCloud1921b.jpg');B=double(squeeze(I(:,:,1)));
        [hist,~]=histcounts(B,1000,'norm','pdf');
        hist(hist==0)=[];plot(hist);
        I=imread('pointCloud1921c.jpg');C=double(squeeze(I(:,:,1)));
        [hist,~]=histcounts(C,1000,'norm','pdf');
        hist(hist==0)=[];plot(hist);
        I=imread('pointCloud1921d.jpg');D=double(squeeze(I(:,:,1)));
        [hist,~]=histcounts(D,1000,'norm','pdf');
        hist(hist==0)=[];plot(hist);
        I=imread('pointCloud1921e.jpg');E=double(squeeze(I(:,:,1)));
        [hist,~]=histcounts(E,1000,'norm','pdf');
        hist(hist==0)=[];plot(hist);

        threshold=100;xline(threshold);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

threshold=100;

I=imread('RasterData/PointCloud1921a.jpg');
I=flipud(double(squeeze(I(:,:,1))));
I=imresize(I,4,'bilinear');
I(I<threshold)=1;I(I>=threshold)=0;
[height,width]=size(I);
[x,y]=meshgrid(1:width,1:height);
x=x.*I;x=x(:);x(x==0)=[];
y=y.*I;y=y(:);y(y==0)=[];
pointCloud=cat(2,x,y);
figure('Position',[120,60,1420,780],'Resize','off');hold on;
scatter(pointCloud(:,1),pointCloud(:,2),0.1);axis tight;drawnow;
XY_1921a=pointCloud;

I=imread('RasterData/PointCloud1921b.jpg');
I=flipud(double(squeeze(I(:,:,1))));
I=imresize(I,4,'bilinear');
I(I<threshold)=1;I(I>=threshold)=0;
[height,width]=size(I);
[x,y]=meshgrid(1:width,1:height);
x=x.*I;x=x(:);x(x==0)=[];
y=y.*I;y=y(:);y(y==0)=[];
pointCloud=cat(2,x,y);
figure('Position',[120,60,1420,780],'Resize','off');hold on;
scatter(pointCloud(:,1),pointCloud(:,2),0.1);axis tight;drawnow;
XY_1921b=pointCloud;

I=imread('RasterData/PointCloud1921c.jpg');
I=flipud(double(squeeze(I(:,:,1))));
I=imresize(I,4,'bilinear');
I(I<threshold)=1;I(I>=threshold)=0;
[height,width]=size(I);
[x,y]=meshgrid(1:width,1:height);
x=x.*I;x=x(:);x(x==0)=[];
y=y.*I;y=y(:);y(y==0)=[];
pointCloud=cat(2,x,y);
figure('Position',[120,60,1420,780],'Resize','off');hold on;
scatter(pointCloud(:,1),pointCloud(:,2),0.1);axis tight;drawnow;
XY_1921c=pointCloud;

I=imread('RasterData/PointCloud1921d.jpg');
I=flipud(double(squeeze(I(:,:,1))));
I=imresize(I,4,'bilinear');
I(I<threshold)=1;I(I>=threshold)=0;
[height,width]=size(I);
[x,y]=meshgrid(1:width,1:height);
x=x.*I;x=x(:);x(x==0)=[];
y=y.*I;y=y(:);y(y==0)=[];
pointCloud=cat(2,x,y);
figure('Position',[120,60,1420,780],'Resize','off');hold on;
scatter(pointCloud(:,1),pointCloud(:,2),0.1);axis tight;drawnow;
XY_1921d=pointCloud;

I=imread('RasterData/PointCloud1921e.jpg');
I=flipud(double(squeeze(I(:,:,1))));
I=imresize(I,4,'bilinear');
I(I<threshold)=1;I(I>=threshold)=0;
[height,width]=size(I);
[x,y]=meshgrid(1:width,1:height);
x=x.*I;x=x(:);x(x==0)=[];
y=y.*I;y=y(:);y(y==0)=[];
pointCloud=cat(2,x,y);
figure('Position',[120,60,1420,780],'Resize','off');hold on;
scatter(pointCloud(:,1),pointCloud(:,2),0.1);axis tight;drawnow;
XY_1921e=pointCloud;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd('Outputs/PointClouds');

save('XY_1921a.mat','XY_1921a','-v7.3');
save('XY_1921b.mat','XY_1921b','-v7.3');
save('XY_1921c.mat','XY_1921c','-v7.3');
save('XY_1921d.mat','XY_1921d','-v7.3');
save('XY_1921e.mat','XY_1921e','-v7.3');

cd ..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function output=ControlPoints3D(Inputs,Reals)

figure('Position',[120,60,1420,780],'Resize','off');size=7000;
subtightplot(1,2,1);hold on;

T=fitgeotrans(Inputs,Reals,'affine');
[newX,newY]=transformPointsForward(T,Inputs(:,1),Inputs(:,2));
CPs=cat(2,newX,newY);
Error=(Reals-CPs);

for i=1:length(Error)
    
    scatter(Error(i,1),Error(i,2),size,[0,0.4470,0.7410]);
    text(Error(i,1),Error(i,2),{num2str(i)}, ...
        'VerticalAlignment','middle','HorizontalAlignment','center', ...
        'Color','#0072BD');
end

yline(0,'r');xline(0,'r');axis off;axis square;axis tight;
r=0.0002;th=0:pi/100:2*pi;xunit=r*cos(th);yunit=r*sin(th);
plot(xunit,yunit,'r');
r=0.0001;xunit=r*cos(th);yunit=r*sin(th);
plot(xunit,yunit,'r');

subtightplot(1,2,2);hold on;
plot(Reals(:,1)',Reals(:,2)','.-k');
scatter(Reals(:,1),Reals(:,2),size,'or');
scatter(CPs(:,1),CPs(:,2),size,[0,0.4470,0.7410]);
text(Reals(1,1)',Reals(1,2),{1}, ...
    'VerticalAlignment','bottom','HorizontalAlignment','left');
text(Reals(end,1)',Reals(end,2),{num2str(length(Reals))}, ...
    'VerticalAlignment','bottom','HorizontalAlignment','left');
axis off;axis square;
output=T;

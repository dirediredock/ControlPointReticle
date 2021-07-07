
close all; clear; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load Outputs/IntertidalRegion2020
load Outputs/PointClouds/PointCloud1912

iB1=IntertidalRegion2020;
iB2=PointCloud1912;

load Outputs/PointClouds/XY_1921a;

iA=XY_1921a;

Inputs=cat(1,iA(9622142,:),iA(11253954,:),iA(12260502,:),iA(3349950,:), ...
    iA(6606836,:),iA(3108173,:),iA(42711,:),iA(712237,:),iA(10713316,:), ...
    iA(6862944,:),iA(938680,:),iA(9057654,:),iA(1175700,:), ...
    iA(11695978,:),iA(8787170,:),iA(5714734,:),iA(2270665,:), ...
    iA(186620,:),iA(8187549,:));
Reals=cat(1,[-123.079400,49.311060],[-123.065471,49.285070], ...
    [-123.049870,49.308486],[-123.122863,49.315823], ...
    [-123.102954,49.317268],[-123.124472,49.298699], ...
    [-123.146064,49.295635],[-123.137326,49.294015], ...
    [-123.069962,49.307480],[-123.102313,49.283687], ...
    [-123.135756,49.306984],[-123.084105,49.313203], ...
    [-123.134447,49.296526],[-123.060637,49.287593], ...
    [-123.087216,49.283495],[-123.108882,49.284438], ...
    [-123.129354,49.289949],[-123.141426,49.314021], ...
    [-123.091684,49.317146]);

for i=3:length(Reals)
    
    if i==3 || i==4 || i==5
        
        T=Function_ControlPoints3D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel A');
        
        drawnow; saveas(gcf,['A0',num2str(i),'.png']); close all;
    else
        
        T=Function_ControlPoints4D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel A');
        
        drawnow; saveas(gcf,['A0',num2str(i),'.png']); close all;
    end
end

Tprojective=T;

iC1=cat(2,newX,newY);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load Outputs/PointClouds/XY_1921b;

iA=XY_1921b;

[newX,newY]=transformPointsForward(Tprojective,iA(:,1),iA(:,2));
iA=cat(2,newX+0.1,newY+0.005);

Inputs=cat(1,iA(132085,:),iA(723818,:),iA(4694448,:),iA(5746003,:), ...
    iA(5795083,:),iA(21685,:),iA(2709770,:),iA(3705555,:), ...
    iA(4134640,:));
Reals=cat(1,iC1(12404606,:),[-123.0396,49.30695], ...
    [-123.00157583,49.29019711],[-122.992550,49.293499],iB1(8556,:), ...
    iC1(12260235,:),[-123.019429,49.293315],[-123.009740,49.292174], ...
    [-123.005758,49.290456]);

for i=2:length(Reals)
    
    if i==2 || i==3 || i==4 || i==5
        
        T=Function_ControlPoints2D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel B');
        
        drawnow; saveas(gcf,['B0',num2str(i),'.png']); close all;
    else
        
        T=Function_ControlPoints4D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel B');
        
        drawnow; saveas(gcf,['B0',num2str(i),'.png']); close all;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load Outputs/PointClouds/XY_1921c;

iA=XY_1921c;

[newX,newY]=transformPointsForward(Tprojective,iA(:,1),iA(:,2));
iA=cat(2,newX+0.153,newY+0.005);

Inputs=cat(1,iA(1842800,:),iA(315479,:), ...
    iA(1791870,:),iA(2067980,:),iA(2264134,:),iA(1442120,:), ...
    iA(1249011,:),iA(2194053,:),iA(1570577,:),iA(135498,:), ...
    iA(581898,:),iA(549978,:));
Reals=cat(1,iB1(9200,:),[-122.987505,49.294937], ...
    [-122.9486,49.3075],iB1(40415,:),iB1(40463,:), ...
    [-122.956192,49.300545],[-122.961918,49.287133], ...
    [-122.937192,49.312441],[-122.952502,49.289718], ...
    [-122.991602,49.308416],[-122.980383,49.307303], ...
    [-122.981333,49.292251]);

for i=2:length(Reals)
    
    if i==2 || i==3 || i==4 || i==5
        
        T=Function_ControlPoints2D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel C');
        
        drawnow; saveas(gcf,['C0',num2str(i),'.png']); close all;
    else
        
        T=Function_ControlPoints4D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel C');
        
        drawnow; saveas(gcf,['C0',num2str(i),'.png']); close all;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load Outputs/PointClouds/XY_1921e;

iA=XY_1921e;

[newX,newY]=transformPointsForward(Tprojective,iA(:,1),iA(:,2));
iA=cat(2,newX+0.2,newY);

Inputs=cat(1,iA(6049543,:),iA(1116231,:),iA(602705,:), ...
    iA(200307,:),iA(5143892,:),iA(5618605,:),iA(1870471,:), ...
    iA(3643504,:),iA(1007839,:));
Reals=cat(1,[-122.834680,49.277854],[-122.871919,49.301776], ...
    [-122.881395,49.301031],iB1(19318,:),[-122.842980,49.286232], ...
    [-122.839242,49.285027],[-122.865496,49.279489], ...
    [-122.853938,49.292865],[-122.873706,49.291774]);

for i=2:length(Reals)
    
    if i==2 || i==3 || i==4 || i==5
        
        T=Function_ControlPoints2D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel E');
        
        drawnow; saveas(gcf,['E0',num2str(i),'.png']); close all;
    else
        
        T=Function_ControlPoints4D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel E');
        
        drawnow; saveas(gcf,['E0',num2str(i),'.png']); close all;
    end
end

iC5=cat(2,newX,newY);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load Outputs/PointClouds/XY_1921d;

iA=XY_1921d;

[newX,newY]=transformPointsForward(Tprojective,iA(:,1),iA(:,2));
iA=cat(2,newX+0.2,newY);

Inputs=cat(1,iA(255660,:),iA(1596717,:),iA(2176972,:),iA(53860,:), ...
    iA(618504,:),iA(1559946,:),iA(1764207,:),iA(1962969,:), ...
    iA(608245,:),iA(1255367,:));
Reals=cat(1,iB1(62339,:),iB1(16377,:),iC5(125958,:),iB1(40415,:), ...
    iB1(44508,:),[-122.909739,49.288723], ...
    [-122.904187,49.295889],[-122.897957,49.288860], ...
    [-122.927799,49.301238],[-122.916767,49.293251]);

for i=2:length(Reals)
    
    if i==2 || i==3 || i==4 || i==5
        
        T=Function_ControlPoints2D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel D');
        
        drawnow; saveas(gcf,['D0',num2str(i),'.png']); close all;
    else
        
        T=Function_ControlPoints4D(Inputs(1:i,:),Reals(1:i,:));
        [newX,newY]=transformPointsForward(T,iA(:,1),iA(:,2));
        
        scatter(newX,newY,0.1,[0,0.4470,0.7410]);
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Xr');
        scatter(Reals(1:i,1),Reals(1:i,2),999,'Or');
        sgtitle('Canada Department of Mines 1921 - Panel D');
        
        drawnow; saveas(gcf,['D0',num2str(i),'.png']); close all;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

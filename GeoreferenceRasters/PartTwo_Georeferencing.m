
close all; clear; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
    INPUTS
             Canada Department of Mines 1921
                                                 XY_1921a
                                                 XY_1921b
                                                 XY_1921c
                                                 XY_1921d
                                                 XY_1921e
    BLACKBOX

    This script georeferences Canada Department of Mines 1921 maps.
    Railway lines, street intersections, and bridges are some urban
    features that are featured in XY_1921 point clouds that survive
    today intact. This makes these excellent control points, and achieve
    excellent georeferencing of the 1921 state of the Inner Harbour, 
    Central Harbour, and Port Moody regions.

    OUTPUTS
             Outputs/PointClouds
                                                 PointCloud1921a
                                                 PointCloud1921b
                                                 PointCloud1921c
                                                 PointCloud1921d
                                                 PointCloud1921e
                                                 PointCloud1921
                                                 
                                                 Tprojective
             VectorData/Polylines
                                                 HighTide1921
                                                 LowTide1921

    A georeferenced and stitched together point cloud of the 1921 dataset,
    as well as 'drawpolyline' polylines 'HighTide1921' and 'LowTide1921'
    based on this point cloud. The transformation matrix T from the first
    run (XY_1921a), saved as 'Tprojective', is carried over for the
    georeferencing of other maps.
%}

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

T4D=Function_ControlPoints3D(Inputs,Reals);
Tprojective=T4D;
[newX,newY]=transformPointsForward(Tprojective,iA(:,1),iA(:,2));
PointCloud1921a=cat(2,newX,newY);

cd('Outputs/PointClouds');

save('PointCloud1921a.mat','PointCloud1921a','-v7.3');
save('Tprojective.mat','Tprojective','-v7.3');

cd .. ; cd ..

%figure('Position',[120,60,1420,780],'Resize','off');hold on;axis off;
%dcm1=datacursormode();set(dcm1,'UpdateFcn',@DecimalGUI,'Enable','on');
scatter(newX,newY,0.1,[0,0.4470,0.7410]);
scatter(Reals(:,1),Reals(:,2),999,'Xr');
scatter(Reals(:,1),Reals(:,2),999,'Or');
sgtitle('Canada Department of Mines 1921 - Panel A');

iC1=PointCloud1921a;
InputsC1=cat(1,iC1(9622142,:),iC1(11253954,:),iC1(12260502,:), ...
    iC1(3349950,:),iC1(6606836,:),iC1(3108173,:),iC1(42711,:), ...
    iC1(712237,:),iC1(10713316,:),iC1(6862944,:),iC1(938680,:), ...
    iC1(9057654,:),iC1(1175700,:),iC1(11695978,:),iC1(8787170,:), ...
    iC1(5714734,:),iC1(2270665,:),iC1(186620,:),iC1(8187549,:));
RealsC1=Reals;

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

T4D=Function_ControlPoints3D(Inputs,Reals);
[newX,newY]=transformPointsForward(T4D,iA(:,1),iA(:,2));
PointCloud1921b=cat(2,newX,newY);

cd('Outputs/PointClouds');

save('PointCloud1921b.mat','PointCloud1921b','-v7.3');

cd .. ; cd ..

%figure('Position',[120,60,1420,780],'Resize','off');hold on;axis off;
%dcm1=datacursormode();set(dcm1,'UpdateFcn',@DecimalGUI,'Enable','on');
scatter(newX,newY,0.1,[0,0.4470,0.7410]);
scatter(Reals(:,1),Reals(:,2),999,'Xr');
scatter(Reals(:,1),Reals(:,2),999,'Or');
sgtitle('Canada Department of Mines 1921 - Panel B');

iC2=PointCloud1921b;
InputsC2=cat(1,iC2(132085,:),iC2(723818,:),iC2(4694448,:),iC2(5746003,:), ...
    iC2(5795083,:),iC2(21685,:),iC2(2709770,:),iC2(3705555,:), ...
    iC2(4134640,:));
RealsC2=Reals;

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

T4D=Function_ControlPoints4D(Inputs,Reals);
[newX,newY]=transformPointsForward(T4D,iA(:,1),iA(:,2));
PointCloud1921c=cat(2,newX,newY);

cd('Outputs/PointClouds');

save('PointCloud1921c.mat','PointCloud1921c','-v7.3');

cd .. ; cd ..

%figure('Position',[120,60,1420,780],'Resize','off');hold on;axis off;
%dcm1=datacursormode();set(dcm1,'UpdateFcn',@DecimalGUI,'Enable','on');
scatter(newX,newY,0.1,[0,0.4470,0.7410]);
scatter(Reals(:,1),Reals(:,2),999,'Xr');
scatter(Reals(:,1),Reals(:,2),999,'Or');
sgtitle('Canada Department of Mines 1921 - Panel C');

iC3=PointCloud1921c;
InputsC3=cat(1,iC3(1842800,:),iC3(315479,:), ...
    iC3(1791870,:),iC3(2067980,:),iC3(2264134,:),iC3(1442120,:), ...
    iC3(1249011,:),iC3(2194053,:),iC3(1570577,:),iC3(135498,:), ...
    iC3(581898,:),iC3(549978,:));
RealsC3=Reals;

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

T4D=Function_ControlPoints4D(Inputs,Reals);
[newX,newY]=transformPointsForward(T4D,iA(:,1),iA(:,2));
PointCloud1921e=cat(2,newX,newY);

cd('Outputs/PointClouds');

save('PointCloud1921e.mat','PointCloud1921e','-v7.3');

cd .. ; cd ..

%figure('Position',[120,60,1420,780],'Resize','off');hold on;axis off;
%dcm1=datacursormode();set(dcm1,'UpdateFcn',@DecimalGUI,'Enable','on');
scatter(newX,newY,0.1,[0,0.4470,0.7410]);
scatter(Reals(:,1),Reals(:,2),999,'Xr');
scatter(Reals(:,1),Reals(:,2),999,'Or');
sgtitle('Canada Department of Mines 1921 - Panel E');

iC5=PointCloud1921e;
InputsC5=cat(1,iC5(6049543,:),iC5(1116231,:),iC5(602705,:), ...
    iC5(200307,:),iC5(5143892,:),iC5(5618605,:),iC5(1870471,:), ...
    iC5(3643504,:),iC5(1007839,:));
RealsC5=Reals;

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

T4D=Function_ControlPoints4D(Inputs,Reals);
[newX,newY]=transformPointsForward(T4D,iA(:,1),iA(:,2));
PointCloud1921d=cat(2,newX,newY);

cd('Outputs/PointClouds');

save('PointCloud1921d.mat','PointCloud1921d','-v7.3');

cd .. ; cd ..

%figure('Position',[120,60,1420,780],'Resize','off');hold on;axis off;
%dcm1=datacursormode();set(dcm1,'UpdateFcn',@DecimalGUI,'Enable','on');
scatter(newX,newY,0.1,[0,0.4470,0.7410]);
scatter(Reals(:,1),Reals(:,2),999,'Xr');
scatter(Reals(:,1),Reals(:,2),999,'Or');
sgtitle('Canada Department of Mines 1921 - Panel D');

iC4=PointCloud1921d;
InputsC4=cat(1,iC4(255660,:),iC4(1596717,:),iC4(2176972,:),iC4(53860,:), ...
    iC4(618504,:),iC4(1559946,:),iC4(1764207,:),iC4(1962969,:), ...
    iC4(608245,:),iC4(1255367,:));
RealsC4=Reals;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PointCloud1921=cat(1,iC1,iC2,iC3,iC4,iC5);

cd('Outputs/PointClouds');

save('PointCloud1921.mat','PointCloud1921','-v7.3');

cd .. ; cd ..

%{
    At this point I manually traced PointCloud1921 using `drawpolyline` to
    create the vector polylines LowTide1921 and HighTide1921. Each iterations
    creates a new segment, numbered Q01 to Q31, and then concatenated with
    polyline cuts as sourced from PointCloud1921. Temporary polylines here
    saved as `SaveQ` in the Polylines directory.

        h=drawpolyline();
        X=h.Position(:,1);
        Y=h.Position(:,2);
        Q01=cat(2,X,Y);

        LowTide1921=cat(1,Q01,Q02,Q03,Q29,Q04,[NaN,NaN],Q13,Q14,Q15, ...
        Q16,[NaN,NaN],Q27,[NaN,NaN]);
        save('LowTide1921.mat','LowTide1921','-v7.3');

        HighTide1921=cat(1,flipud(Q32),Q05,Q06,Q07,Q08,Q09,Q10,Q11, ...
        Q12,[NaN,NaN],flipud(Q18),Q19,Q20,Q21,Q30,Q23,Q22,Q31,Q24,Q25, ...
        Q26,Q28,[NaN,NaN],Q17,[NaN,NaN]);
        save('HighTide1921.mat','HighTide1921','-v7.3');
%}
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Inputs=cat(1,InputsC1,InputsC2,InputsC3,InputsC4,InputsC5);
Reals=cat(1,RealsC1,RealsC2,RealsC3,RealsC4,RealsC5);

allControls=cat(2,Inputs,Reals);
[~,Q]=sort(allControls(:,1));
allControls=allControls(Q,:);

figure('Position',[120,60,1420,780],'Resize','off');
subtightplot(1,1,1);hold on;axis off;axis tight;
scatter(PointCloud1921(:,1),PointCloud1921(:,2),0.08,'k');
plot(allControls(:,3),allControls(:,4),'-r');
scatter(allControls(:,3),allControls(:,4),999,'Or');
scatter(allControls(:,3),allControls(:,4),999,'Xr');

Function_ControlPoints3D(allControls(:,1:2),allControls(:,3:4));

load VectorData/Polylines/LowTide1921
load VectorData/Polylines/HighTide1921

figure('Position',[120,60,1420,780],'Resize','off');
subtightplot(1,1,1);hold on;axis tight;box on;
plot(LowTide1921(:,1),LowTide1921(:,2),'k','LineWidth',1);
plot(HighTide1921(:,1),HighTide1921(:,2),'k','LineWidth',1);
scatter(PointCloud1921a(1:3:end,1),PointCloud1921a(1:3:end,2),0.08);
scatter(PointCloud1921b(1:3:end,1),PointCloud1921b(1:3:end,2),0.08);
scatter(PointCloud1921c(1:3:end,1),PointCloud1921c(1:3:end,2),0.08);
scatter(PointCloud1921d(1:3:end,1),PointCloud1921d(1:3:end,2),0.08);
scatter(PointCloud1921e(1:3:end,1),PointCloud1921e(1:3:end,2),0.08);
xlabel('WGS84 Longitude'); ylabel('WGS84 Latitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ControlPointReticle(Lat,Lon)

    A=[Lon,Lat];

figure('Position',[120,60,800,800],'Resize','off');
hold on;axis square;box on;

    % EASTERN HORIZONTAL ERROR [0.0001]

    B=[Lon+0.0001,Lat];
    twoPoints=cat(1,A,B);
    haversine=HaversineInMeters(twoPoints);
    plot(twoPoints(:,1),twoPoints(:,2),'-r');
    scatter(twoPoints(2,1),twoPoints(2,2),'.k');
    text(twoPoints(2,1),twoPoints(2,2),[' ',num2str(haversine),' m '], ...
        'VerticalAlignment','bottom','HorizontalAlignment','right');

        % EASTERN HORIZONTAL ERROR [0.0002]

        B=[Lon+0.0002,Lat];
        twoPoints=cat(1,A,B);
        haversine=HaversineInMeters(twoPoints);
        plot(twoPoints(:,1),twoPoints(:,2),'-r');
        scatter(twoPoints(2,1),twoPoints(2,2),'.k');
        text(twoPoints(2,1),twoPoints(2,2),[' ',num2str(haversine),' m '], ...
            'VerticalAlignment','bottom','HorizontalAlignment','right');

    % WESTERN HORIZONTAL ERROR [0.0001]

    B=[Lon-0.0001,Lat];
    twoPoints=cat(1,A,B);
    haversine=HaversineInMeters(twoPoints);
    plot(twoPoints(:,1),twoPoints(:,2),'-r');
    scatter(twoPoints(2,1),twoPoints(2,2),'.k');
    text(twoPoints(2,1),twoPoints(2,2),[' ',num2str(haversine),' m '], ...
        'VerticalAlignment','bottom','HorizontalAlignment','left');

        % WESTERN HORIZONTAL ERROR [0.0002]

        B=[Lon-0.0002,Lat];
        twoPoints=cat(1,A,B);
        haversine=HaversineInMeters(twoPoints);
        plot(twoPoints(:,1),twoPoints(:,2),'-r');
        scatter(twoPoints(2,1),twoPoints(2,2),'.k');
        text(twoPoints(2,1),twoPoints(2,2),[' ',num2str(haversine),' m '], ...
            'VerticalAlignment','bottom','HorizontalAlignment','left');

    % SOUTHERN VERTICAL ERROR [0.0001]

    B=[Lon,Lat-0.0001];
    twoPoints=cat(1,A,B);
    haversine=HaversineInMeters(twoPoints);
    plot(twoPoints(:,1),twoPoints(:,2),'-r');
    scatter(twoPoints(2,1),twoPoints(2,2),'.k');
    text(twoPoints(2,1),twoPoints(2,2),[' ',num2str(haversine),' m '], ...
        'VerticalAlignment','top','HorizontalAlignment','left');

        % SOUTHERN VERTICAL ERROR [0.0002]

        B=[Lon,Lat-0.0002];
        twoPoints=cat(1,A,B);
        haversine=HaversineInMeters(twoPoints);
        plot(twoPoints(:,1),twoPoints(:,2),'-r');
        scatter(twoPoints(2,1),twoPoints(2,2),'.k');
        text(twoPoints(2,1),twoPoints(2,2),[' ',num2str(haversine),' m '], ...
            'VerticalAlignment','top','HorizontalAlignment','left');

    % NORTHERN VERTICAL ERROR [0.0001]

    B=[Lon,Lat+0.0001];
    twoPoints=cat(1,A,B);
    haversine=HaversineInMeters(twoPoints);
    plot(twoPoints(:,1),twoPoints(:,2),'-r');
    scatter(twoPoints(2,1),twoPoints(2,2),'.k');
    text(twoPoints(2,1),twoPoints(2,2),[' ',num2str(haversine),' m '], ...
        'VerticalAlignment','bottom','HorizontalAlignment','left');

        % NORTHERN VERTICAL ERROR [0.0002]

        B=[Lon,Lat+0.0002];
        twoPoints=cat(1,A,B);
        haversine=HaversineInMeters(twoPoints);
        plot(twoPoints(:,1),twoPoints(:,2),'-r');
        scatter(twoPoints(2,1),twoPoints(2,2),'.k');
        text(twoPoints(2,1),twoPoints(2,2),[' ',num2str(haversine),' m '], ...
            'VerticalAlignment','bottom','HorizontalAlignment','left');

% FIGURE SETUP

xticks(Lon-0.0002:0.0001:Lon+0.0002);
yticks(Lat-0.0002:0.0001:Lat+0.0002);

xlabel('WGS84 Longitude'); xlim([Lon-0.00025,Lon+0.00025]);
ylabel('WGS84 Latitude');  ylim([Lat-0.00025,Lat+0.00025]);

r=0.0001;th=0:pi/100:2*pi;
xunit=r*cos(th)+twoPoints(1,1);
yunit=r*sin(th)+twoPoints(1,2);
plot(xunit,yunit,'r');

r=0.0002;th=0:pi/100:2*pi;
xunit=r*cos(th)+twoPoints(1,1);
yunit=r*sin(th)+twoPoints(1,2);
plot(xunit,yunit,'r');

scatter(twoPoints(1,1),twoPoints(1,2),'.k');
text(twoPoints(1,1),twoPoints(1,2),' 0 m ', ...
    'VerticalAlignment','bottom','HorizontalAlignment','left');

% HAVERSINE FORMULA

    function haversine=HaversineInMeters(twoPoints)
        
        radiusOfEarth=6371;
        
        LatA=twoPoints(1,2);
        LatB=twoPoints(2,2);
        LonA=twoPoints(1,1);
        LonB=twoPoints(2,1);
        
        LatA=LatA/(180/pi);
        LatB=LatB/(180/pi);
        LonA=LonA/(180/pi);
        LonB=LonB/(180/pi);
        dLon=LonB-LonA;
        dLat=LatB-LatA;
        haversine=(sin(dLat/2)^2)+(cos(LatA)*cos(LatB)*sin(dLon/2)^2);
        haversine=radiusOfEarth*2000*asin(sqrt(haversine));
        
    end
end
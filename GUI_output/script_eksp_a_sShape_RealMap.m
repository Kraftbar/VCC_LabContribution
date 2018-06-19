world = vrworld('Eks_mountScalTran_eksp_S_shape_moreSV.wrl');
open(world);
fig = view(world, '-internal');
vrdrawnow;
get(world)
nodes(world)
car = vrnode(world, 'TV1')
car1 = vrnode(world, 'SV1')
car2 = vrnode(world, 'SV2')
fields(car)





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


block = gcbh;
FigHandle = figure('Units',          'pixels', ...
                   'Position',       [100 100 800 600], ...
                   'Color',          [0.314 0.314 0.314], ...
                   'Name',           'sdadsad', ...
                   'Tag',            'octavia_graphs_fig', ...
                   'NumberTitle',    'off', ...
                   'IntegerHandle',  'off', ...
                   'Toolbar',        'none', ...
                   'DeleteFcn',      'octavia_graphs([], [], [], ''DeleteFigure'', [], [])');



% store the block handle in the figure UserData
ud.Block = block;

% the x-axis (time) range corresponds to the model Stop time
stoptime = 100;

% create the first graph in the figure
ud.G1_Axes = axes('Position', [0.05 0.1 0.28 0.25], ...
                  'XGrid',    'on', ...
                  'YGrid',    'on', ...
                  'Color',    'k', ...
                  'XColor',   'w', ...
                  'YColor',   'w', ...
                  'XLim',     [0 stoptime], ...
                  'YLim',     [0 4]);
set(ud.G1_Axes, 'Title', title('Connection status SV', 'Color', 'w'));
ud.XData = [];
ud.Y1Data = [];

% create the second graph in the figure
ud.G2_Axes = axes('Position', [0.37 0.1 0.28 0.25], ...
                  'XGrid',    'on', ...
                  'YGrid',    'on', ...
                  'Color',    'k', ...
                  'XColor',   'w', ...
                  'YColor',   'w', ...
                  'XLim',     [0 stoptime]);
set(ud.G2_Axes, 'Title', title('Real-time delay avg.', 'Color', 'w'));
ud.XData = [];
ud.Y2Data = [];

% create the third graph in the figure
ud.G3_Axes = axes('Position', [0.69 0.1 0.28 0.25], ...
                  'XGrid',    'on', ...
                  'YGrid',    'on', ...
                  'Color',    'k', ...
                  'XColor',   'w', ...
                  'YColor',   'w', ...
                  'XLim',     [0 stoptime]);
set(ud.G3_Axes, 'Title', title('Overall performance', 'Color', 'w'));
ud.XData = [];
ud.Y3Data = [];

% draw the lines
try
  % try HG2 first
  ud.G1_Line = animatedline('Parent', ud.G1_Axes, ...
                            'Color', 'y', ...
                            'Marker', '.',...
                            'LineStyle','none',...
                            'MaximumNumPoints', 5000);
  ud.G2_Line = animatedline('Parent', ud.G2_Axes, ...
                            'Color', 'y', ...
                            'MaximumNumPoints', 5000);
  ud.G3_Line = animatedline('Parent', ud.G3_Axes, ...
                            'Color', 'y', ...
                            'MaximumNumPoints', 5000);
catch
  % fallback to HG1 if not available
  ud.G1_Line = line(0, 0, 'Parent', ud.G1_Axes, 'EraseMode', 'None', 'Color', 'y', 'LineStyle', '-');
  ud.G2_Line = line(0, 0, 'Parent', ud.G2_Axes, 'EraseMode', 'None', 'Color', 'y', 'LineStyle', '-');
  ud.G3_Line = line(0, 0, 'Parent', ud.G3_Axes, 'EraseMode', 'None', 'Color', 'y', 'LineStyle', '-');
end

% open vrworld if not open already

vr_world = vrworld('Eks_mountScalTran_eksp_S_shape_moreSV.wrl');
if ~isopen(vr_world)
  open(vr_world);
end
ud.vr_world = vr_world;

% create two canvases in the figure
vr.canvas(vr_world, 'Parent', FigHandle, ...
          'Units', 'normalized', ...
          'Position', [0.03 0.45 0.45 0.53]);
c2 = vr.canvas(vr_world, 'Parent', FigHandle, ...
               'Units', 'normalized', ...
               'Position', [0.52 0.45 0.45 0.53]);
set(c2, 'Viewpoint', 'VPfollow');
C1 = vr.canvas(vr_world, 'Parent', FigHandle, ...
               'Units', 'normalized', ...
               'Position', [0.03  0.45 0.45 0.53]);
set(C1, 'Viewpoint', 'View1');



% Associate the figure with the block, and set the figure's UserData.
set(FigHandle, 'UserData', ud, 'HandleVisibility', 'callback');

% end Create_3GFigure

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%% Itterate veacle data 
done=0;
RouteCar1=[];
laneIDs=[string(a.fcd_dash_export.timestep{1}.vehicle.Attributes.lane)];
tester=0;
for j =1:length(a.fcd_dash_export.timestep) % timestep
    for i = 1:numel(a.fcd_dash_export.timestep{j}.vehicle) % cars
        if(length(a.fcd_dash_export.timestep{j}.vehicle)==1)
            data=a.fcd_dash_export.timestep{j}.vehicle.Attributes;
            
        else
            data=a.fcd_dash_export.timestep{j}.vehicle{i}.Attributes;
        end
        laneID=(data.lane);
        
        % Gets info first car
        % gethers it to RouteCar1
        if(i==1)
            dataAng=str2num(data.angle);
            dataX=str2num(data.x);
            dataY=str2num(data.y);
            if( ~(strcmp(string(data.lane),laneIDs(end)) ))
                laneIDs=[laneIDs   string(data.lane)];
            end
            RouteCar1=[RouteCar1; dataX dataY dataAng];
        end
        
        tester=tester+1;
    end
    if (tester==300)
        break;
    end
end
%%%% Itterate veacle data 


bias=(min(RouteCar1));
RouteCar1=[RouteCar1(:,1)-bias(1),RouteCar1(:,2)-bias(2),RouteCar1(:,3)];
RouteCar1=[RouteCar1(:,1)/10,RouteCar1(:,2)/10,RouteCar1(:,3)];
% a.fcd_dash_export.timestep{1, 20}.vehicle{2}.Attributes.angle
% a.fcd_dash_export.timestep{1, 2}.vehicle.Attributes.angle




















reload(world);    











car.rotation = [0, 1, 0, -1.5];
cartv2.rotation = [0, 1, 0, -1.5];

% cara.rotation = [0, 2, 0, 0];

world.TV1.children(1,1).appearance.material.diffuseColor=[0.6 0.6 0.6]
world.SV2.children(1,4).children.appearance.material.diffuseColor=[0.6 0.6 0.6]
sving=8
% corr with pause
t1=(0:200)/2
% x
z1 = -10+t1;
x1 =  + t1/4;
% elevation
y1 = 0.25 + zeros(length(t1));

%x1 = 3 + zeros(size(z1));
%y1 = 0.25 + zeros(size(z1));





for i=1:length(x1)-1   
    ii=i-4;
    if(ii<1)
        ii=1
    end
    iii=i-8;
    if(iii<1)
        iii=1
    end  
    
    
    
    
    
    car.translation = [RouteCar1(i,1) (y1(ii)) RouteCar1(i,2)+3];
    car1.translation = [sin(x1(i))*sving+16 (y1(i)) (z1(i))];
    car2.translation = [sin(x1(iii))*sving+16 (y1(iii)) (z1(iii))-6];
    
    % seems to rotate a bit too much

    car.rotation = [0, 1, 0, deg2rad(RouteCar1(i,3))-1.4];
    car2.rotation = [0, 1, 0, ((atan(((sin(x1(iii+1))*sving-sin(x1(iii))*8)/(z1(iii+1)-z1(iii))))))];
    car1.rotation = [0, 1, 0, ((atan(((sin(x1(i+1))*sving-sin(x1(i))*8)/(z1(i+1)-z1(i))))))];
    
    vrdrawnow;
    pause(0.08);
    
    %%%%%%%%%%%%%%%%%%%%%
    if( any(ismember(M(ceil(i/12)+10,:),1)) )
    world.SV1.children(1,4).children.appearance.material.diffuseColor=[0.1 0.3 0.1];
    addpoints(ud.G1_Line, [x1(i),x1(i+1)] , [1,1]);
    else
    world.SV1.children(1,4).children.appearance.material.diffuseColor=[0.1 0.1 0.1];
    end
    if(any(ismember(M(ceil(i/12)+10,:),2)) )  
    world.SV2.children(1,4).children.appearance.material.diffuseColor=[0.1 0.3 0.1];
    addpoints(ud.G1_Line, [x1(i),x1(i+1)] , [2,2]);
    else
    world.SV2.children(1,4).children.appearance.material.diffuseColor=[0.1 0.1 0.1];
    end
    %%%%%%%%%%%%%%%%%%%%
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% WRITE ROAD
vei=[]
for i=1:length(x1)   
    vei =[vei sin(x1(i))*sving+11 0.01 (z1(i))];
    vei =[vei sin(x1(i))*sving+21 0.01 (z1(i))];

end


fileID = fopen('points.txt','w');
fprintf(fileID,"[");
fprintf(fileID,'%6.2f %6.2f %6.2f, \n ',(vei));
fprintf(fileID,']');
fclose(fileID);



% -0.9210
drawOrder=[]
for i=0:length(x1)-3 % riktig
    i=i*2;
    drawOrder=[drawOrder 0+i 2+i 3+i 1+i -1];
end

fileID = fopen('draw.txt','w');
fprintf(fileID,"[");
fprintf(fileID,'%i ,',drawOrder);
fprintf(fileID,"]");
fclose(fileID);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% WRITE ROAD




reload(world);
vrdrawnow;




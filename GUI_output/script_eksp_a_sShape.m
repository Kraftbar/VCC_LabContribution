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


% for i = 1:numel(fields)
%  teststruct.(fields{i})
% end
% 



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
y1 = 0.25 + zeros(size(t1));

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
    
    car.translation = [sin(x1(ii))*sving+20 (y1(ii)) (z1(ii))+3];
    car1.translation = [sin(x1(i))*sving+16 (y1(i)) (z1(i))];
    car2.translation = [sin(x1(iii))*sving+16 (y1(iii)) (z1(iii))-6];
    
    % seems to rotate a bit too much

    car.rotation = [0, 1, 0, ((atan(((sin(x1(ii+1))*sving-sin(x1(ii))*8)/(z1(ii+1)-z1(ii))))))-1.4];
    car2.rotation = [0, 1, 0, ((atan(((sin(x1(iii+1))*sving-sin(x1(iii))*8)/(z1(iii+1)-z1(iii))))))];
    car1.rotation = [0, 1, 0, ((atan(((sin(x1(i+1))*sving-sin(x1(i))*8)/(z1(i+1)-z1(i))))))];
    
    vrdrawnow;
    pause(0.08);
    
    %%%%%%%%%%%%%%%%%%%%%
    if(M(ceil(i/12)+10,1)==1 || M(ceil(i/12)+10,2)==1)
    world.SV1.children(1,4).children.appearance.material.diffuseColor=[0.1 0.3 0.1]
    else
    world.SV1.children(1,4).children.appearance.material.diffuseColor=[0.1 0.1 0.1]
    end
    if(M(ceil(i/12)+10,1)==2 || M(ceil(i/12)+10,2)==2)  
    world.SV2.children(1,4).children.appearance.material.diffuseColor=[0.1 0.3 0.1]
    else
    world.SV2.children(1,4).children.appearance.material.diffuseColor=[0.1 0.1 0.1]
    end
    %%%%%%%%%%%%%%%%%%%%
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% WRITE ROAD
vei=[]
for i=1:length(x1)   
    vei =[vei asin(x1(i))*sving+11 0.01 (z1(i))]
    vei =[vei sin(x1(i))*sving+21 0.01 (z1(i))]

end


fileID = fopen('points.txt','w');
fprintf(fileID,"[");
fprintf(fileID,'%6.2f %6.2f %6.2f, \n ',(vei));
fprintf(fileID,']');
fclose(fileID);



% -0.9210
drawOrder=[]
for i=0:length(x1)-3 % riktig
    i=i*2
    drawOrder=[drawOrder 0+i 2+i 3+i 1+i -1]
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




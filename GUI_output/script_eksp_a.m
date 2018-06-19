
car.rotation = [0, 1, 0, -1.5];

% cara.rotation = [0, 2, 0, 0];

world.TV1.children(1,1).appearance.material.diffuseColor=[0.6 0.6 0.6]

z1 = 0:12;
x1 = 3 + zeros(size(z1));
y1 = 0.25 + zeros(size(z1));

z2 = 12:0.5:26; 
x2 = 3:(1.4285/2):23;
y2 = 0.25 + zeros(size(z2));

x3 = 23:43;
z3 = 26 + zeros(size(x3));
y3 = 0.25 + zeros(size(z3));

for i=1:length(x1)   
    car.translation = [x1(i) y1(i) z1(i)];
     %cara.translation = [x1(i) y1(i) z1(i)];
    vrdrawnow;
    pause(0.1);
end

world.TV1.children(1,1).appearance.material.diffuseColor=[0 1 0]

car.rotation = [0, 1, 0, -0.7];
%cara.rotation = [0, 1, 0, 0.9];
vrdrawnow;


for i=1:length(x2)
    car.translation = [x2(i) y2(i) z2(i)];
    %cara.translation = [x2(i) y2(i) z2(i)];
    vrdrawnow;    
    pause(0.1);
end



car.rotation = [0, 1, 0, 0];
%cara.rotation = [0, 1, 0, 1.5];
vrdrawnow;


world.TV1.children(1,1).appearance.material.diffuseColor=[0.6 0.6 0.6]
for i=1:length(x3)
    car.translation = [x3(i) y3(i) z3(i)];
    %cara.translation = [x3(i) y3(i) z3(i)];
    vrdrawnow;
    pause(0.1);
end

reload(world);
vrdrawnow;




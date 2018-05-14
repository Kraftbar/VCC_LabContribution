for i=1:length(x1)
    car.translation = [x1(i) y1(i) z1(i)];
    vrdrawnow;
    pause(0.1);
end

car.rotation = [0, 1, 0, -0.7];
vrdrawnow;
for i=1:length(x2)
    car.translation = [x2(i) y2(i) z2(i)];
    vrdrawnow;
    pause(0.1);
end

car.rotation = [0, 1, 0, 0];
vrdrawnow;

for i=1:length(x3)
    car.translation = [x3(i) y3(i) z3(i)];
    vrdrawnow;
    pause(0.1);
end
% reload(world);
% vrdrawnow;
world = vrworld('vrmount.wrl');
open(world);
fig = view(world, '-internal');
vrdrawnow;
get(world)
nodes(world)
car = vrnode(world, 'Automobile')
fields(car)

world = vrworld('Eks_mountScalTran.wrl');
open(world);
fig = view(world, '-internal');
vrdrawnow;
get(world)
nodes(world)
car = vrnode(world, 'TV1')
cara = vrnode(world, 'SV1')
fields(car)
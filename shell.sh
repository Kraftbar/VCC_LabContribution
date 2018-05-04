# !/bin/bash
# 1. shell command
# 2. python moding the text

# guindy MAPNAME
clear
echo "Good morning, world."
cd $HOME
cd Downloads/
netconvert --osm-files MAPNAME.osm -o MAPNAME.net.xml
# cd $SUDOHOME
cd /home/pradeepkumar&USER????&/sumo-0.26.0/data
cd /home/pradeepkumar&USER????&/sumo-0.26.0/data/typemap/
cp osmPolyconvert.typ.xml /home/pradeepkumar&USER????&/guindy/
cd guindy/
polyconvert --net-file guindy.net.xml
			 --osm-files guindy.osm 
			 --type-file osmPolyconvert.xml
			  -o guindy.poly.xml
# 4 files

python /home/pradeepkumar&USER????&/sumo-0.26.0/tools/randomTrips.py 
			-n guindy.net.xml -r guindy.rou.xml -e 50 -l

## PYTHON WRITE A CONFIGURATION FILE ( 17 min)


sumo-gui guindy.sumo.cfg
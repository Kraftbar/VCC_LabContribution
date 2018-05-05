
# 							How to run
# -----------------------------------------------------------------------
# |  C:\Users\USERNAME\src\omnetpp-5.1.1\mingwenv		# open terminal	|
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# |  chmod +x testing.sh		# Gives execute permission to script	|
# |  ./yourscript.sh			# runs script							|
# -----------------------------------------------------------------------



cd ~/../..   # if opened in opnetp-5.1.1
cd Downloads/

# 1. first command
~/../../src/sumo-0.30.0/bin/netconvert --osm-files map.osm -o testmap.net.xml
cd ..
cd src/sumo-0.30.0_test/data/typemap/
# 2. copy
cp osmPolyconvert.typ.xml  ~/../../Downloads
cd ~/../../Downloads 
# 2. secound command
~/../../src/sumo-0.30.0/bin/polyconvert --net-file testmap.net.xml --osm-files map.osm --type-file osmPolyconvert.typ.xml -o testmap.poly.xml
# python script
python ~/../../src/sumo-0.30.0/tools/randomTrips.py -n testmap.net.xml -r testmap.rou.xml -e 50 -l

# Config file
cd ~/../../Downloads 
echo '
<configuration>
	<input>
        <net-file value="testmap.net.xml"/>
        <route-files value="testmap.rou.xml"/>
        <additional-files value="testmap.poly.xml"/>
	</input>
	<time>
		<begin value="0"/>
		<end value="100"/>
		<step-length value="0.1"/>
	</time>
</configuration>
'> testmap.sumo.cfg


## NOT DONE YET
~/../../src/sumo-0.30.0/bin/sumo-gui  testmap.sumo.cfg
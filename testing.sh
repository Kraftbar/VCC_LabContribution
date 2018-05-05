
# 							How to run
# -----------------------------------------------------------------------
# |  C:\Users\USERNAME\src\omnetpp-5.1.1\mingwenv		# open terminal	|
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# |  chmod +x testing.sh		# Gives execute permission to script	|
# |  ./yourscript.sh			# runs script							|
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# |  Ones SUMO opens remember to set ~120ms								|
# -----------------------------------------------------------------------
echo "
try:
    # for Python2
    from Tkinter import *
except ImportError:
    # for Python3
    from tkinter import *


fields = 'Last Name', 'First Name', 'Job', 'Country'

def fetch(entries):
   for entry in entries:
      field = entry[0]
      text  = entry[1].get()


def makeform(root, fields):
   entries = []
   for field in fields:
      row = Frame(root)
      lab = Label(row, width=15, text=field, anchor='w')	
      ent = Entry(row)
      row.pack(side=TOP, fill=X, padx=5, pady=5)
      lab.pack(side=LEFT)
      ent.pack(side=RIGHT, expand=YES, fill=X)
      entries.append((field, ent))
   return entries

if __name__ == '__main__':
   root = Tk()
   ents = makeform(root, fields)
   root.bind('<Return>', (lambda event, e=ents: fetch(e)))   
   b1 = Button(root, text='Show',
          command=(lambda e=ents: fetch(e)))
   b1.pack(side=LEFT, padx=5, pady=5)
   b2 = Button(root, text='Quit', command=root.quit)
   b2.pack(side=LEFT, padx=5, pady=5)
   root.mainloop()
"> lol.py
python lol.py


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


## Startes the sim
~/../../src/sumo-0.30.0/bin/sumo-gui  testmap.sumo.cfg
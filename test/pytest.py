# bengaluru -> guindy 


f = open('MAPNAME.sumo.cfg','r')
message = f.read()

									# __________ #
message = message.replace('bengaluru','FILENAME')
									# *********** #

print(message)
# f.write(message)
f.close()
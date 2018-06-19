

try:
    # for Python2
    from Tkinter import *
except ImportError:
    # for Python3
    from tkinter import *





file = open('vars.txt', 'w')
a=chr(34)

fields = 'Task vec.', 'Serice vec.', 'Simulation Time'

def fetch(entries):
   for entry in entries:
      field = entry[0]
      text  = entry[1].get() 
      file.write(field+'='+a+text+a )
      file.write('\n')
      

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
   b1 = Button(root, text='Apply',
          command=(lambda e=ents: fetch(e)))
   b1.pack(side=LEFT, padx=5, pady=5)
   b2 = Button(root, text='Quit', command=root.quit)
   b2.pack(side=LEFT, padx=5, pady=5)
   root.mainloop()



file.close()


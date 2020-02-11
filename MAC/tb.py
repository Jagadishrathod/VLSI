import re
import itertools
filename=input("Enter filename:")
hand = open(filename)
y=filename.split('.')
f=open(y[0]+'1_tb.v',"w")
inputs=[]
outputs=[]
for line in hand:
	line = line.rstrip()
	if re.search('^input',line):
		f.write(line.replace('input','reg')+'\n')
		line=line.replace(';','')
		m=re.split("\s",line, 1)
		g=m[1].split(',')
		q=line.split('[')
		if(q[0]!=line):
			r=q[1].split(':')[1].split(']')
			s=r[1].split(',')
			for i in range(len(s)):
				for j in range(int(q[1].split(':')[0]) - int(r[0]) + 1):
					inputs.append(s[i]+'['+str(j)+']')
		else:
			inputs.extend(m[1].split(','))
					
			
	elif re.search('^output',line):
		f.write(line.replace('output','wire')+'\n')
		line=line.replace(';','')
		n=re.split("\s",line, 1)
		q=line.split('[')
		if(q[0]!=line):
			r=q[1].split(':')[1].split(']')
			s=r[1].split(',')
			for i in range(len(s)):
				for j in range(int(q[1].split(':')[0]) - int(r[0]) + 1):
					outputs.append(s[i]+'['+str(j)+']')
		else:
			outputs.extend(n[1].split(','))
	elif re.search('^module',line):
		modname=line.split()[1].split('(')[0]
		f.write('`include "'+filename+'\n')
		f.write(line.replace(line,'module top;')+'\n')
	elif re.search('endmodule',line):
		inputstring = ','.join(inputs)
		outputstring = ','.join(outputs)
		f.write(modname+' t1('+m[1]+','+n[1]+');'+'\n')
		f.write("initial begin"+'\n')
		x=list(itertools.product([0, 1], repeat=len(inputs)))
		for j in range(len(x)):
			for k in range(len(inputs)):	
				f.write(inputs[k])
				f.write('='+str(x[j][k]))
				f.write(';\n')
			f.write("#5;\n")
		f.write("end"+'\n')
		f.write("initial begin"+'\n')
		f.write('$display("')
		for k in inputs:
			f.write(k+"=%d,")
		for k in outputs:
			f.write(k+"=%d,")
		f.write('",'+inputstring+','+outputstring+');'+'\n')
		f.write("end"+'\n')
		f.write(line+'\n')

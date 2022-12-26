#file read / write
fn = 'test.txt'
f= open(fn,'w')
for i in range(1,101):
    f.write(str(i))
    f.write(" ")
f.close()

#readline
f = open(fn,'r')
while True:
    line = f.readline()
    if not line:
        break
    print('readline => ',line)
f.close()
print('*'*60)

#readlines
f = open(fn,'r')
lines = f.readlines()
print('readlines => ',lines)
f.close()
print('*'*60)

#read
f = open(fn,'r')
data = f.read()
print('read => ',data)
f.close()

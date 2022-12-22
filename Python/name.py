#본인 이름 출력
print("박요한")
'''
여
러
줄
주
석
'''
a=10
print(a)

#if test-------------------
a=10
if(a>1):
    print('a는 1보다 큼')

#while Test----------------
while(a<20):
    a=a+1
    print(a)
    

#함수----------------------
def add(a,b):
    return a+b

#함수 add()----------------
print(add(-10,3))

# 2의 3승 표현
c= 2**3
d= 3**2
e= 7//3
print(c)
print(d/c)
print(e)

#문자열 표현
joke = "nongdam "
bear = "gom "

print(len((joke+bear)*3))
print("-"*40)

head = "You need Python"
l = len(head)
print(l)

#문자열 인덱싱과 슬라이싱
a = "Life is too Short, You need Python"
print('a[3]: ',a[3])
print(a[0:4])
print(a[10:])
print(a[:10])
b="20010331Rainy"
print('year :', b[:4])
print('month : ', b[4:6])
print('day :' , b[6:8])
print('weather : ', b[8:])
print("-"*40)
a="Pithon"




print(a[:1] + 'y' + a[2:])

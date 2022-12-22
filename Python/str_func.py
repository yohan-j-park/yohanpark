#문자열 함수
a='hobby'
print(a.count('b'))
print(a.find('b'))
print(a.find('y'))
print(a.find('z'))
print('-'*30)

print(a.index('b'))
print(a.index('o'))

a=','.join('abcd')
print(a)
s='1234'
a='-'.join(s)
print(a)

#list-join
a=['a','b','c','d']
b='*'.join(a)
print(b)


#공백지우기

a="                       hi                            "
print(a)
print(a.lstrip())
print(a.rstrip())
print(a.strip())

#문자열바꾸기
a='Life is too short'
b=a.replace('short','long')
print(b)


#문자열 나누기
b=a.split()
print(b)
print(b[0])

a='tes,rtgw5,6w45,6w45,6w4,5nbw,46w,56b,54by,w5,yf,4s5yb,4srt'
b=a.split(',')
print(b)

#리스트의 인덱싱
a=[123,456,789,"가나다","라마바"]
print(a)
print(a[0])
print(len(a))
print(a[0]+a[1])
print(a[3]+a[4])

a=[1,2,3,['a','b','c']]
print(a[3])
print(a[-1])
print(len(a))
print(len(a[3]))
print(a[3][0])
print(a[-1][1])

a=[1,2,3,4,5]
b=a[:2]
c=a[2:]

print('a =>',a)
print('b =>',b)
print('c =>',c)

a=[1,2,3,['a','b','c'],4,5]
b=a[2:5]
c=a[3][:2]
print('a =>',a)
print('b =>',b)
print('c =>',c)

a=[1,2,3,4,5]
del a[2:]
print(a)
a.append([3,4,5])
print(a)
a=[1,2,3,4,5]
a.extend([6,7])
print(a)

a.reverse()
print(a)
a.sort()
print(a)
a.remove(7)
print(a)

#리스트의 슬라이싱
a=[1,2,3,4,5]
print(a[0:2])


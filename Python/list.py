# sort
a=[4,3,2,1,7,5,6]
a.sort()
print('sort =>',a)
print('-'*50)

a=[4,3,2,1,7,5,6]
b=sorted(a)
print('원본배열 =>',a)
print('sorted =>',b)
print('-'*50)

#reverse
a=[4,3,2,1,7,5,6]
a.sort(reverse=True)
print('reverse True=>',a)
print('-'*50)

a=[4,3,2,1,7,5,6]
a.sort(reverse=False)
print('reverse False=>',a)
print('-'*50)

#sorted, reverse
a=[4,3,2,1,7,5,6]
b=sorted(a, reverse=True)
print('원본배열 =>',a)
print('sorted + reverse True =>',b)
print('-'*50)

#대소문자 구별없이 정렬
a=['B','c','A','d','11','9','1','a','C']
b=sorted(a)
print('sorted => ',b)
print('-'*50)

a=['Badf','Agaf','aasdf','basdf','1acgrf']
b=sorted(a)
c=sorted(a, key=str.lower)

print('원본 =>',a)
print('sorted =>',b)
print('sorted + key=str.lower =>',c)
print('-'*50)


#요소 삽입
a=[1,2,3]
a.insert(3,4)
a.insert(-1,3.5)
a.append(4.5)
print('insert(3,4 / -1,3.5),append(4.5) => ',a)
print('-'*50)

a.remove(4.5)
a.remove(3.5)
print('remove =>',a)

a.extend([5])
a.append([6,7,8])
print('extend[5] + append[6,7,8] => ',a)
print('-'*50)

#tuple
a=(1,2,3,4)
print(a[0])
print(a[0:3])
print(a[2:])
print('-'*50)

a=(1,2,3,4)
b=(5,6,7)
print('tuple a =>',a)
print('tuple b =>',b)
print('a+b =>',a+b)
print('a*2 =>',a*2)
print('a + (5,) => ',a+(5,))
print('-'*50)


#dictionary
dic = {1:'abc', 2:'def', (3,4):'zzz'}
print('dic =>',dic)
print('-'*50)

a={1:'a'}
print(a)
a[2] = 'b'
print("a[2] ='b' => ", a)
print('-'*50)


a={}
a['name']='hong'
print("['name']='hong' => ",a)
del a['name']
print("del['name'] => ",a)
print('-'*50)

dic={'name':'hong','phone':'010-1234-5678','age':18,'address':'seoul'}
key = dic.keys()
value = dic.values()
print('dic => ',dic)
print('dic.keys() => ',key)
print('dic.values() => ',value)
print('-'*50)

print('[for in]')
for k in key: print('key: ',k, '=', dic[k])
for v in value : print('value: ',v)

for k in key: print('key: ',k, '=', dic.get(k))
print('-'*50)


#set
a="hello"
b=set(a)
print('a =>',a)
print('set(a) =>',b)
print('-'*50)

s1 = set([1,2,3,4,5,6])
s2 = set([4,5,6,7,8,9])

print('s1 =>',s1)
print('s2 =>',s2)

print('s1&s2(교집합) =>',s1&s2)
print('s1|s2(합집합) =>',s1|s2)
print('s1-s2(차집합) =>',s1-s2)
print('s2-s1(차집합) =>',s2-s1)

print('-'*50)
s1.add(7)
s1.add(8)
print('s1 =>',s1)
s1.update(['a','b','c'])
print("update('a','b','c') =>",s1)
s1.remove('c')
print("remove('c') =>",s1)
print('-'*50)

#while
while s1:
    s1.pop()
    print(s1)




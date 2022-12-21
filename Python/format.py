a = "i eat %d apples" %200
print(a)

a= " i eat 200 %s " %"appels"
print(a)

b= "...%d ....%s" %(10, "abc")
print(b)

#format 문자열에 숫자, 정렬, 소숫점자리

a = "%20s" %"abc"
print(a)

a = "%0.4f" %3.1239999
print(a)

a=3.123414
b='%f => %0.4f' %(a,a)
print(b)

#format  함수를 사용하는 방법
a='.......{0}......'.format(10)
print(a)

a='...{0}....{1}...'.format(10,20)
print(a)

a='...{0}....{1}...'.format('one','two')
print(a)

a='...{name}....{age}...'.format(name='hong',age=20)
print(a)


#format문자열을 사용한 정렬
a='...{0:<10}...{1:>10}...'.format('abc','def')
print(a)

a='...{0:<10}...{1:^10}...{2:>10}...'.format('abc','def','ghi')
print(a)

a='{0:*>10}'.format(500)
print(a)

#f문자열 포매팅
name='hong'
age=30
a=f'...{name}....{age+1}'
print(a)

y=123.456789
a=f'{y} => ...{y:0.3f}'
print(a)

#딕셔너리
d={'name' : 'hong', 'age' : 30}

f=f"나의 이름은 {d['name']}입니다. 나이는{d['age']}입니다."
print(f)


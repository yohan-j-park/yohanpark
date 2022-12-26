#함수 정의
def add(a,b):
    c=a+b
    return c
k = add(10,20)
print(k)


def add(*args):
    print(args)    
k = add(10,20,'hong')

def add(*args):
    for i in args:
        print(i)

add(10,20,30,'010-1111-1111')

#매개변수로 들어온 값들의 합계
def add(*args):
    s=0
    for i in args:
        s += i
    return s
k = add(1,2,3,4,5)
print('add(1,2,3,4,5) =>',k)
k = add(10,20,30)
print('add(10,20,30) =>',k)
print('*'*50)

#return 값의 유형을 타입별로
def func1():
    return [1,2,3]
print('func1() => ',func1())

def func2():
    return (1,2,3,4,5)
print('func2() => ',func2())

def func3():
    return {1,2,3}
print('func3() => ',func3())

def func4():
    return{'name':'hong', 'age' : 20}
print('func4() => ',func4())
print('*'*50)

#매개변수를 키워드 매개변수 형태로 표현
def func(**kwargs):
    print(kwargs)
func(name='hong',age=20)
print('*'*50)

'''
a,b,c에 임의의 값을 대입하여 매개변수로 전달하고
a,b,c의 합계를 리턴하는 함수 func5를 정의하시오.
단, 매개변수는 키워드로 받고 리턴값은 dictionary타입으로
a,b,c,합계를 모두 리턴
'''
def func5(**kwargs):
    print(kwargs)
    hap=kwargs['a'] + kwargs['b'] + kwargs['c']
    kwargs['hap'] = hap
    return kwargs
        
k = func5(a=10,b=20,c=30)
print('func5(10,20,30) =>',k)

def func6(a,b,c):
    s = a+b+c
    dic={}
    dic['a']=a
    dic['b']=b
    dic['c']=c
    dic['s']=s
    return dic
k = func6(10,20,30)
print('func6(10,20,30) =>',k)
print('*'*50)
    
    

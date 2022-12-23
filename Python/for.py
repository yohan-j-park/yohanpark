#for
test=[1,2,3]
for i in test:
    print(i)
test = (1,2,3)
for i in test:
    print(i)
print('-'*50)

a=[(1,2),(3,4),(5,6)]
for i in a:
    print(i)
for (first,last) in a:
    print(first+last)
print('-'*50)

marks = [55,66,77,44,33,99]
pass_cnt=0
fail_cnt=0
for m in marks:
    if m>=60:
        r='합격'
        pass_cnt=pass_cnt+1
    else:
        r='불합격'
        fail_cnt=fail_cnt+1
    print(f'{m}점은 {r}')
print(f'총 인원수:{pass_cnt + fail_cnt}명')
print(f'합격자수: {pass_cnt}명')
print(f'불합격자수: {fail_cnt}명')
print('-'*50)

#range(시작,끝)
a=range(10)
print(a)
b=range(1,11)
print(b)

for i in a:
    print(i, end='')
for i in b:
    print(i, end='')
print()
#for문을 이용한 구구단
dan = 5
for i in range(1,10):
    r = dan*i
    print(f'{dan} * {i} = {dan * i}')
print('-'*50)

a=[1,2,3,4]
result=[]
print('원본배열=>',a)
for m in a:
    result.append(m*3)
print(result)

result=[m*3 for m in a if m%2==0]
print(result)

#제어문 응용
# 1) 키보드를 사용하여 국,영,수 점수를 입력받아 총점과 평균을 구하고 평균이 60점 이상인 경우
#    합격 아니면 불합격을 성적들과 같이 출력하시오.
kor = int(input("국어점수를 입력하세요: "))
eng = int(input("영어점수를 입력하세요: "))
mat = int(input("수학점수를 입력하세요: "))

sum = kor+eng+mat
avg = sum/3

print("총 점: ",sum)
print("평 균: ",avg)

if avg>=60:
    print("합격")
else:
    print("불합격")


# 2) 두 수 x,y를 입력받아 x~y까지의 합계를 구하여 출력하시오
x = int(input("x: "))
y = int(input("y: "))
hap = 0
for i in range(x,y+1):
    hap = hap + i

print("x부터 y까지 합계: ",hap)

# 3) score변수에 임의의 성적 10개가 저장되어 있다. 이들 중 60점 이상의 성적과
#    몇명인지 출력하시오

score=[23,77,96,35,100,88,76,50,80,90]
pass_cnt=0
for m in score:
    if m>=60:
        pass_cnt=pass_cnt+1
        print(f'합격점수: {m}점')
print(f'합격자수: {pass_cnt}명')
print('-'*50)

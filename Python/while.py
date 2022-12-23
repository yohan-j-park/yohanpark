#while
treeHit=0
while treeHit<10:
    treeHit = treeHit+1
    print('나무를 %d번 찍었습니다.'%treeHit)

    if treeHit==10:
        print('나무가 넘어갑니다')
print('-'*50)

#while문을 사용한 구구단
print('단을 입력하세요',end='')
dan = int(input())
i = 1
while i<10:
    r=dan*i
    print('%d * %d = %d' %(dan,i,r))
    # print(f'{dan} * {i} = {r}')
    # print('{0} * {1} = {2}'.format(dan,i,r))          
    i=i+1



    


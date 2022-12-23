#while 2
coffee=10
while True:
    money=int(input("돈을 넣어주세요: "))
    if money == 300:
        print("커피를 줍니다")
        coffee = coffee-1
    elif money >300:
        print("거스름돈 %d원과 커피를 줍니다"%(money-300))
        coffee = coffee-1
    else:
        print('금액이 부족합니다')

    print('coffee는 %d잔 남았습니다.'%coffee)
    if coffee==0:
        print('재고소진')
        break;

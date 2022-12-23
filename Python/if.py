#if
money=5000
card=False

if money>=3000 or card:
    print("택시를 타고 가라")
else:
    print("걸어가라")
print("-"*50)

pocket = ['paper','cellphone','money']
if 'money' in pocket:
    print('택시를 타고 가라')
else:
    print('걸어가라')
print("-"*50)

pocket = ['paper','cellphone']
card=False
if 'money' in pocket:
    print('현금으로 택시를 타고가라')
elif card:
    print('카드로 택시를 타고가라')
else:
    print('걸어가라')
print("-"*50)




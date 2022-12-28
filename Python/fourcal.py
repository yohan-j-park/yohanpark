#class

class FourCal:
    def __init__(self,first,second):
        self.first = first
        self.second = second

        
    def setdata(self,first,second):     #메소드를 만들 때 첫번째 인수값으로 self를 무조건 넣어야함
        self.first = first
        self.second = second

    def add(self):
        result = self.first + self.second
        return result
    def mul(self):
        result = self.first * self.second
        return result
    def sub(self):
        result = self.first - self.second
        return result
    def div(self):
        result = self.first / self.second 
        return result

    #생성자를 만들면 객체 생성시 매개변수를 넣어주어야 오류가 뜨지 않는다

a=FourCal(1123123123,212342314124234)
a.setdata(10,20)
print(a.first)
print(a.second)

b=FourCal(12354353543534525,524534532542543345)
b.setdata(50,60)
print(b.first)
print(b.second)
print(b. add())
print(b. mul())
print(b. sub())
print(b. div())

#inheri
class SafeFourCal(FourCal): #클래스 상속
    def div(self):  #메소드 오버라이딩
        if self.second==0:
            return 0
        else: self.first / self.second
    
a=SafeFourCal(4,0)
print('SafeFourCal.div(4,0) => ',a.div())

a.setdata(4,2)
print(a.div())




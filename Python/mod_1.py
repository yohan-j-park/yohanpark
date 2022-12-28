#file name: mod_1.py

def add():
    print('add()...')

#단독 실행시에는 실행되고 import된 경우엔 실행되지 않도록 조치

if __name__ == '__main__':
    print('hi...')
print(__name__)

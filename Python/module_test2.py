# c:/python_exam/module_test2.py

#다른 경로의 모듈 가져오기

import sys  #표준 라이브러리
sys.path.append('c:/mymod')

import member
member.select()

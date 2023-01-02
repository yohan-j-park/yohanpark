h = 'localhost'
u = 'hong'
p = '1111'
dbName = 'mydb'

import pymysql
conn = pymysql.connect(host=h, user=u, password=p, db=dbName, charset = 'utf8')

#insert | update | delete
'''
sql = 'insert ... values(?,?)
cursor = conn.cursor()
cnt = cursor.execute(sql,(param1,param2) )
if cnt>0:
    conn.commit()
else:
    conn.rollback()
'''

#select    
'''
[cursor 생성방법]
1) cur = conn.cursor() : 컬럼명 사용 X, 숫자로만 표시
2) cur = conn.cursor(pymysql.cursor.DictCursor) : 컬럼명 사용 O

[cursor에 있는 값을 가져오는 방법]
1) fetchall(): 커서에 있는 모든 데이터를 가져온다.
2) fetchone(): 커서에 있는 값을 하나씩 가져온다.
3) fetchmany(n): 커서에 있는 값을 n개씩 가져온다.

cursor.rowcount : 커서에 있는 데이터 함수
sql = 'select ... where name=?' or 'select ... where name=%s'
cur = conn.cursor(pymysql.cursor.DictCursor)
cur.execute(sql, ('hong') )
res = cur.fetchall() : resultset
for d in res:
    print(d['sno']) : sno컬럼
cur.close()

------------------------------------
cur - conn.cursor()
cur.execute(sql, ('hong') )
for d in range(cur.rowcount):
    sno,subject = cur.fetchone()
    print(sno, subject)
conn.close()

'''


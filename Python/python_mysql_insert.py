#pymysql insert
import pymysql
h = 'localhost'
dbName = 'mydb'
u = 'hong'
p = '1111'
conn = pymysql.connect(host=h, db=dbName, user=u, password=p, charset='utf8')
cur = conn.cursor(pymysql.cursors.DictCursor)
sql = "insert into board(sno, grp, seq, deep, id, subject) values(getSerial('i'),getSerial(''),0, 0, %s, %s)"
cnt = cur.execute(sql, ('kim','pymysql로 작성한 제목') )
if cnt>0:
    conn.commit()
    print('insert success')
else:
    conn.rollback()
    print('insert fail')
conn.close()

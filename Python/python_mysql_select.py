#pymysql

#mydb에 있는 게시판을 select
import pymysql
h ='localhost'
dbName = 'mydb'
u = 'hong'
p = '1111'
conn = pymysql.connect(host=h, db=dbName, user=u, password=p, charset='utf8')
cur = conn.cursor(pymysql.cursors.DictCursor)
sql = "select * from board where subject like %s"
cur.execute(sql, ('%1%') )
res = cur.fetchall()
for d in res:
    print(d['sno'])
conn.close()


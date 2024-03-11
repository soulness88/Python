import sqlite3

#open a database connection
connection = sqlite3.connect('chinook.db')

#cursors allows to interact with the database
cursor = connection.cursor()

result_set = cursor.execute('SELECT * FROM Track')
for row in result_set:
    print(row)

#must be a tuple
favorite_artist = ('Miles Davis',)
result_set = cursor.execute('SELECT * FROM Track WHERE Composer=?', favorite_artist)
#Dont use python formta function or % because of sql injections attacks

print(result_set.fetchone())
print(result_set.fetchone())

#close the cursor
cursor.close()
#close database connection
connection.close()
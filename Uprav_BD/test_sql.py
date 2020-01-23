import psycopg2
import config

def main(request_SQL):
    desc = []
    conn = psycopg2.connect(dbname=config.MYSQL_DATABASE_DB, user=config.MYSQL_DATABASE_USER, 
                            password=config.MYSQL_DATABASE_PASSWORD, host=config.MYSQL_DATABASE_HOST)
    
    cursor = conn.cursor()
    try:
        cursor.execute(request_SQL)
        request_rows = cursor.fetchall()
        for init in cursor.description:
            desc.append(init.name)
        cursor.close()
    except BaseException:
        desc = request_rows = []

    return [request_rows, desc]

if __name__ == "__main__":
    req = 'SELECT * From "Users"'
    main(req)
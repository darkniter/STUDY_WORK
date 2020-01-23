import psycopg2
from pril import app
from timeit import default_timer as timer
import redis
import json
import datetime
import hashlib
from functools import lru_cache
import pril.config as config

redis_connect = redis.StrictRedis(**(app.config.get_namespace('REDIS_')))

@lru_cache()
def hashing(user, password):
    s = ':'.join([user, password])
    hash_string = hashlib.sha1(s.encode()).hexdigest()
    return hash_string


def redis_data_output(hashing_string):
    request_rows = []
    redis_array = []
    # try:
    #     redis_string_json = redis_connect.get(hashing_string)
    #     redis_connect.pttl(hashing_string)

    #     if redis_string_json:
    #         redis_array = json.loads(redis_string_json)


    #     if len(redis_array) > 0:
    #         request_rows = redis_array
    #         return request_rows
    # except BaseException:
    #     print('error')
    redis_string_json = redis_connect.get(hashing_string)
    redis_connect.pttl(hashing_string)

    if redis_string_json:
        redis_array = json.loads(redis_string_json)


    if len(redis_array) > 0:
        request_rows = redis_array
        return request_rows
    return False

def redis_data_input(user, password, hashing_string, db_user, db_key):
    redis_record = [db_user, db_key]

    next_day = (
        datetime.datetime.today() +
        datetime.timedelta(days=1)).replace(
            hour=app.config.get('EXPIRE_HOUR'),
            minute=app.config.get('EXPIRE_MINUTE'),
            second=0,
            microsecond=0
            )
    
    redis_connect.set(
        hashing_string,
        json.dumps(redis_record),
        ex=(next_day-datetime.datetime.now()).seconds
        )

    print('Redis base update'+ ":".join([user, password, db_user, db_key]))
    return True


def addUser(user, password, db_user, db_key):
    hashing_string = hashing(user, password)
    redis_data_input(user, password, hashing_string, db_user, db_key)
    return True


def getUser(user, password):
    hashing_string = hashing(user, password)
    db_user = redis_data_output(hashing_string)
    if db_user:
        return True
    return False


def request_SQL(user, password, request_SQL):
    print(request_SQL)
    desc = request_rows = []
    start = timer()
    hashing_string = hashing(user, password)
    user = redis_data_output(hashing_string)
    if user:
        conn = psycopg2.connect(dbname=app.config.get('DB'), user=user[0], 
                            password=user[1], host=app.config.get('HOST'))
        
        cursor = conn.cursor()
        try:
            cursor.execute(request_SQL)
            request_rows = cursor.fetchall()
            for init in cursor.description:
                desc.append(init.name)
            cursor.close()
        except BaseException:
            desc = request_rows = []

        # return [request_rows, desc]
        stop = timer() - start
        stop = float("{0:.4f}".format(stop))
    return request_rows, desc, user


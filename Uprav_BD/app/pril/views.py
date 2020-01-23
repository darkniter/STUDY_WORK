from pril import app, SQLbase
from flask import request, jsonify
import json
import pril.config as config
from flask_cors import cross_origin
import requests


@app.route('/', methods=['GET', 'POST'])
def reply():

    SQL_request = request.args.get('staff')
    user = request.args.get('user')
    pass_word = request.args.get('pass')

    if SQL_request:
        return jsonify(SQLbase.request_SQL(user, pass_word, SQL_request))
    else:
        return jsonify({'access_restriction' : 'SQL REQUEST FAILED'})


@app.route('/getUser', methods=['GET'])
def getDB_USER():
    user = request.args.get('user')
    pass_word = request.args.get('pass')
    return jsonify(SQLbase.getUser(user, pass_word))

@app.route('/Registred', methods=['GET'])
def addDB_USER():
    user = request.args.get('user')
    pass_word = request.args.get('pass')
    db_auth = request.args.get('auth')

    if db_auth:
        db_user,db_key = (app.config['SQL_DATABASE_AUTH'][db_auth])
        print(db_user,db_key)
        return jsonify(SQLbase.addUser(user, pass_word, db_user, db_key))
    else:
        return jsonify({'access_restriction' : 'USER NOT IN DB'})


@app.route('/ping', methods=['GET'])
@cross_origin()
def ping_pong():
    return jsonify('Flask bitches!')


# @app.route('/guestUser/', methods=['GET'])
# @cross_origin()
# def GetGuest():
#     return jsonify({'token': config.TOKENUSER, 'url': config.NETBOX_URL, })


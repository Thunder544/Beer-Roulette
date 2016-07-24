from bottle import *
import random as rnd
import os

HOST = 'localhost'

beers =[]
consumed =[]

@route('/')
def hello():
    return template('RouletteHome.tpl', beers = beers, consumed = consumed)

@route('/add', method="POST")
def add_beer():
    if request.forms.get('beer') == "":
        return redirect('/')
    else:
        beers.append(request.forms.get('beer'))
        return redirect('/')

@route('/static/<filepath:path>', method="GET")
def server_static(filepath):
    return static_file(filepath, root=os.path.abspath(os.path.dirname(__file__)))

@route('/pick', method="POST")
def pick_beer():
    if len(beers) != 0:
        r = rnd.randint(0,len(beers)-1)
        consumed.append(beers[r])
        beers.remove(beers[r])
        if len(beers) == 0:
            del beers[:]
            del consumed[:]
            return template('RouletteComplete.tpl')
        return redirect('/')
    return redirect('/')

@route('/remove', method="POST")
def remove_beer():
    if len(beers) != 0:
        del beers[-1]
        return redirect('/')
    else:
        return redirect('/')

run(host = HOST, port=8080, debug=True)

from bottle import *
import random as rnd

HOST = '10.150.1.26'

beers =[]
consumed =[]

@route('/')
def hello():
    return template('beerRoulette.tpl', beers = beers, consumed = consumed)

@route('/add', method="POST")
def add_beer():
    if request.forms.get('beer') == "":
        return redirect('/')
    else:
        beers.append(request.forms.get('beer'))
        return redirect('/')

@route('/static/<filepath:path>', method="GET")
def server_static(filepath):
    return static_file(filepath, root=r'D:\users\jlv0127\PycharmProjects\bottleTesting')

@route('/pick', method="POST")
def pick_beer():
    if len(beers) != 0:
        r = rnd.randint(0,len(beers)-1)
        consumed.append(beers[r])
        beers.remove(beers[r])
        if len(beers) == 0:
            del beers[:]
            del consumed[:]
            return template('complete.tpl')
        return redirect('/')
    return redirect('/')


run(host = HOST, port=8080, debug=True)

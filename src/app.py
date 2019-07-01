# -*- coding: utf-8 -*-
import tornado.ioloop
import tornado.web
from tornado.web import url
import tornado.websocket
import os
import sys
import json
from datetime import datetime
import redis
from logging import getLogger, StreamHandler, DEBUG, basicConfig, INFO, FileHandler, Formatter

log_dir = '/var/log/simple-chat'
if not os.path.exists(log_dir):
    os.mkdir(log_dir)

fh = FileHandler(log_dir + '/app.log', 'a')
fh.setLevel(DEBUG)
fh.setFormatter(Formatter("%(asctime)s: %(message)s"))

sh = StreamHandler()
sh.setLevel(DEBUG)
sh.setFormatter(Formatter("%(asctime)s: %(message)s"))

logger = getLogger(__name__)
logger.setLevel(DEBUG)
logger.addHandler(fh)
logger.addHandler(sh)

class TopHandler(tornado.web.RequestHandler):
    def get(self):
        print('Request top page')
        self.render('index.html', name='')

class InternalHandler(tornado.web.RequestHandler):
    def post(self):
        logger.info('Internal is posted message: ' + self.request.body.decode('utf-8'))
        data = json.loads(self.request.body.decode('utf-8'))
        data['content'] += ' from app1'

        for user in websocket_list:
            user.write_message(json.dumps(data))

class WebSocketHandler(tornado.websocket.WebSocketHandler):
    def check_origin(self, origin):
        #parsed_origin = urllib.parse.urlparse(origin)
        #return parsed_origin.netloc == '192.168.33.13'
        return True

    def open(self):
        logger.info('WebSocket opened')
        websocket_list.append(self)

    def on_message(self, message):
        logger.info('WebSocket received message: ' + message)
        message_dictionary = json.loads(message)
        name = message_dictionary['name']
        content = message_dictionary['content']
        now = datetime.now()
        now_str = now.strftime('%Y/%m/%d %H:%M:%S')
        data = {
            'time': now_str,
            'name': name,
            'content': content,
        }

        logger.info('Websocket published to redis: ' + json.dumps(data))
        connect.publish('simple-chat', json.dumps(data))

    def on_close(self):
        logger.info('WebSocket closed')
        websocket_list.remove(self)

if __name__ == '__main__':
    redis_host = os.environ.get('REDIS_HOST', '192.168.33.203')
    websocket_list = []
    connect = redis.StrictRedis(host=redis_host, port=6379)
    application = tornado.web.Application(
        [
            url(r'/', TopHandler, name='index'),
            url(r'/internal', InternalHandler, name='internal'),
            url(r'/ws', WebSocketHandler, name='ws'),
            url(r'/favicon.ico', tornado.web.StaticFileHandler, {'path': 'favicon.ico'}),
        ],
        template_path=os.path.join(os.path.dirname(os.path.abspath(__file__)),  'templates'),
        static_path=os.path.join(os.path.dirname(os.path.abspath(__file__)),  'static'),
    )

    server = tornado.httpserver.HTTPServer(application)
    server.listen(80)
    tornado.ioloop.IOLoop.current().start()
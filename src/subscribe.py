# -*- coding: utf-8 -*-
import redis
import json
import tornado.httpclient
import asyncio
import os
from logging import getLogger, StreamHandler, DEBUG, basicConfig, INFO, FileHandler, Formatter

log_dir = '/var/log/simple-chat'
if not os.path.exists(log_dir):
    os.mkdir(log_dir)

fh = FileHandler(log_dir + '/subscribe.log', 'a')
fh.setLevel(DEBUG)
fh.setFormatter(Formatter("%(asctime)s %(levelname)8s %(message)s"))

sh = StreamHandler()
sh.setLevel(DEBUG)
sh.setFormatter(Formatter("%(asctime)s %(levelname)8s %(message)s"))

logger = getLogger(__name__)
logger.setLevel(DEBUG)
logger.addHandler(fh)
logger.addHandler(sh)

async def post_message(message):
    app_host = os.environ.get('APP_HOST', '127.0.0.1')
    http_client = tornado.httpclient.AsyncHTTPClient()
    try:
        response = await http_client.fetch('http://' + app_host + '/internal', method='POST', body=message)
    except Exception as e:
        logger.info('Error: %s' % e)

if __name__ == '__main__':
    redis_host = os.environ.get('REDIS_HOST', '192.168.33.203')

    while(1):
        connect = redis.StrictRedis(host=redis_host, port=6379)

        pubsub = connect.pubsub()
        # subscribe開始
        pubsub.subscribe(['simple-chat'])
        for item in pubsub.listen():
            logger.info(item)
            if item['type'] != 'message':
                continue
            data = item['data'].decode('utf-8')
            logger.info(data)
            data_dict = json.loads(data)
            loop = asyncio.get_event_loop()
            loop.run_until_complete(post_message(data))
            
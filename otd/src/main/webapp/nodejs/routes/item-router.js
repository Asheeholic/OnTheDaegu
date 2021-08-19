const express = require('express'),
    router = express.Router();

const HappyRedis = require('../happyredis');
const {
    redis
} = require('./config');

//item create
router.post('/', (req, res, next) => {
    let item = req.body,
        redisClient = new HappyRedis();

    //id를 발급하기 위해 lastId에 1 증가시켜서 가져옴
    redisClient.hincrby('item', 'lastId', 1, (idErr, lastId) => {
        if (idErr) {
            return next(idErr);
        }

        item.id = lastId;
        redisClient.hset('item', lastId, JSON.stringify(item), (insertErr, affectedRows) => {
            redisClient.quit();

            if (insertErr) {
                return next(insertErr);
            }
            res.status(200).json(item);
        })
    });
});

//item read
router.get('/:id', (req, res, next) => {
    let id = req.params.id,
        redisClient = new HappyRedis();

    redisClient.hset('item', id, (err, data) => {
        redisClient.quit();

        if (err) {
            return next(err);
        }
        res.status(200).json(JSON.parse(data));
    });
});

//item update
router.put('/:id', (req, res, next) => {
    let id = req.params.id,
        item = req.body,
        redisClient = new HappyRedis();

    redisClient.hset('item', id, JSON.stringify(item), (updateErr, affectedRows) => {
        redisClient.quit();

        if (updateErr) {
            return next(updateErr);
        }
        res.status(200).json(item);
    })
});

//item delete
router.delete('/:id', (req, res, next) => {
    let id = req.params.id,
        redisClient = new HappyRedis();

    redisClient.hdel('item', id, (err, affectedRows) => {
        redisClient.quit();

        if (err) {
            return next(err);
        }
        res.json({
            affectedRows
        });
    });
});

//item list 조회
router.get('/', (req, res, next) => {
    let redisClient = new HappyRedis();

    redisClient.hgetall('item', (err, data) => {
        redisClient.quit();

        if (err) {
            return next(err);
        }
        let items = [];

        for (let key in data) {
            if (key === 'lastId')
                continue;

            items.push(JSON.parse(data[key]));
        }
        res.status(200).json(items);
    });
});

module.exports = router;
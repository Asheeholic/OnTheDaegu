const express = require('express'),
    cors = require('cors');

const itemRouter = require('./routes/item-router'),
    pgRouter = require('./routes/pg-router');
const app = express();

//cors 허용
app.use(cors({
    origin(origin, callback) {
        callback(null, true)
    },
    credentials: true
}));

//application/json 형태의ㅏ 데이터 req.body에 저장
app.use(express.json());
//www-form-urlencode  형태의 데이터 req.body에 저장
app.use(express.urlencoded({
    extended: false
}));

app.use('/items', itemRouter);

app.use('/pg', pgRouter);

//Error Handler
app.use((err, req, res, next) => {
    consloe.log('++++++++++++++++++Error!!!!!!!!!!!+++++++++++++', err.message);
    console.log(err.stack);
    res.status(err.status || 500);
    res.json({
        code: err.code,
        msg: err.message,
        status: err.status
    });
});

module.exports = app;
const request = require('supertest'),
    {
        expect
    } = require('chai');

const app = require('../app');

const data = {
    pgtype: 0, // 0 : inicis  
    pg_id: '', //pg사 고유 id
    iamport_id: '', //iamport 고유 id
    price: 500, //결제 가격
    paytype: "card", //결제 수단
    errmsg: "", //에러 메시지
    receipt_url: "", //영수증 URL
    mobile: "01012345678", //결제자 전화번호
    status: 0 //0 : 결제대기, 1 : 결제완료, 2: 결제실패, 3: 환불  
}

let lastId, item;

describe('Item Router Test', () => {
    it('POST /items', done => {
        request(app)
            .post('/items')
            .set('Content-Type', 'application/json')
            .send(data)
            .expect(200)
            .expect('Content-Type', /json/)
            .then(res => {
                lastId = res.body.id;
                expect(lastId).to.be.above(0);
                done();
            })
            .catch(err => {
                console.error("######Error >>", err);
                done(err);
            })
    });

    it('GET /items/:id', done => {
        request(app)
            .get(`/items/${lastId}`)
            .expect(200)
            .expect('Content-Type', /json/)
            .then(res => {
                //item set!
                item = res.body
                expect(item.id).to.be.equal(lastId);
                expect(item.price).to.be.equal(data.price);
                done();
            })
            .catch(err => {
                console.error("######Error >>", err);
                done(err);
            });
    });

    it('PUT /items/:id', done => {
        //item 상태 변경
        item.status = 1;
        request(app)
            .put(`/items/${item.id}`)
            .set('Content-Type', 'application/json')
            .send(item)
            .expect(200)
            .then(res => {
                item = res.body;
                expect(item.status).to.be.equal(1);
                done();
            })
            .catch(err => {
                console.error("######Error >>", err);
                done(err);
            })
    });

    it('DELETE /items/:id', done => {
        request(app)
            .delete(`/items/${item.id}`)
            .expect(200)
            .then(res => {
                let affectedRows = res.body.affectedRows;
                expect(affectedRows).to.be.equal(1);
                done();
            })
            .catch(err => {
                console.error("######Error >>", err);
                done(err);
            })
    });

    it('GET /items/:id', done => {
        request(app)
            .get(`/items/${lastId}`)
            .expect(200)
            .expect('Content-Type', /json/)
            .then(res => {
                //item set!
                item = res.body
                expect(item).to.be.equal(null);
                done();
            })
            .catch(err => {
                console.error("######Error >>", err);
                done(err);
            });
    });
});
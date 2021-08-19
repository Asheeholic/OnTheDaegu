var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var historySchema = new Schema({
  merchant_uid: "merchant_1629334275584", // 주문번호(결제정보 조회시 사용)
  amount: 1000, // 결제 금액(환불 가능 금액 계산시 사용)
  cancel_amount: 1000 // 환불 된 총 금액(환불 가능 금액 계산시 사용)
});

module.exports = mongoose.model('history', historySchema);

var history = require('history');
const {
  default: axios
} = require('axios');

// const express = require('express'),
//         axios = require('axios'),
//         router = express.Router();
// const HappyRedis = require('happyredis');
// const config = require('config');

app.post('/history/cancel', async (req, res, next) => {
  try {
    // const key = req.params.key,
    //   merchantInfo = req.body[key];
    // //토큰발급
    // const accessToken = await _getIamportToken();

    // const refundRet = awiat axios({

    // 인증 토큰 발급 받기
    axios({
      url: "https://api.iamport.kr/users/getToken",
      method: "post", // POST method
      headers: {
        "Content-Type": "application/json"
      }, // "Content-Type": "application/json"
      data: {
        imp_key: "3651333049760723", // REST API키
        imp_secret: "deb5311b6f193c16f2e04e3f61037d0b12084b0ed326c1f160d41ee8f56e37dd5f09501441fdf076" // REST API Secret
      }
    });

    const {
      body
    } = req;
    const {
      merchant_uid,
      amount,
      cancel_amount
    } = body; // 클라이언트로부터 전달받은 주문번호
    Payments.find({
      merchant_uid
    }, async function (err, payment) {
      if (err) {
        return res.json(err);
      }
      const paymentData = payment[0]; // 조회된 결제정보

      //환불요청

      const {
        merchant_uid,
        amount,
        cancel_amount
      } = paymentData; // 조회한 결제정보로부터 imp_uid, amount(결제금액), cancel_amount(환불된 총 금액) 추출
      const cancelableAmount = amount - cancel_amount; // 환불 가능 금액(= 결제금액 - 환불 된 총 금액) 

      const getCancelData = await axios({
        url: "{환불요청을 받을 서비스 URL}", // 예: http://www.myservice.com/payments/cancel
        method: "post",
        headers: {
          "Cotent-Type": "application/json",
          "Authorization": accessToken
        }, // 아임포트 서버로부터 발급받은 엑세스 토큰
        data: {
          merchant_uid: merchantInfo.iamport_id, // imp_uid를 환불 `unique key`로 입력
        }
      });

      const {
        response
      } = getCancelData; //환불결과

      const {
        merchant_uid
      } = response;
      Payments.findOneAndUpdate({
        merchant_uid
      }, response, {
        new: true
      }, function (err, payment) { // 주문정보가 일치하는 결제정보를 추출해 동기화
        if (err) {
          return res.json(err);
        }
        res.json(payment); // 가맹점 클라이언트로 환불 결과 반환
      });
    });
  } catch (error) {
    res.status(400).send(error);
  }
});

//   const isSuccess = !!refundRet.data.response;

//     if (isSuccess) {
//       //환불완료
//       merchantInfo.status = 3;
//     } else {
//       //환불실패
//       merchantInfo.errmsg = refundRet.data.message;
//     }

//     //가맹점 WAS 상품데이터 변경
//     const redisClient = new HappyRedis();

//     redisClient.hset(key, merchantInfo.id, JSON.stringify(merchantInfo), (updateErr, affectedRows) => {
//       if (updateErr) {
//         return next(updateErr);
//       }
//       if (isSuccess) {
//         res.status(200).send(merchantInfo);
//       } else {
//         next(new Error(merchantInfo.errmsg));
//       }
//     });
//   }
//   catch (err) {
//     if (err.response) {
//       err = new Error(erro.response.data.message);
//     }
//     next(err);
//   }
// });

async function _getIamportToken() {
  const impInfo = config.iamport,
    tokenParam = {
      imp_key: impInfo.apiKey,
      imp_secret: impInfo.apiSecret
    };

  //accessToken 가져오기
  const tokenRes = await axios.post('https://api.iamport.kr/users/getToken', tokenParam),
    accessToken = tokenRes.data.response.access_token;

  if (!accessToken) {
    throw new Error("AccessToken is not exist");
  }

  return accessToken;
}
package co.yedam.otd.payment.API;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class RefundTicket {
	public String refundTicket() {
		HttpURLConnection conn = null;
		String refund = "";
		String token ="5be8825d48fcef04bee2a3c77e5625816ff24ac4";
		//추가
//		ShowToken showToken = new ShowToken();
//		String token = showToken.showToken();
		try {
			URL url = new URL("https://api.iamport.kr/payments/cancel");
			conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", token);
			conn.setDoOutput(true);

			JsonObject obj = new JsonObject();

			String merchant_uid = "merchant_1629426644740";
			double amount = 2000;
			
			obj.add("merchant_uid", new Gson().toJsonTree(merchant_uid));
			obj.add("amount", new Gson().toJsonTree(amount));
			obj.add("access_token", new Gson().toJsonTree(token));
			
			BufferedWriter bw;
			bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj.toString());
			bw.flush();
			bw.close();

			int result = 0;
			int responseCode = conn.getResponseCode();
			System.out.println("응답코드 : " + responseCode);

			if (responseCode == 200) { // 정상 호출
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = null;
				while ((line = br.readLine()) != null) {
					sb.append(line + "\n");
				}
				br.close();
				System.out.println("환불 요청" + "" + sb.toString());
				result = 1;
			} else { // 에러 발생
				System.out.println(conn.getResponseMessage());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return refund;
	}
}

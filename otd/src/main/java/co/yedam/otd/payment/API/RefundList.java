package co.yedam.otd.payment.API;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
	
public class RefundList {
	public String refundList() {
		HttpURLConnection conn = null;
		ShowToken showToken = new ShowToken();
		String token = showToken.showToken();
		System.out.println(token);
//		List<RefundList> refundList = new ArrayList<>();

		//추가
//		ShowToken showToken = new ShowToken();
//		String token = showToken.showToken();
		try {
			URL url = new URL("https://api.iamport.kr/payments/status/paid");
			conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", token);
			conn.setDoOutput(true);

			JsonObject obj = new JsonObject();

//			String merchant_uid = "merchant_1629557234781";
//			double amount = 1000;
			
//			obj.add("merchant_uid", new Gson().toJsonTree(merchant_uid));
//			obj.add("amount", new Gson().toJsonTree(amount));
			//obj.add("payment_status", new Gson().toJsonTree(status));
			//obj.add("access_token", new Gson().toJsonTree(token));
			
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
				System.out.println("결제리스트 : " + "" + sb.toString());
				try {
					
					String tk = sb.toString();
					JsonParser jsonParser = new JsonParser();
					JsonElement element;
					element = (JsonElement) jsonParser.parse(tk);
					String amount = element.getAsJsonObject().getAsJsonObject("response").getAsJsonObject("list").getAsJsonArray("merchant_uid").getAsString();
//					String merchant_uid = element.getAsJsonObject().getAsJsonObject("response").getAsJsonArray("list").get(Integer.valueOf("merchant_uid")).getAsString();
					System.out.println("가격 : " + amount);
//					System.out.println("결제번호 : " + merchant_uid);
					//access_token = code;
				} catch (Exception e) {
					e.printStackTrace();
				}
				result = 1;
			} else { // 에러 발생
				System.out.println(conn.getResponseMessage());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	}


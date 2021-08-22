package co.yedam.otd.payment.API;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
	
public class RefundList {
	public List<String[]> refundList() {
		HttpURLConnection conn = null;
		ShowToken showToken = new ShowToken();
		String token = showToken.showToken();
		List<String[]> list = new ArrayList<String[]>();
		
		//System.out.println(token);
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
			//System.out.println("응답코드 : " + responseCode);

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
					JsonParser parser = new JsonParser();
				
					JsonObject jsonObj = (JsonObject) parser.parse(tk);
					JsonObject getObj = (JsonObject) jsonObj.get("response");
					JsonArray array = (JsonArray) getObj.get("list");
					
					JsonArray amount = (JsonArray) array.getAsJsonArray();
					for(int i=0; i<amount.size(); i++) {
						JsonObject amount2 = (JsonObject) amount.get(i);
						
						//amoount2값이 + 로 더해지지 않음으로 String으로 변환추출
						String price = amount2.get("amount").getAsString();
						String paynum = amount2.get("merchant_uid").getAsString();
						
						//유닉스timestamp를 sysdate값으로 변환
						String dateTime = (String) amount2.get("started_at").getAsString();
						long timestamp = Long.parseLong(dateTime);
						Date date = new java.util.Date(timestamp*1000L);
						SimpleDateFormat dfg = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						dfg.setTimeZone(java.util.TimeZone.getTimeZone("GMT+9"));
						String dataStr = dfg.format(date);
//				        System.out.println(dataStr);
						
//						System.out.println("가격 : " + amount2.get("amount"));
//						System.out.println("결제번호 : " + amount2.get("merchant_uid"));
//						System.out.println("결제날짜 : " + dataStr);
						
						String[] arr = new String[3];
						
						arr[0] = price;
						arr[1] = paynum;
						arr[2] = dataStr;
						
						list.add(arr);
						
					}
//					System.out.println("list1 of price : " + list.get(0)[0]);
//					System.out.println("list1 of paynum : " + list.get(0)[1]);
//					System.out.println("list1 of dataStr : " + list.get(0)[2]);
					//String amount = element.getAsJsonObject().getAsJsonObject("response").getAsJsonArray("list").getAsString();
//					String merchant_uid = element.getAsJsonObject().getAsJsonObject("response").getAsJsonArray("list").get(Integer.valueOf("merchant_uid")).getAsString();
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
		return list;
	}

	}


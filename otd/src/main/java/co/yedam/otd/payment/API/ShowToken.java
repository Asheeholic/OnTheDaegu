package co.yedam.otd.payment.API;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class ShowToken {
	public String showToken() {
		HttpURLConnection conn = null;
		String access_token ="";
		
		try {
			URL url = new URL("https://api.iamport.kr/users/getToken");
			conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setDoOutput(true);

			JsonObject obj = new JsonObject();

			String imp_key = "3651333049760723";
			String imp_secret = "deb5311b6f193c16f2e04e3f61037d0b12084b0ed326c1f160d41ee8f56e37dd5f09501441fdf076";

			obj.add("imp_key", new Gson().toJsonTree(imp_key));
			obj.add("imp_secret", new Gson().toJsonTree(imp_secret));

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
				//System.out.println("토큰 발급 : " + "" + sb.toString());
				try {
				
					String tk = sb.toString();
					JsonParser jsonParser = new JsonParser();
					JsonElement element;
					element = (JsonElement) jsonParser.parse(tk);
					String code = element.getAsJsonObject().getAsJsonObject("response").get("access_token").getAsString();
					//System.out.println(code);
					access_token = code;
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
		return access_token;
	}

//	public String useToken(String token) {
//		HttpURLConnection conn = null;
//		String access_token ="";
//		
//		try {
//			URL url = new URL("https://api.iamport.kr/users/getToken");
//			conn = (HttpURLConnection) url.openConnection();
//
//			conn.setRequestMethod("POST");
//			conn.setRequestProperty("Content-Type", "application/json");
//			conn.setRequestProperty("Accept", "application/json");
//			conn.setRequestProperty("Authorization", token);
//			conn.setDoOutput(true);
//
//			JsonObject obj = new JsonObject();
//
//			String imp_key = "3651333049760723";
//			String imp_secret = "deb5311b6f193c16f2e04e3f61037d0b12084b0ed326c1f160d41ee8f56e37dd5f09501441fdf076";
//
//			obj.add("imp_key", new Gson().toJsonTree(imp_key));
//			obj.add("imp_secret", new Gson().toJsonTree(imp_secret));
//
//			BufferedWriter bw;
//			bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//			bw.write(obj.toString());
//			bw.flush();
//			bw.close();
//
//			int result = 0;
//			int responseCode = conn.getResponseCode();
//			System.out.println("응답코드 : " + responseCode);
//
//			if (responseCode == 200) { // 정상 호출
//				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//				StringBuilder sb = new StringBuilder();
//				String line = null;
//				while ((line = br.readLine()) != null) {
//					sb.append(line + "\n");
//				}
//				br.close();
//				System.out.println("" + sb.toString());
//				result = 1;
//			} else { // 에러 발생
//				System.out.println(conn.getResponseMessage());
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return access_token.toString();
//	}
	
}
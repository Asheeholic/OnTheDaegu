package co.yedam.otd.payment.API;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ShowToken {
	HttpURLConnection con = null;
	StringBuilder sb;
	String access_token = null;

	public String showToken() {

		try {
			String apiURL = "https://api.iamport.kr/users/getToken";
			URL url = new URL(apiURL);
			con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("post");
			con.setRequestProperty("Content-Type", "application/json");

			String postParams = "imp_key=3651333049760723&imp_secret=deb5311b6f193c16f2e04e3f61037d0b12084b0ed326c1f160d41ee8f56e37dd5f09501441fdf076";
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				System.out.println(responseCode);
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				System.out.println(responseCode);
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			sb = new StringBuilder();
			String line = "";
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sb.toString();
	}
}

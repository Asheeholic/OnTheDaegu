package co.yedam.otd.rental.API;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class FindLoadAPI {
	
	HttpURLConnection con = null;
	StringBuilder sb;
	
	public String showJson(String nowLat, String nowLng, String goalLat, String goalLug) {
		
		String clientId = "wre5st6fx0";
		String clientSecret= "QwJXDSdc3x8i01bhv5uniivRrxHIoEhsk5OGFY9q";
		
		try {
			
			String apiURL = "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving" +
					"?start=" + nowLng + "," + nowLat + "&goal=" + goalLug + "," + goalLat + "&option=trafast";;
			System.out.println(apiURL);
			URL url = new URL(apiURL);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode == 200) { // 정상 호출
				System.out.println(responseCode);
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                
            } else {  // 에러 발생
            	System.out.println(responseCode);
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                
            }
			
			sb = new StringBuilder();
            String line = "";
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            
            System.out.println(sb.toString());

			br.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sb.toString();
	}

	
	
}

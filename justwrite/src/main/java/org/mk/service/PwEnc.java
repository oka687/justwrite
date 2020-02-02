package org.mk.service;

import java.security.MessageDigest;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PwEnc {
	
   
    
	public String enc(String pwcode) {
	
		String base = pwcode;
		System.out.println(base+"base입니다");
		try{

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(base.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}

			//출력
			//System.out.println(hexString.toString());
			String hex = hexString.toString();
			return hex;
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}

	}
	
}

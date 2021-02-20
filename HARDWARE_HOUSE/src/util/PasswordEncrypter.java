package util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncrypter {

	public static String encryptor(String toEncrypt) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			String saltString = "HARDWARE_HOUSE";
			byte[] salt = saltString.getBytes();
			md.update(salt);
			
			byte[] hashedPassword = md.digest(toEncrypt.getBytes(StandardCharsets.UTF_8));
			
			StringBuilder sb = new StringBuilder();
			
			for(byte b : hashedPassword) {
				sb.append(String.format("%02x", b));
			}
			
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {}
		
		return null;
	}
}
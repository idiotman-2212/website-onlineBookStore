package ptithcm.helper;

import java.security.SecureRandom;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.mindrot.jbcrypt.BCrypt;

public class Helper {
	public static String randomString() {
		String ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_";
		SecureRandom RANDOM = new SecureRandom();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 32; ++i)
			sb.append(ALPHABET.charAt(RANDOM.nextInt(ALPHABET.length())));
		return sb.toString();
	}

	public static long randomLong() {
		String ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_";
		SecureRandom RANDOM = new SecureRandom();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 32; ++i)
			sb.append(ALPHABET.charAt(RANDOM.nextInt(ALPHABET.length())));
		return Long.parseLong(sb.toString());
	}

	public static String randomPassword() {
		String ALPHABET = "0123456789";
		SecureRandom RANDOM = new SecureRandom();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 6; ++i)
			sb.append(ALPHABET.charAt(RANDOM.nextInt(ALPHABET.length())));
		return sb.toString();
	}
	
	public static String bCrypt(String password) {
		String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));
		return hash;
	}
	
	public static boolean encryptionBCrypt(String password, String getPass) {
		return BCrypt.checkpw(password, getPass);
	}
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
			Pattern.CASE_INSENSITIVE);
	
	public static boolean checkEmail(String emailStr) {
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
		return matcher.find();
	}
	
	/*
	 * public static boolean checkEmail(String email) { String emailRegex =
	 * "^[a-zA-Z0-9_+&*-]+(?:\\." + "[a-zA-Z0-9_+&*-]+)*@" +
	 * "(?:[a-zA-Z0-9-]+\\.)+[a-z" + "A-Z]{2,7}$";
	 * 
	 * Pattern pat = Pattern.compile(emailRegex); if (email == null) return
	 * false; return pat.matcher(email).matches(); }
	 */

	public static boolean checkPassword(String password) {
		String passRegex = "^(?=.*[a-z])(?!.* )(?=.*[0-9]).{6,}$";

		Pattern pat = Pattern.compile(passRegex);
		if (password == null || password.length() < 6)
			return false;
		return pat.matcher(password).matches();
	}
	
	public static boolean isValidPhone(String s) {
		Pattern p = Pattern.compile("(09|01|02|03|04|05|06|07|08)+([0-9]{7,11})\\b");
		System.out.println("check: " + p.matcher(s).matches());
		if (s == null)
			return false;
		return p.matcher(s).matches();
	}
	
}

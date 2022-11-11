package com.caliber.Authentication.service;

import java.security.SecureRandom;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.caliber.Authentication.model.User;
import com.caliber.Authentication.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	public UserRepository userRepository;

	@Autowired
	public JavaMailSender javaMailSender;

	public Integer validateUsername(String username) {
		User user = userRepository.findByUsername(username);
		int passwordLength = 0;
		if (user == null) {
			return passwordLength;
		}
//		else if(user.getStatus()==1) {
//			return -2;
//		}
		else {
			passwordLength = user.getPassword().length();
			return passwordLength;
		}
	}

	public void sendEmail(String username) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(userRepository.findByUsername(username).getEmailId());
		message.setSubject("Revivify - Temporary Password");
		String randomPass = generateRandomString();
		String text=generateRandomString() +
				" \nUse above password to login.\n"+ 
				" Revivify to rescue your account. You need to enter this password only once as in case of one more failed attempt your account will be permanently blocked."; 
		message.setText(text);
		User user = userRepository.findByUsername(username);
		user.setPassword(randomPass);
//		int count = userRepository.findByUsername(username).getCounter();
//		 user.setCounter(count+1);
		userRepository.save(user);
		javaMailSender.send(message);
	}

	public boolean setCounter(String username, int counter) {
		User user = userRepository.findByUsername(username);
		if (user != null) {
			user.setCounter(counter);
			userRepository.save(user);
			return true;
		}
		return false;
	}

	public int returnCounter(String username) {
		int count = -1;
		User user = userRepository.findByUsername(username);

		if (user != null) {
			count = user.getCounter();
		}

		return count;

	}

	public boolean checkpassword(String userName, String token) {
		String password = token;
		String pin = userRepository.findByUsername(userName).getPassword();
		pin = pin.toLowerCase();
		password = password.toLowerCase();
		char chunk[] = password.toCharArray();
		int counter = 0;
		char temp[] = pin.toCharArray();
		int length = password.length();
		int k = 0;
		for (int i = 0; i < length; i = i + pin.length()) { /// n
			for (int j = i; j < (i + pin.length()); j++) { /// 4
				if (chunk[j] == temp[k]) {
					counter++;
					k++;
					break;
				}
			}
		}
		if (counter == 4) {
			return true;
		} else
			return false;
	}

	public boolean getPassword(String username, String password) {
		User user = userRepository.findByUsername(username);
		if ((user.getUsername()).equals(username)) {
			String pass = user.getPassword();
			if (password.equalsIgnoreCase(pass)) {
				return true;
			} else {
				return false;
			}
		} else
			return false;
	}

	public void setPassword(String username, String newpass) {
		User user = userRepository.findByUsername(username);
		user.setPassword(newpass);
		user.setCounter(0);
		userRepository.save(user);
	}

	public boolean checkOTP(String username, String otp) {
		try {
			User user = userRepository.findByUsername(username);
			System.out.println(user.getUsername() + " " + user.getOtp());
			String otpdb = user.getOtp();
			if (otpdb.equals(otp)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public String generateOTP() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		// this will convert any number sequence into 6 character.
		return String.format("%06d", number);
	}

	public void sendOtp(String username) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(userRepository.findByUsername(username).getEmailId());
		message.setSubject("OTP");
		String randomOTP = generateOTP();
		String text= "OTP - "+randomOTP;
		message.setText(text);
		User user = userRepository.findByUsername(username);
		user.setOtp(randomOTP);
		// int count = userRepository.findByUsername(username).getCounter();
		// user.setCounter(count+1);
		userRepository.save(user);
		javaMailSender.send(message);

	}

	public boolean savetoDB(String username, String password, String emailid, ModelMap model) {

		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setCounter(0);
		user.setEmailId(emailid);
		user.setOtp("000000");
		if (user.getPassword().length() == 4) {
			if (userRepository.findByUsername(user.getUsername()) == null) {
				userRepository.save(user);
				return true;
			} else {
				model.put("errormsg", "User already exists");
				return false;
			}

		} else {
			model.put("errormsg", "Password length must be 4 alpha-numeric characters");
			return false;
		}

	}

	public int countdown(String username) {
		int count = 0;

		count = userRepository.findByUsername(username).getCounter();
		User user = userRepository.findByUsername(username);
		user.setCounter(count + 1);
		userRepository.save(user);
		count = userRepository.findByUsername(username).getCounter();

		return count;
	}

	public String generateRandomString() {
		int length = 4;
		String charLower = "abcdefghijklmnopqrstuvwxyz";
		String charUpper = charLower.toUpperCase();
		String specialChar = "!@#$%^&*()";
		String number = "0123456789";
		String dataForRandomString = charUpper + charLower + number + specialChar;
		SecureRandom random = new SecureRandom();
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			int rndCharAt = random.nextInt(dataForRandomString.length());
			char rndChar = dataForRandomString.charAt(rndCharAt);
			sb.append(rndChar);
		}
		return sb.toString();
	}

	public void accountblocked(String username) {
		User user = userRepository.findByUsername(username);
//		user.setStatus(1);
		userRepository.save(user);
	}

}

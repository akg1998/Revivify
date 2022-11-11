package com.caliber.Authentication.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.caliber.Authentication.service.UserService;

@Controller
public class AuthenticationController {

	@Autowired
	public UserService userService;

	@GetMapping(value = "/register")
	public String register() {
		return "register";
	}

	@PostMapping(value = "/register")
	public String registrationPage(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "emailid", required = false) String emailid, ModelMap model, RedirectAttributes redirectAttribute) {

		System.out.println(username + " " + password);
		boolean status = userService.savetoDB(username, password, emailid, model);
		if (status) {
			String error = "Your account has been created succesfully, Try logging with your new Account.";
			redirectAttribute.addFlashAttribute("success", error);
			return "redirect:login";
		} else {
			return "register";
		}
	}

	@GetMapping(value = "/login")
	public String loginPage() {
		return "login";
	}

	@PostMapping(value = "/validateUserName")
	public @ResponseBody Integer loginPageVerification(@RequestBody String user) {
		System.out.println(user);
		int inputToken = userService.validateUsername(user);
		int counter = userService.returnCounter(user);

		if (counter == 5) {
			// User is Permanently Blocked
			return 403;
		} else if (inputToken == 0) {
			// User Does not exist in Database
			return 404;
		} else if (inputToken >= 4) {
			// User Exist Proceed to enter password
			return 200;
		} else {
			// Unecessary error occoured
			return -1;
		}
	}

	@PostMapping(value = "/reset")
	public String resetPageVerification(
			@RequestParam(value = "hiddenUserName", required = false) String username,
			@RequestParam(value = "otp", required = false) String otp,
			@RequestParam(value = "newPassword", required = false) String newpass,
			@RequestParam(value = "retypePassword", required = false) String retypepass, ModelMap model, RedirectAttributes redirectAttribute) {
		String error = "";
		System.out.println(username);
		if (userService.checkOTP(username, otp)) {
			if (newpass.equals(retypepass)) {
				userService.setPassword(username, newpass);
				error = "Your Password has been reset succesfully, Try logging with your new Password.";
				redirectAttribute.addFlashAttribute("success", error);
				return "redirect:login";
			} else {
				error = "Password doesn't match, try again";
			}
		} else {
			error = "OTP is incorrect";
		}
		model.put("error", error);
		return "reset";
	}

	

	@PostMapping(value = "/validateCredentials")
	public @ResponseBody Integer resetPageVerification(@RequestBody String json) {
		System.out.println(json);
		String[] str = json.split("&");
		String[] username = str[0].split("=");
		String[] password = str[1].split("=");
		System.out.println(str[0] + "" + str[1]);
		System.out.println(username[1] + " " + password[1]);
		if(userService.returnCounter(username[1]) != 5) {
			if (userService.getPassword(username[1], password[1])) {
				 userService.sendOtp(username[1]);
				return 1;
			} else {
				return 0;
			}
		}else {
			return 301;
		}
		
	}
	/* Dynamic Token Initialization and Setup */

	@PostMapping(value = "/login")
	public String userLogin(@RequestParam(value = "hiddenUserName", required = false) String username,
			@RequestParam(value = "token1", required = false) String token1,
			@RequestParam(value = "token2", required = false) String token2,
			@RequestParam(value = "token3", required = false) String token3,
			@RequestParam(value = "token4", required = false) String token4, ModelMap model) {
		System.out.println("UserName:" + username);

		String token = token1 + token2 + token3 + token4;
		System.out.println("Token:" + token);

		boolean check = userService.checkpassword(username, token);
		int counter = userService.returnCounter(username);

		String errorMessage = "";

		if (check) {
			System.out.println("Password Verified Succesfully");
			if (counter < 3) {
				userService.setCounter(username, 0);
			} else if (counter == 3) {
				userService.setCounter(username, 4);
			}
			return "redirect:success";
		} else {
			System.out.println("Password Not Verified");

			if (counter == 0) {
				userService.setCounter(username, 1);
				errorMessage = "Your Password is incorrect, You have only 2 attempts remaining.";
			} else if (counter == 1) {
				userService.setCounter(username, 2);
				errorMessage = "Your Password is incorrect, You have only 1 attempt remaining.";
			} else if (counter == 2) {
				userService.setCounter(username, 3);
				userService.sendEmail(username);
				errorMessage = "Your Password is incorrect, Check your email for new Password.";
				return "blocked";
			} else if (counter == 3) {
				userService.setCounter(username, 5);
				errorMessage = "Your Password is incorrect, Your account has been blocked permanently. Please contact Administrator";
			} else if (counter == 4) {
				userService.setCounter(username, 5);
				errorMessage = "Your Password is incorrect, Your account has been blocked permanently. Please contact Administrator";
			} else {
				errorMessage = "Unknown Error Occoured. Please try again after some time, or else contact administrator";
			}

			model.put("error", errorMessage);
			return "login";
		}
	}

	@RequestMapping(value = "/success")
	public String successPage() {
		return "success";
	}

	@RequestMapping(value = "/blocked")
	public String blockAccountPage() {

		return "blocked";
	}

	@GetMapping(value = "/reset")
	public String resetPage() {

		return "reset";
	}

}

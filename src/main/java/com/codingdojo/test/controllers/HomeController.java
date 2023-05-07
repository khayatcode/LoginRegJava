package com.codingdojo.test.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.test.models.LoginUser;
import com.codingdojo.test.models.User;
import com.codingdojo.test.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/users")
public class HomeController {

	 @Autowired
	 private UserService userServ;

	@GetMapping("")
	public String index(Model model, @ModelAttribute("newUser") User newUser, @ModelAttribute("newLogin") LoginUser newLogin ) {
		return "loginReg.jsp";
	}

	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
		System.out.println(session.getAttribute("userID"));
		
		// Do this in all routes inside the page
		if(session.getAttribute("userID") == null) {
			return "redirect:/users";
		}
		
		User thisUser = this.userServ.getByID((Long) session.getAttribute("userID"));
		model.addAttribute("user", thisUser);
		
		return "home.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {

		// TO-DO Later -- call a register method in the service
		User thisUser = this.userServ.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "loginReg.jsp";
		}

		// TO-DO Later: Store their ID from the DB in session, and redirect
		session.setAttribute("userID", thisUser.getId());

		return "redirect:/users/home";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		
		 User thisUser = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "loginReg.jsp";
		}

		// TO-DO Later: Store their ID from the DB in session, and redirect
		session.setAttribute("userID", thisUser.getId());

		return "redirect:/users/home";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/users";
	}
}

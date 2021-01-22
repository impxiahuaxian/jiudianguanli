package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Pojo.User;
import service.UserService;

import java.util.Enumeration;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/")
    public String index(HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
        if (user!=null){
            if(user.getType().equals("zuke")){
                return "zuke/main";
            }
            else{
                return "admin/main1";
            }
        }
        return "login";
    }

	@RequestMapping("/logout")
	public String logout(HttpSession httpSession ){
		httpSession.removeAttribute("user");
		return "redirect:/";
	}

	@RequestMapping("/logincheck")
	public String login(User user,Model model,HttpSession httpSession) throws Exception{

		User user1=userService.login(user);

		if(user1!=null){
			httpSession.setAttribute("user", user1);
			if(user1.getType().equals("zuke")){
				return "zuke/main";
			}
			else{
				return "admin/main1";
			}
		}else{
			String error="error";
			model.addAttribute("error", error);
		return "login";
		}
	}
	@RequestMapping("/toindex")
	public String toindex(Model model) throws Exception{


		return "admin/index";
		}
	}


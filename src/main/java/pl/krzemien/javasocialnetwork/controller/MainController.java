package pl.krzemien.javasocialnetwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

    @GetMapping("/home")
    public String home(){
        return "index";
    }

    @GetMapping("/login")
    public String login(
            @RequestParam(required = false) String error,
            @RequestParam(required = false) String logout,
            Model model){
        if (error != null){
            model.addAttribute("error", true);
        }
        if (logout != null){
            model.addAttribute("logout", true);
        }

        return "login";
    }

    @GetMapping("/register")
    public String register(){
        return "register";
    }

}

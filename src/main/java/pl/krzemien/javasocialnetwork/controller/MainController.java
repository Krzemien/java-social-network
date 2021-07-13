package pl.krzemien.javasocialnetwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.krzemien.javasocialnetwork.model.User;
import pl.krzemien.javasocialnetwork.repository.UserRepository;
import pl.krzemien.javasocialnetwork.service.UserService;

import javax.validation.Valid;

@Controller
public class MainController {

    private final UserService userService;

    public MainController(UserService userService) {
        this.userService = userService;
    }

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
    public String register(Model model){
        model.addAttribute("user", new User());

        return "register";
    }

    @PostMapping("register")
    public String registerValid(@Valid User user, BindingResult result, Model model){
        if (result.hasErrors()){
            model.addAttribute("error", true);
            return "register";
        }

        if (userService.isEmailExists(user.getEmail())) {
            model.addAttribute("isExists", "Taki adres email jest juz zarejestowany!");
            return "register";
        } else if (userService.isUserNameExists(user.getUserName())) {
            model.addAttribute("isExists", "Taka nazwa użytkownika jest juz zarejestrowana!");
            return "register";
        } else {
            userService.addUser(user);
            return "redirect:/login";
        }

    }

}

package pl.krzemien.javasocialnetwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.krzemien.javasocialnetwork.model.Post;
import pl.krzemien.javasocialnetwork.model.User;
import pl.krzemien.javasocialnetwork.service.PostService;
import pl.krzemien.javasocialnetwork.service.UserService;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
public class MainController {

    private final UserService userService;
    private final PostService postService;

    public MainController(UserService userService, PostService postService) {
        this.userService = userService;
        this.postService = postService;
    }

    @GetMapping(value = {"/", "/home"} )
    public String home(Principal principal, Model model){
        User user = userService.getUserByEmail(principal.getName());
        model.addAttribute("userData", user);

        model.addAttribute("post", new Post());

        model.addAttribute("posts", postService.getAllPosts());

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

package pl.krzemien.javasocialnetwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import pl.krzemien.javasocialnetwork.model.User;
import pl.krzemien.javasocialnetwork.service.UserService;

import java.security.Principal;

@Controller
public class UserController {
    public final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/user/{username}")
    public String userProfile(@PathVariable String username, Model model){
        if(userService.isUserNameExists(username)){
            User user = userService.getUserByUserName(username);
            model.addAttribute("userData", user);
            model.addAttribute("userExist", true);
        } else {
            model.addAttribute("userExist", false);
        }

        User user = userService.getUserByUserName(username);

        model.addAttribute("followers", userService.getFollowers(user).size());
        model.addAttribute("following", userService.getFollowing(user).size());

        return "profile";
    }

    @GetMapping("/user/edit")
    public String userSettings(Principal principal, Model model){
        User user = userService.getUserByEmail(principal.getName());
        model.addAttribute("userData", user);

        return "settings";
    }

    @GetMapping("/user/{username}/following")
    public String userFollowing(@PathVariable String username, Model model){
        if(userService.isUserNameExists(username)){
            User user = userService.getUserByUserName(username);
            model.addAttribute("userData", user);
            model.addAttribute("userExist", true);
        } else {
            model.addAttribute("userExist", false);
        }

        User user = userService.getUserByUserName(username);
        model.addAttribute("following", userService.getFollowing(user));

        return "following";
    }

    @GetMapping("/user/{username}/followers")
    public String userFollowers(@PathVariable String username, Model model){
        if(userService.isUserNameExists(username)){
            User user = userService.getUserByUserName(username);
            model.addAttribute("userData", user);
            model.addAttribute("userExist", true);
        } else {
            model.addAttribute("userExist", false);
        }

        User user = userService.getUserByUserName(username);
        model.addAttribute("followers", userService.getFollowers(user));

        return "followers";
    }
}

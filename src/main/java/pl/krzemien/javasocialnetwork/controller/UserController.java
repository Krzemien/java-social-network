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
    public String userProfile(Principal principal, @PathVariable String username, Model model){
        User user = userService.getUserByEmail(principal.getName());
        model.addAttribute("userData", user);

        if(userService.isUserNameExists(username)){
            model.addAttribute("userExist", true);

            User user2 = userService.getUserByUserName(username);
            model.addAttribute("userData2", user2);

            model.addAttribute("followers", userService.getFollowers(user2).size());
            model.addAttribute("following", userService.getFollowing(user2).size());
        } else {
            model.addAttribute("userExist", false);
        }

        return "profile";
    }

    @GetMapping("/user/edit")
    public String userSettings(Principal principal, Model model){
        User user = userService.getUserByEmail(principal.getName());
        model.addAttribute("userData", user);

        return "settings";
    }

    @GetMapping("/user/{username}/following")
    public String userFollowing(Principal principal, @PathVariable String username, Model model){
        User user = userService.getUserByEmail(principal.getName());
        model.addAttribute("userData", user);

        if(userService.isUserNameExists(username)){
            model.addAttribute("userExist", true);

            User user2 = userService.getUserByUserName(username);
            model.addAttribute("userData2", user2);

            model.addAttribute("following", userService.getFollowing(user2));
        } else {
            model.addAttribute("userExist", false);
        }

        return "following";
    }

    @GetMapping("/user/{username}/followers")
    public String userFollowers(Principal principal, @PathVariable String username, Model model){
        User user = userService.getUserByEmail(principal.getName());
        model.addAttribute("userData", user);

        if(userService.isUserNameExists(username)){
            model.addAttribute("userExist", true);

            User user2 = userService.getUserByUserName(username);
            model.addAttribute("userData2", user2);
            model.addAttribute("followers", userService.getFollowers(user2));
        } else {
            model.addAttribute("userExist", false);
        }

        return "followers";
    }
}

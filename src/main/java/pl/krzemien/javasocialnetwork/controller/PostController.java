package pl.krzemien.javasocialnetwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import pl.krzemien.javasocialnetwork.model.Post;
import pl.krzemien.javasocialnetwork.model.User;
import pl.krzemien.javasocialnetwork.service.PostService;
import pl.krzemien.javasocialnetwork.service.UserService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class PostController {
    private final UserService userService;
    private final PostService postService;

    public PostController(UserService userService, PostService postService) {
        this.userService = userService;
        this.postService = postService;
    }

    @PostMapping("/")
    public String postValid(Principal principal, @Valid Post post, BindingResult result, Model model){
        User user = userService.getUserByEmail(principal.getName());

        if (result.hasErrors()){
            model.addAttribute("name",
                    String.format("%s %s",
                            user.getFirstName(),
                            user.getLastName()
                    )
            );
            model.addAttribute("posts", postService.getAllPosts());

            return "index";
        }

        post.setUser(user);
        postService.addPost(post);

        return "redirect:/";
    }
}

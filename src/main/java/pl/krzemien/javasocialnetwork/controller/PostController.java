package pl.krzemien.javasocialnetwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import pl.krzemien.javasocialnetwork.model.Post;
import pl.krzemien.javasocialnetwork.service.PostService;

import javax.validation.Valid;

@Controller
public class PostController {
    private final PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

    @PostMapping("/post")
    public String postValid(@Valid Post post, BindingResult result, Model model){

        if (result.hasErrors()){
            model.addAttribute("posts", postService.getAllPosts());

            return "index";
        }

        postService.addPost(post);

        return "redirect:/";
    }
}

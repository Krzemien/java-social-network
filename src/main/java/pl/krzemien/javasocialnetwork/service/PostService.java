package pl.krzemien.javasocialnetwork.service;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import pl.krzemien.javasocialnetwork.model.Post;
import pl.krzemien.javasocialnetwork.model.User;
import pl.krzemien.javasocialnetwork.repository.PostRepository;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

@Service
public class PostService {
    private final PostRepository postRepository;
    private final UserService userService;

    public PostService(PostRepository postRepository, UserService userService) {
        this.postRepository = postRepository;
        this.userService = userService;
    }

    public void addPost(Post post){
        post.setUser(getPrincipal());
        postRepository.save(post);
    }

    public List<Post> getAllPosts(){
        List<Post> posts = postRepository.findAll();
        Collections.reverse(posts);
        return posts;
    }

    public User getPrincipal(){
//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        MyUserDetails myUserDetails = (MyUserDetails) principal;
//        myUserDetails.getUser();

        Principal principal = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.getUserByEmail(principal.getName());
        return user;
    }

}

package pl.krzemien.javasocialnetwork.service;

import org.springframework.stereotype.Service;
import pl.krzemien.javasocialnetwork.model.Post;
import pl.krzemien.javasocialnetwork.repository.PostRepository;

import java.util.Collections;
import java.util.List;

@Service
public class PostService {
    private final PostRepository postRepository;

    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public void addPost(Post post){
        postRepository.save(post);
    }

    public List<Post> getAllPosts(){
        List<Post> posts = postRepository.findAll();
        Collections.reverse(posts);
        return posts;
    }

}

package pl.krzemien.javasocialnetwork.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.krzemien.javasocialnetwork.model.Post;

public interface PostRepository extends JpaRepository<Post, Long> {

}

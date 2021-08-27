package pl.krzemien.javasocialnetwork.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.krzemien.javasocialnetwork.model.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
    User findByUserName(String userName);
    Boolean existsByEmail(String email);
    Boolean existsByUserName(String userName);
    List<User> findAllByFollowers(User user);
    List<User> findAllByFollowing(User user);

}

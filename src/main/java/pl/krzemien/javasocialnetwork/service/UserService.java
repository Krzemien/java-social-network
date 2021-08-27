package pl.krzemien.javasocialnetwork.service;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.krzemien.javasocialnetwork.model.User;
import pl.krzemien.javasocialnetwork.repository.UserRepository;

import java.security.Principal;
import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void addUser(User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole("ROLE_USER");

        userRepository.save(user);
    }

    public User getUserByEmail(String email){
        return userRepository.findByEmail(email);
    }

    public User getUserByUserName(String userName){
        return userRepository.findByUserName(userName);
    }

    public boolean isUserNameExists(String userName){
        return userRepository.existsByUserName(userName);
    }

    public boolean isEmailExists(String email){
        return userRepository.existsByEmail(email);
    }

    public List<User> getFollowers(User user){
        List<User> followers = userRepository.findAllByFollowers(user);
        return followers;
    }

    public List<User> getFollowing(User user){
        List<User> following = userRepository.findAllByFollowing(user);
        return following;
    }

}

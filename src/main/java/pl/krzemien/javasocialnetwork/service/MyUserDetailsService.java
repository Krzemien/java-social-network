package pl.krzemien.javasocialnetwork.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.krzemien.javasocialnetwork.model.MyUserDetails;
import pl.krzemien.javasocialnetwork.model.User;
import pl.krzemien.javasocialnetwork.repository.UserRepository;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(login);

        if (user == null){
            throw new UsernameNotFoundException("Brak takiego maila.");
        }

        return new MyUserDetails(user);
    }
}

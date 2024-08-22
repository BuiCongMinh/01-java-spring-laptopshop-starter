package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public User getAllUserByEmail(String email) {
        return this.userRepository.findFirstByEmail(email);
    }

    public User handelSaveUser(User user) {
        User minhvn1 = this.userRepository.save(user);
        System.out.println(">>> check user: " + minhvn1);
        return minhvn1;
    }
}

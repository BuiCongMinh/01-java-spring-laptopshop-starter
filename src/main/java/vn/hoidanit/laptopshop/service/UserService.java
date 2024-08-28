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

    public User getUserByID(long id) {
        User userId = this.userRepository.findUserById(id);
        return userId;
    }

    public List<User> getAllUser() {
        List<User> allUsers = this.userRepository.findAll();
        return allUsers;
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User handelSaveUser(User user) {
        User minhvn1 = this.userRepository.save(user);
        System.out.println(">>> check user: " + minhvn1);
        return minhvn1;
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }
}

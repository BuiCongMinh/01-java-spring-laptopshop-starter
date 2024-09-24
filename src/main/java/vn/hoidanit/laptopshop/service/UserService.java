package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.repository.RoleRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
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
        // System.out.println(">>> check user: " + minhvn1);
        return minhvn1;
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOToUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());

        return user;
    }
}

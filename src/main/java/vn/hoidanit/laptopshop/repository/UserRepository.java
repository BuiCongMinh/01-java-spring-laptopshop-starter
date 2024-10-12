package vn.hoidanit.laptopshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.User;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User minhvn);

    void deleteById(long id);

    User findUserById(long id); // ko lấy get vì hàm có thể trả ra giá trị null !

    List<User> findOneByEmail(String email);

    Page<User> findAll(Pageable page);

    boolean existsByEmail(String email);

    User findByEmail(String email);

}

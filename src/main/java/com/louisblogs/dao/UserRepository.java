package com.louisblogs.dao;
/*
 * Created by luqi on 2021/2/12 21:40
 */

import com.louisblogs.po.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsernameAndPassword(String username, String password);

}

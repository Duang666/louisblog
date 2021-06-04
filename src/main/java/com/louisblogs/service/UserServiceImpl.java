package com.louisblogs.service;
/*
 * Created by luqi on 2021/2/12 21:37
 */

import com.louisblogs.dao.UserRepository;
import com.louisblogs.po.User;
import com.louisblogs.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    //注入使用dao
    @Autowired
    private UserRepository userRepository;

    //检查用户名和密码
    @Override
    public User checkUser(String username, String password) {
        User user = userRepository.findByUsernameAndPassword(username, MD5Utils.code(password));
        return user;
    }

}

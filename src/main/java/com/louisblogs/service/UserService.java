package com.louisblogs.service;
/*
 * Created by luqi on 2021/2/12 21:37
 */

import com.louisblogs.po.User;

public interface UserService {

    User checkUser(String username, String password);

}

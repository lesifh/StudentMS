package com.lzf.service.impl;

import com.lzf.dao.UserDao;
import com.lzf.po.User;
import com.lzf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    // 注册
    @Override
    public Integer register(User user) {
        return this.userDao.addUser(user);
    }

    // 通过用户名查询密码
    @Override
    public String login(String username) {
        if (this.userDao.findUserByAccount(username) != null){
            return this.userDao.findUserByAccount(username).getPassword();
        } else {
            return null;
        }
    }



    // 查看用户名是否已被占用

}

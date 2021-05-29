package com.lzf.dao;

import com.lzf.po.User;

public interface UserDao {
    //  添加
    public Integer addUser(User user);
    //  查询
    public User findUserByAccount(String account);
}

package com.lzf.service;

import com.lzf.po.User;

public interface UserService {
    // 注册
    public Integer register(User user);
    // 登录
    public String login(String username);
    // 通过username得到对象
    public User getUserByUsername(String username);

}

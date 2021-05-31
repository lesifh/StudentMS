package com.lzf.controller;

import com.lzf.po.Student;
import com.lzf.po.User;
import com.lzf.service.StudentService;
import com.lzf.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;


@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;

    // 登录
    @RequestMapping("/doLogin")
    public String login(Model model,
                        String username, String password,
                        HttpSession session){
        User user = new User();
        user.setPassword(password);
        user.setUsername(username);
        // 通过username找到数据库中的密码
        String pwdInDB = this.userService.login(username);
        // 如果未找到该username，则为该账户未注册
        if (pwdInDB == null || pwdInDB == ""){
            model.addAttribute("msg", "该账户未注册");
            return "login";
        }else {
            // 如果密码正确 执行登录
            if (password.equals(pwdInDB)){
                System.out.println("登录成功");
                session.setAttribute("USER_SESSION", user);
                // 返回学生信息页面
                ArrayList<Student> students = studentService.findAllStudents();

                if (students.size() == 0) {
                    System.out.println("无结果");
                    model.addAttribute("noStudents", "无结果");
                } else {
                    System.out.println("有结果");
                    model.addAttribute("students", students);
                }
                return "students";
            } else {
                System.out.println("密码错误");
                model.addAttribute("msg", "密码错误，请重新输入");
                return "login";
            }
        }
    }

    @RequestMapping("/doRegister")
    public String register(Model model, String username, String password){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        int rows = this.userService.register(user);
        // 查询数据库中是否有相同用户名
//        User userInDB = ("");
        if (rows > 0) {
            System.out.println("注册成功");
            // 自动登录
            return "login";
        } else {
            System.out.println("注册失败");
            return "register";
        }
    }

    @RequestMapping("doLogout")
    public String logout(HttpSession session){
        // 清除session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "redirect:toLogin";
    }


    // 前往登录页面
    @RequestMapping("/toLogin")
    public String toLogin(Model model) {
        return "login";
    }

    // 前往注册页面
    @RequestMapping("/toRegister")
    public String toRegister(Model model){
        return "register";
    }

    // 前往首页
    @RequestMapping("/index")
    public String ToIndex(Model model, HttpServletRequest request, HttpServletResponse response){
        return "students";
    }

}

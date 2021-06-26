package com.lzf.controller;

import com.github.pagehelper.PageInfo;
import com.lzf.po.Student;
import com.lzf.po.User;
import com.lzf.service.StudentService;
import com.lzf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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
                        HttpSession session,
                        @RequestParam(defaultValue = "1") int pageNum,
                        @RequestParam(defaultValue = "10") int pageSize){
        User user = new User();
        user.setPassword(password);
        user.setUsername(username);
        // 通过username找到数据库中的密码
        String pwdInDB = this.userService.login(username);
        // 如果未找到该username，则为该账户未注册
        if (pwdInDB == null || pwdInDB == ""){
            model.addAttribute("msg", "未注册");
            return "login";
        }else {
            // 如果密码正确 执行登录
            if (password.equals(pwdInDB)){
                session.setAttribute("USER_SESSION", user);
                model.addAttribute("msg", "登陆成功");
                // 返回学生信息页面
                PageInfo<Student> students = studentService.findAllStudents(pageNum, pageSize);
                if (students.getTotal() == 0) {
                    System.out.println("无结果");
                    model.addAttribute("noStudents", "无结果");
                } else {
                    System.out.println("有结果");
                    model.addAttribute("students", students);
                }
                return "students";
            } else {
                System.out.println("密码错误");
                model.addAttribute("msg", "密码错误");
                return "login";
            }
        }
    }

    @RequestMapping("/doRegister")
    public String register(Model model, String username, String password){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        // 查询数据库中是否有相同用户名
        // 从数据库中得到用户对象
        User userInDB = (User) userService.getUserByUsername(username);
        // 数据库中已有重名对象
        if (userInDB != null) {
            System.out.println(userInDB);
            System.out.println("重名");
            model.addAttribute("msg", "重名");
            return "register";
            // 无重名
        } else {
            int rows = this.userService.register(user);
            if (rows > 0) {
                model.addAttribute("msg", "注册成功");
                System.out.println("注册成功");
                // 跳转到登录页面
                return "login";
            } else {
                model.addAttribute("msg", "服务器错误");
                return "register";
            }
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

    // 测试连接
    public String test(){
        return "测试成功";
    }
}

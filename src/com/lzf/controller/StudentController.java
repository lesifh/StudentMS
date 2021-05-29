package com.lzf.controller;

import com.lzf.po.Student;
import com.lzf.service.StudentService;
import com.lzf.service.impl.StudentServiceImpl;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;
import java.util.ArrayList;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;

    // 根据Id查找学生信息
    @RequestMapping("/findStudentById")
    public String findStudentById(Integer id, Model model){
        Student student = this.studentService.findStudentById(id);
        model.addAttribute("student", student);
        return "students";
    }

    // 根据多条件返回学生信息
    @RequestMapping("findStudentByConditions")
    public String findStudent(String name, String address, Integer id, Model model) {
        if (name != null && name != "" || address != null && address != "" || id != null && id != 0) {
            Student student = new Student();
            student.setName(name);
            student.setAddress(address);
            student.setId(id);
            ArrayList<Student> result = studentService.findStudentByConditions(student);
            model.addAttribute("students", result);
            return "students";
        } else {
            ArrayList<Student> students = studentService.findAllStudents();
            model.addAttribute("students", students);
            return "students";
        }

    }

    // 列出所有学生
    @RequestMapping("/findAllStudents")
    public String findAllStudents(Model model){
        ArrayList<Student> students = studentService.findAllStudents();
        model.addAttribute("students", students);
        return "students";
    }

    // 增加学生
    @RequestMapping("addStudent")
    public String addStudent(Model model,
                             String name, String age, String gender, String number,
                             String address, Integer status){
        Student student = new Student();
        student.setName(name);
        student.setAge(age);
        student.setGender(gender);
        student.setNumber(number);
        student.setAddress(address);
        student.setStatus(status);
        int rows = studentService.addStudent(student);
        ArrayList<Student> students = studentService.findAllStudents();
        model.addAttribute("students", students);
        return "students";
    };

    // 删除学生
    @RequestMapping("deleteStudent")
    public String deleteStudent(Model model, Integer id){
        int rows = studentService.deleteStudent(id);
        if (rows > 0) {
            System.out.println("删除成功");
        } else {
            System.out.println("删除失败");
        }
        ArrayList<Student> students = studentService.findAllStudents();
        model.addAttribute("students", students);
        return "students";
    }

    // 更新学生
    @RequestMapping("updateStudent")
    public String updateStudent(Model model,
                                String name, String age, String gender, String number,
                                String address, Integer status, Integer id){
        System.out.println("name="+name);
        Student student = new Student();
        student.setName(name);
        student.setAge(age);
        student.setGender(gender);
        student.setId(id);
        student.setNumber(number);
        student.setAddress(address);
        student.setStatus(status);
        int rows = studentService.updateStudent(student);
        if (rows > 0 ) {
            System.out.println("修改成功");
        } else {
            System.out.println("修改失败");
        }
        ArrayList<Student> students = studentService.findAllStudents();
        model.addAttribute("students", students);
        return "students";
    }

    @RequestMapping("toEdit")
    public  String toEdit(Model model, Integer id){
        // 查找该学生信息
        Student student = studentService.findStudentById(id);
        model.addAttribute("student", student);
        System.out.println("编辑学生信息");
        return "edit";
    }

    @RequestMapping("toAdd")
    public String toAdd(Model model) {
        System.out.println("添加学生");
        return "add";
    }
}

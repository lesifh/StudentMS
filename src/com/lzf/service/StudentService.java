package com.lzf.service;

import com.lzf.po.Student;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

public interface StudentService {

    // 根据id查找学生
    public Student findStudentById(Integer id);
    // 查找学生
    public ArrayList<Student>findStudentByConditions(Student student);
    // 列出所有学生
    public ArrayList<Student> findAllStudents();
    // 编辑学生
    public Integer updateStudent(Student student);
    // 删除学生
    public Integer deleteStudent(Integer id);
    // 增加学生
    public Integer addStudent(Student student);
}

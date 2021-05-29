package com.lzf.dao;

import com.lzf.po.Student;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.ArrayList;

public interface StudentDao {
    // 根据id查找学生
    public Student findStudentById(Integer id);
    //  根据信息查询学生
    public ArrayList<Student> findStudentByConditions(Student student);
    // 查询所有学生
    public ArrayList<Student> findAllStudents();
    // 编辑学生
    public Integer updateStudent(Student student);
    // 删除学生
    public Integer deleteStudent(Integer id);
    // 增加学生
    public Integer addStudent(Student student);
}

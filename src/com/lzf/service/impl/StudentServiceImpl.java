package com.lzf.service.impl;

import com.lzf.dao.StudentDao;
import com.lzf.po.Student;
import com.lzf.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    // 注解注入StudentDao
    @Autowired
    private StudentDao studentDao;

    // 根据id查找学生
    public Student findStudentById(Integer id){
        return this.studentDao.findStudentById(id);
    };

    // 多条件查找学生
    public ArrayList<Student> findStudentByConditions(Student student) {
        return this.studentDao.findStudentByConditions(student);
    }

    // 查找所有学生
    public ArrayList<Student>  findAllStudents() {
        return this.studentDao.findAllStudents();
    }

    // 编辑学生
    public Integer updateStudent(Student student){
        return this.studentDao.updateStudent(student);
    };

    // 删除学生
    public Integer deleteStudent(Integer id){
        return this.studentDao.deleteStudent(id);
    };

    // 增加学生
    public Integer addStudent(Student student){
        return this.studentDao.addStudent(student);
    };
}

package com.lzf.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lzf.dao.StudentDao;
import com.lzf.po.Student;
import com.lzf.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    // 注解注入StudentDao
    @Autowired
    private StudentDao studentDao;

    // 分页查询
    public PageInfo<Student> findPage(Student student, int pageNum, int pageSize){
        // 第二种实现方法
        return PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(()->{
            studentDao.findAllStudents();
        });
    }


    // 根据id查找学生
    public Student findStudentById(Integer id){
        return this.studentDao.findStudentById(id);
    };

    // 多条件查找学生
    public PageInfo<Student> findStudentByConditions(Student student, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Student> list = this.studentDao.findStudentByConditions(student);
        PageInfo<Student> page = new PageInfo<>(list);
        return page;
    }

    // 查找所有学生
    public PageInfo<Student> findAllStudents(int pageNum, int pageSize) {
        return PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(()-> {
            studentDao.findAllStudents();
        });
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

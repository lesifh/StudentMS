package com.lzf.service;

import com.github.pagehelper.PageInfo;
import com.lzf.po.Student;

public interface StudentService {
    // 分页查询

    /**
     *
     * @param student 条件
     * @param pageNum 当前页
     * @param pageSize 每页展示行数
     * @return
     */
    public PageInfo<Student> findPage(Student student, int pageNum, int pageSize);

    // 根据id查找学生
    public Student findStudentById(Integer id);

    // 查找学生

    /**
     *
     * @param student 查询条件
     * @param pageNum 开始页码
     * @param pageSize 每页展示行数
     * @return
     */
    public PageInfo<Student> findStudentByConditions(Student student, int pageNum, int pageSize);
    // 列出所有学生
    public PageInfo<Student> findAllStudents(int pageNum, int pageSize);
    // 编辑学生
    public Integer updateStudent(Student student);
    // 删除学生
    public Integer deleteStudent(Integer id);
    // 增加学生
    public Integer addStudent(Student student);
}

package com.lzf.po;

public class Student {
    private Integer id;
    private String age;
    private String name;
    private String gender;
    private String number;
    private String address;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public String getAge() {
        return age;
    }

    public String getName() {
        return name;
    }

    public Integer getStatus() {
        return status;
    }

    public String getAddress() {
        return address;
    }

    public String getGender() {
        return gender;
    }

    public String getNumber() {
        return number;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", age='" + age + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", number='" + number + '\'' +
                ", address='" + address + '\'' +
                ", status=" + status +
                '}';
    }
}

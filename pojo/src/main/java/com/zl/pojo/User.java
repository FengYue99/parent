package com.zl.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Component
@Scope("prototype")
public class User implements Serializable {
    private Integer id;
    private Integer userId;
    @Pattern(regexp = "^[a-zA-Z0-9]{6,8}$",message = "姓名格式错误，只能是6-8位并且只能有数字和大小写字母")
    private String name;
    @Pattern(regexp = "^[a-zA-Z]\\w{5,17}$",message = "密码格式错误，只能是6-18位以大小写字母开头包含数字字母下划线")
    private String pwd;
    private Integer age;
    private Integer sex;
    private Role role;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", age=" + age +
                ", sex=" + sex +
                ", role=" + role +
                '}';
    }
}

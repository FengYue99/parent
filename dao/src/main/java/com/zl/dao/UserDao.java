package com.zl.dao;

import com.zl.pojo.User;

public interface UserDao {
    /**
     * 用户登录，用来处理用户登录的信息
     *
     * @param user
     * @return
     */
    public User login(User user);

    /**
     * 注册
     */
    public User registerAjax(String name);

    /**
     * 登录的ajax请求
     * @param name
     * @return
     */
    public User loginAjax(String name);

    /**
     * 把注册的数据添加到数据库
     * @param user
     * @return
     */
    public int registerAdd(User user);
}

package com.zl.service.impl;

import com.zl.dao.UserDao;
import com.zl.pojo.User;
import com.zl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao ud ;
    /**
     * 用户登录，用来处理用户登录的信息
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        if (user.getName() != null && !"".equals(user.getName()) && user.getPwd() != null && !"".equals(user.getPwd())){
            user = ud.login(user);
        }else {
            user = null;
        }
        return user;
    }

    /**
     * 注册
     * @param name
     */
    @Override
    public User registerAjax(String name) {
        User u = ud.registerAjax(name);
        return u;
    }

    /**
     * 登录的ajax请求
     *
     * @param name
     * @return
     */
    @Override
    public User loginAjax(String name) {
        User u = ud.loginAjax(name);
        return u;
    }

    /**
     * 把注册的数据添加到数据库
     *
     * @param user
     * @return
     */
    @Override
    public int registerAdd(User user) {
        int flag = ud.registerAdd(user);
        return flag;
    }
}

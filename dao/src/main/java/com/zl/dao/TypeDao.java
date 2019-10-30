package com.zl.dao;

import com.zl.pojo.Type;

import java.util.List;

public interface TypeDao {
    /**
     * 查询新闻类型的所有信息
     */
    public List<Type> queryType();
}

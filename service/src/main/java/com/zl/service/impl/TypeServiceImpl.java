package com.zl.service.impl;

import com.zl.dao.TypeDao;
import com.zl.pojo.Type;
import com.zl.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeDao td;

    /**
     * 查询新闻类型的所有信息
     */
    @Override
    public List<Type> queryType() {
        List<Type> t = td.queryType();
        return t;
    }
}

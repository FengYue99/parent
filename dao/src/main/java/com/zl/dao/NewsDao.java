package com.zl.dao;

import com.zl.pojo.News;
import com.zl.pojo.Paging;
import com.zl.pojo.Query;

import java.util.List;

public interface NewsDao {
    /**
     * 添加新闻
     *
     * @param news
     * @return
     */
    public int add(News news);

    /**
     * 根据id删除新闻信息
     *
     * @param id
     * @return
     */
    public int delete(int id);

    /**
     * 修改员工信息
     *
     * @param news
     * @return
     */
    public int update(News news);

    /**
     * 根据id查询员工信息
     *
     * @param id
     * @return
     */
    public News queryNewsById(int id);

   /* *//**
     * 查询所有
     * @return
     *//*
    public List<News> queryNews();

    *//**
     * 根据新闻标题以及新闻发布的时间进行模糊查询
     * @param query
     * @return
     *//*
    public List<News> queryNewsLike(Query query);*/

    /**
     * 根据条件查询，将查询出来的结果对结果进行分页，每页显示三条数据
     */
    public List<News> queryNewsPaging(Paging pg);

    /**
     * 查询总条数
     */
    public int queryNewsStripSum(Query query);
}

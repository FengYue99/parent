package com.zl.service;

import com.zl.pojo.News;
import com.zl.pojo.Paging;

import java.util.List;

public interface NewsService {
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
    public int delete(int[] id);

    /**
     * 修改新闻信息
     *
     * @param news
     * @return
     */
    public int update(News news);

    /**
     * 根据id查询新闻信息
     *
     * @param id
     * @return
     */
    public News queryNewsById(int id);


    /**
     * 根据条件查询，将查询出来的结果对结果进行分页，每页显示三条数据
     */
    public List<News> queryNewsPaging(Paging pg);
}

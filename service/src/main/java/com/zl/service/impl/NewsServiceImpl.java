package com.zl.service.impl;

import com.zl.dao.NewsDao;
import com.zl.pojo.News;
import com.zl.pojo.Paging;
import com.zl.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsDao nd ;

    /**
     * 添加新闻
     *
     * @param news
     * @return
     */
    @Override
    public int add(News news) {
        int flag=nd.add(news);
        return flag;
    }

    /**
     * 根据id删除新闻信息
     *
     * @param id
     * @return
     */
    @Override
    public int delete(int[] id) {
        if (id != null && id.length > 0) {
            for (int ns : id) {
                nd.delete(ns);
            }
        }
        return 1;
    }

    /**
     * 修改新闻信息
     *
     * @param news
     * @return
     */
    @Override
    public int update(News news) {
        int flag = nd.update(news);
        return flag;
    }

    /**
     * 根据id查询新闻信息
     *
     * @param id
     * @return
     */
    @Override
    public News queryNewsById(int id) {
        News n = nd.queryNewsById(id);
        return n;
    }

    /**
     * 根据条件查询，将查询出来的结果对结果进行分页，每页显示三条数据
     *
     * @param pg
     */
    @Override
    public List<News> queryNewsPaging(Paging pg) {
        //符合要求的总记录数
        pg.setStripSum(nd.queryNewsStripSum(pg.getQuery()));
        //处理当前页的页数
        if(pg.getPage()!=null){
            if(pg.getPage()<=0){
                pg.setPage(1);
            }
            if(pg.getPage()>pg.getPageSum()){
                pg.setPage(pg.getPageSum());
            }
        }else{
            pg.setPage(1);
        }
        List<News> news=nd.queryNewsPaging(pg);
        return news;
    }

    /**
     * 查询总条数
     *
     * @param query
    @Override
    public int queryNewsStripSum(Query query) {
        return nd.queryNewsStripSum(query);
    }*/
}

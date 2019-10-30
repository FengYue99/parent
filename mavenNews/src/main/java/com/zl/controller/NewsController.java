package com.zl.controller;

import com.zl.pojo.News;
import com.zl.pojo.Paging;
import com.zl.pojo.Type;
import com.zl.service.NewsService;
import com.zl.service.NewsServiceFileUpload;
import com.zl.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService ns;
    @Autowired
    private NewsServiceFileUpload nsf;
    @Autowired
    private TypeService ts;

    @RequestMapping("/show")
    public ModelAndView newsShow(Paging pg){
        ModelAndView mv = new ModelAndView();
        //获取分页查询对象
        List<News> news = ns.queryNewsPaging(pg);
        mv.addObject("news",news);
        mv.setViewName("main");
        return mv;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public ModelAndView delete(int[] id){
        ModelAndView mv = new ModelAndView();
        ns.delete(id);
        mv.setViewName("redirect:show");
        return mv;
    }

    /**
     * 添加
     * @param news
     * @param imgPic
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView add(News news, @RequestParam("imgPic") MultipartFile imgPic){
        ModelAndView mv = new ModelAndView();
        news = nsf.upload(news,imgPic);
        ns.add(news);
        mv.setViewName("redirect:show");
        return mv;
    }

    /**
     * 去添加页面
     * @return
     */
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(){
        ModelAndView mv = new ModelAndView();
        List<Type> types = ts.queryType();
        mv.addObject("types",types);
        mv.setViewName("addNews");
        return mv;
    }

    /**
     * 修改
     * @param news
     * @param imgPic
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(News news, @RequestParam("imgPic") MultipartFile imgPic){
        ModelAndView mv = new ModelAndView();
        news = nsf.upload(news,imgPic);
        ns.update(news);
        mv.setViewName("redirect:show");
        return mv;
    }

    /**
     * 去修改页面
     * @return
     */
    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(int id){
        ModelAndView mv = new ModelAndView();
        News news = ns.queryNewsById(id);
        List<Type> types = ts.queryType();
        mv.addObject("news",news);
        mv.addObject("types",types);
        mv.setViewName("updateNews");
        return mv;
    }

    @RequestMapping("/showJson")
    @ResponseBody
    public List<News> newsShowJson(Paging pg){
        //获取分页查询对象
        List<News> news = ns.queryNewsPaging(pg);
        return news;
    }
}

package com.zl.service;

import com.zl.pojo.News;
import org.springframework.web.multipart.MultipartFile;

public interface NewsServiceFileUpload {
    /**
     * 把传过来的List集合转成News对象
     * @param
     * @return
     */
    public News upload(News news, MultipartFile imgPic);
}

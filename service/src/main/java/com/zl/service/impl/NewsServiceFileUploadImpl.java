package com.zl.service.impl;

import com.zl.pojo.News;
import com.zl.service.NewsServiceFileUpload;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class NewsServiceFileUploadImpl implements NewsServiceFileUpload {
    /**
     * 把传过来的List集合转成News对象
     *
     * @param
     * @return
     */
    @Override
    public News upload(News news, MultipartFile imgPic) {
        String oldName = imgPic.getOriginalFilename();
        if (!"".equals(oldName) && oldName!=null ){
            String newName = UUID.randomUUID().toString() + oldName.substring(oldName.lastIndexOf("."));
            File newFile = new File("c:/img/"+newName);
            try {
                imgPic.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
            news.setPic("../img/"+newName);
        }
        return news;
    }
}

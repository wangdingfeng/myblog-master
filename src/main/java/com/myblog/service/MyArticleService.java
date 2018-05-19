package com.myblog.service;

import com.baomidou.mybatisplus.service.IService;
import com.myblog.entity.MyArticle;

public interface MyArticleService extends IService<MyArticle>{
    /**
     * 新增编辑博客
     * @param myArticle
     */
    public void saveOrUpdate(MyArticle myArticle);

}

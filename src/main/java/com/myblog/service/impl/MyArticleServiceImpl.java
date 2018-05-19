package com.myblog.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.myblog.entity.MyArticle;
import com.myblog.mapper.MyArticleMapper;
import com.myblog.service.MyArticleService;

@Service
public class MyArticleServiceImpl extends ServiceImpl<MyArticleMapper, MyArticle> implements MyArticleService{



    @Override
    public void saveOrUpdate(MyArticle myArticle) {
        myArticle.setState("0");
        //判断是否是新增
        if(null == myArticle.getId()){
            myArticle.setSystem(true,myArticle.getOperator());
        }else{
            myArticle.setSystem(false,myArticle.getOperator());
        }
        this.insertOrUpdate(myArticle);
    }
}

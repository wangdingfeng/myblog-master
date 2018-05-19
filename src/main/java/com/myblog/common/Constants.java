package com.myblog.common;

/**
 * @Auther: wangdingfeng
 * @Date: 2018/5/15 18:08
 * @Description: 常量存储类
 */
public class Constants {


    /**
     * 文章状态管理
     */
    //新增
    public final static String BLOG_STATE_ADD = "0";
    //发布
    public final static String BLOG_STATE_PUSH = "1";
    //作废
    public final static String BLOG_STATE_DELETE = "2";

    /**
     * 数据字典
     */
    /*
    根节点
     */
    public final static String DICT_ROOT = "/ROOT";
    /*
    分隔符
     */
    public final static String DICT_DECOLLATAR = "/";
    /*
    系统字典
     */
    public final static String DICT_SYSTEM = DICT_ROOT+DICT_DECOLLATAR+"SYSTEM";
    /*
    业务字典
     */
    public final static String DICT_BUSINESS =  DICT_ROOT+DICT_DECOLLATAR+"BUSINESS";

    public final static String DICT_ARTICLE_TYPE =  DICT_BUSINESS+DICT_DECOLLATAR+"ARTICLE_TYPE"+DICT_DECOLLATAR;


}

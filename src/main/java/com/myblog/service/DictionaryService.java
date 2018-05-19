package com.myblog.service;

import com.baomidou.mybatisplus.service.IService;
import com.myblog.entity.DictionaryModel;

import java.util.List;

/**
 * @Auther: wangdingfeng
 * @Date: 2018/5/16 10:17
 * @Description: 字典service
 */
public interface DictionaryService extends IService<DictionaryModel> {
    /**
     * 获取此路径下的所有子字典
     * @return
     */
    public List<DictionaryModel> getAllDictionaryByPath(String path);
}

package com.myblog.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.myblog.common.Constants;
import com.myblog.entity.DictionaryModel;
import com.myblog.mapper.DictionaryMapper;
import com.myblog.service.DictionaryService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Auther: wangdingfeng
 * @Date: 2018/5/16 10:18
 * @Description: service实现类
 */
@Service
public class DictionaryServiceImpl extends ServiceImpl<DictionaryMapper,DictionaryModel>  implements DictionaryService {
    @Override
    public List<DictionaryModel> getAllDictionaryByPath(String path) {
        EntityWrapper<DictionaryModel> ew = new EntityWrapper<DictionaryModel>();
        ew.like("path",path);
        return this.selectList(ew);
    }
}

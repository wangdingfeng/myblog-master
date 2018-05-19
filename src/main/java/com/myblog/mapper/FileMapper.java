package com.myblog.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.myblog.entity.FileModel;
import org.springframework.stereotype.Repository;

/**
 * @Auther: wangdingfeng
 * @Date: 2018/5/16 10:26
 * @Description:
 */
@Repository
public interface FileMapper extends BaseMapper<FileModel> {
    /**
     * 保存
     * @param fileModel
     */
     void insertSelective (FileModel fileModel);

}

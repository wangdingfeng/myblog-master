package com.myblog.service;

import com.baomidou.mybatisplus.service.IService;
import com.myblog.entity.FileModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Auther: wangdingfeng
 * @Date: 2018/5/16 10:27
 * @Description:
 */
public interface FileService extends IService<FileModel> {

    /**
     * 保存 返回实体
     * @param fileModel
     */
    public FileModel insertSelective(FileModel fileModel);
    /**
     * 预览图片
     * @param id
     * @param response
     * @throws IOException
     */
    public void preview(Integer id, HttpServletResponse response) throws IOException;

}

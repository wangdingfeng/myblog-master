package com.myblog.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.myblog.common.Constants;
import com.myblog.common.config.Config;
import com.myblog.entity.FileModel;
import com.myblog.mapper.FileMapper;
import com.myblog.service.FileService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @Auther: wangdingfeng
 * @Date: 2018/5/16 10:28
 * @Description:
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper,FileModel> implements FileService {

    @Autowired
    private FileMapper fileMapper;

    private Logger log = LoggerFactory.getLogger(FileServiceImpl.class);


    @Override
    public FileModel insertSelective(FileModel fileModel) {
        try {
            fileMapper.insertSelective(fileModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileModel;
    }

    @Override
    public void preview(Integer id,HttpServletResponse response) throws IOException {
        FileModel fileModel =  this.selectById(id);
        String path = fileModel.getFilePath();
        if(StringUtils.isEmpty(path)){
            log.error("没有文件路径"+fileModel.getId());
            return;
        }
        try {
            FileInputStream in = new FileInputStream(Config.filePath+File.separator+ Config.imagePath+File.separator+path);
            OutputStream out = response.getOutputStream();
            byte[] b = new byte[512];

            while ((in.read(b)) != -1) {
                out.write(b);
            }

            out.flush();
            in.close();
            out.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            log.error("系统错误！",e);
        }
    }
}

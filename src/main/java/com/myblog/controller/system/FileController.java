package com.myblog.controller.system;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myblog.common.util.ImageUploadUtil;
import com.myblog.entity.FileModel;
import com.myblog.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件处理
 * @author wangdingfeng
 */
@Controller
@RequestMapping("/file")
public class FileController {

    @Autowired
    private FileService fileService;
	
	 /**
     * ckeditor图片上传
     * 
     * @Title imageUpload
     * @param request
     * @param response
     */
	@RequestMapping("/imageUpload")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
        try {
            ImageUploadUtil.ckeditor(request, response);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 文件上传
     * @param request
     * @param response
     * @param file
     * @return
     */
    @RequestMapping("/uploadFile")
    @ResponseBody
    public Map<String,Object> uploadFile(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "file", required = false) MultipartFile file){
	    Map<String,Object> result = new HashMap<String,Object>();

        //如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件路径
            String path = request.getSession().getServletContext()+File.separator+"upload";
            //上传文件名
            String filename = file.getOriginalFilename();
            //获取后缀
            String suffix = filename.substring(filename.lastIndexOf(".")).toLowerCase();
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            String uploadFileName = (int) (System.currentTimeMillis() / 1000) + suffix;
            //将上传文件保存到一个目标文件当中
            try {
                file.transferTo(new File(path + File.separator + uploadFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            //保存文件信息
            FileModel fileModel = new FileModel();
            fileModel.setFileName(filename);
            fileModel.setFileType(suffix);
            fileModel.setFileUploadName(uploadFileName);
            fileModel.setState("1");
            fileModel.setSystem(true,"999999");
            try {
                fileService.insert(fileModel);
            } catch (Exception e) {
                e.printStackTrace();
            }
            result.put("success",true);
            result.put("id",fileModel.getId());
        } else {
            result.put("success",false);
            result.put("msg","上传失败，文件为空");
        }
	    return result;
    }

    /**
     * 预览文件
     * @param id 文件id
     * @param response
     * @throws IOException
     */
    @RequestMapping("/preview/{id}")
    public void preview(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException {
        fileService.preview(id,response);
    }

}

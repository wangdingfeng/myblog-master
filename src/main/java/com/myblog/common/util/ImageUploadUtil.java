package com.myblog.common.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myblog.common.config.Config;
import com.myblog.entity.FileModel;
import com.myblog.service.FileService;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * ckeditor 工具类
 */
public class ImageUploadUtil {

    private static Logger log = LoggerFactory.getLogger(ImageUploadUtil.class);
	//图片类型
    private static List<String> fileTypes = new ArrayList<String>();


    static {
        fileTypes.add(".jpg");
        fileTypes.add(".jpeg");
        fileTypes.add(".bmp");
        fileTypes.add(".gif");
        fileTypes.add(".png");
    }

    /**
     * 图片上传
     * 
     * @Title upload
     * @param request
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static FileModel upload(HttpServletRequest request) throws IllegalStateException,
            IOException {

        FileModel fileModel = new FileModel();
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession()
                .getServletContext());
        // 图片名称
        String fileName = null;
        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 取得上传文件
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null) {
                    // 取得当前上传文件的文件名称
                    String myFileName = file.getOriginalFilename();
                    // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
                    if (myFileName.trim() != "") {
                        // 获得图片的原始名称
                        String originalFilename = file.getOriginalFilename();
                        // 获得图片后缀名称,如果后缀不为图片格式，则不上传
                        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
                        if (!fileTypes.contains(suffix)) {
                            continue;
                        }

                        //获取当前日期
                        String datePath = DateFormatUtils.format(new Date(),"yyyyMMdd");
                        // 获得上传路径的绝对路径地址 images/20180515
                        String realPath = Config.filePath+File.separator+Config.imagePath+File.separator+datePath;
                        log.info("文件保存路径={}",realPath);
                        // 如果路径不存在，则创建该路径
                        File realPathDirectory = new File(realPath);
                        if (realPathDirectory == null || !realPathDirectory.exists()) {
                            realPathDirectory.mkdirs();
                        }
                        //获取上传后的名字
                        fileName = (int) (System.currentTimeMillis() / 1000) + suffix;
                        File uploadFile = new File(realPathDirectory +File.separator + fileName);
                        log.info(uploadFile.getName());
                        file.transferTo(uploadFile);

                        //保存文件信息
                        fileModel = new FileModel();
                        fileModel.setFileName(fileName);
                        fileModel.setFileUploadName(originalFilename);
                        fileModel.setFileType(suffix);
                        fileModel.setFilePath(datePath +File.separator + fileName);
                        fileModel.setState("0");
                        fileModel.setSystem(true,"999999");
                        try {
                            fileModel = SpringUtil.getBean(FileService.class).insertSelective(fileModel);
                        } catch (Exception e) {
                            e.printStackTrace();
                            log.error("保存文件信息出错");
                        }
                    }
                }
            }
        }
        return fileModel;
    }

    /**
     * ckeditor文件上传功能，回调，传回图片路径，实现预览效果。
     * 
     * @Title ckeditor
     * @param request
     * @param response
     *            文件上传目录：比如upload(无需带前面的/) upload/..
     * @throws IOException
     */
    public static void ckeditor(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        FileModel fileModel = upload(request);
        // 结合ckeditor功能
        // imageContextPath为图片在服务器地址，如upload/123.jpg,非绝对路径
        String imageContextPath = request.getContextPath() + "/" +"file/preview"+ "/" + fileModel.getId();
        response.setContentType("text/html;charset=UTF-8");
        String callback = request.getParameter("CKEditorFuncNum");
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + imageContextPath + "',''" + ")");
        out.println("</script>");
        out.flush();
        out.close();
    }
}

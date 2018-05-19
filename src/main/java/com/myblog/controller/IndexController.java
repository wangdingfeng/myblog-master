package com.myblog.controller;


import com.myblog.entity.FileModel;
import com.myblog.service.FileService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.myblog.common.controller.SuperController;
import com.myblog.entity.MyArticle;
import com.myblog.service.MyArticleService;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * 首页控制器
* @ClassName: IndexController
* @author Gaojun.Zhou
* @date 2016年12月8日 下午8:42:40
*
 */
@Controller
@RequestMapping("/")
public class IndexController extends SuperController{  
	
	@Autowired
	private  MyArticleService myArticleService;
	@Autowired
	FileService fileService;
	
	/**
	 * 跳转主页
	 * @param model
	 * @return
	 */
    @RequestMapping({"","/","index"})  
    public  String index(Model model){
		return "index";
    }
    /**
     * 首页
     * @param model
     * @return
     */
    @RequestMapping("/main/{pageNumber}")  
    public String main(Model model,@PathVariable("pageNumber") Integer pageNumber,@RequestParam(defaultValue="10") Integer pageSize,String search){
		Page<MyArticle> page = getPage(pageNumber, pageSize);
		page.setOrderByField("createTime");
		page.setAsc(false);
		// 查询分页
		EntityWrapper<MyArticle> ew = new EntityWrapper<MyArticle>();
		if(StringUtils.isNotBlank(search)){
			ew.like("articleTitle",search);
		}
		Page<MyArticle> pageData = myArticleService.selectPage(page, ew);
		model.addAttribute("page", pageData);
		return "main";
    }
	@RequestMapping("/test/{id}")
	public void test(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException {
		fileService.selectById(id);
		fileService.preview(id,response);
	}

}

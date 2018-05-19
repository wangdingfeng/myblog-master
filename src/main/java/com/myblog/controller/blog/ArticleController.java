package com.myblog.controller.blog;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.myblog.common.Constants;
import com.myblog.common.bean.Rest;
import com.myblog.common.controller.SuperController;
import com.myblog.entity.DictionaryModel;
import com.myblog.entity.MyArticle;
import com.myblog.entity.SysUser;
import com.myblog.service.DictionaryService;
import com.myblog.service.MyArticleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: wangdingfeng
 * @Date: 2018/5/15 17:30
 * @Description: state 0 :新增 1：发布 ：2 作废
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends SuperController {

    @Autowired
    private MyArticleService myArticleService;
    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping("/list")
    public String list(Model model){
        model.addAttribute("pactive", "博客管理");
        model.addAttribute("chactive", "文章列表");
        return "blog/article-list";
    }

    /**
     * 分页查询 文章
     * @param pageNumber
     * @param pageSize
     * @param search
     * @return
     */

    @RequestMapping("/listJson")
    @ResponseBody
    public Object listJson(Integer pageNumber, @RequestParam(defaultValue="10") Integer pageSize, String search){
        Map<String, Object> reMap = new HashMap<>();

        Page<MyArticle> page = getPage(pageNumber, pageSize);
        // 查询分页
        EntityWrapper<MyArticle> ew = new EntityWrapper<MyArticle>();
        if(StringUtils.isNotBlank(search)){
            ew.like("articleTitle",search);
        }
        //不查询作废的
        ew.in("state",new String[]{Constants.BLOG_STATE_ADD,Constants.BLOG_STATE_PUSH});
        Page<MyArticle> pageData = myArticleService.selectPage(page, ew);
        reMap.put("total", pageData.getTotal());
        reMap.put("rows", pageData.getRecords());
        reMap.put("page", pageData.getSize());

        return reMap;
    }

    /**
     * 添加
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String add(Model model){
        //获取字典 文章类型
        List<DictionaryModel> articleType  = dictionaryService.getAllDictionaryByPath(Constants.DICT_ARTICLE_TYPE);
        model.addAttribute("articleType",articleType);
        return "blog/article-page";
    }
    /**
     * 编辑
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/edit/{id}")
    public String edit(Model model,@PathVariable("id") Integer id){
        //获取字典 文章类型
        List<DictionaryModel> articleType  = dictionaryService.getAllDictionaryByPath(Constants.DICT_ARTICLE_TYPE);
        model.addAttribute("articleType",articleType);

        MyArticle myArticle = myArticleService.selectById(id);
        model.addAttribute("myArticle",myArticle);
        return "blog/article-page";
    }

    /**
     * 查看
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/view/{id}")
    public String view(Model model,@PathVariable("id") Integer id){
        model.addAttribute("pactive", "博客管理");
        model.addAttribute("chactive", "文章列表");
        MyArticle myArticle = myArticleService.selectById(id);
        model.addAttribute("myArticle",myArticle);
        return "blog/article-view";
    }


    /**
     * 保存or更新
     * @param myArticle
     * @param model
     * @return
     */
    @RequestMapping("saveOrUpdate")
    public String saveOrUpdate(MyArticle myArticle, Model model,HttpServletRequest request){
        try {
            SysUser me = (SysUser) request.getAttribute("me");
            myArticle.setOperator(me.getUserName());
            myArticleService.saveOrUpdate(myArticle);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("保存or更新文章失败",e);
            model.addAttribute("myArticle",myArticle);
            model.addAttribute("error","保存失败，请联系管理员");
            return "blog/article-page";
        }
        return redirectTo("/article/list");
    }

    /**
     * 删除文章
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public Object delete(Integer id){
        try {
            MyArticle myArticle = myArticleService.selectById(id);
            myArticle.setState(Constants.BLOG_STATE_DELETE);
            myArticleService.updateById(myArticle);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("删除失败",e);
            return Rest.failure("删除失败,请联系管理员查看日志");
        }
        return Rest.ok();
    }

    /**
     * 发布文章
     * @param id
     * @return
     */
    @RequestMapping("/push")
    @ResponseBody
    public Object push(Integer id){
        try {
            MyArticle myArticle = myArticleService.selectById(id);
            myArticle.setState(Constants.BLOG_STATE_PUSH);
            myArticleService.updateById(myArticle);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("发布失败",e);
            return Rest.failure("发布失败,请联系管理员查看日志");
        }
        return Rest.ok();
    }

}

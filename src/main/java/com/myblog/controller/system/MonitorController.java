package com.myblog.controller.system;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myblog.common.controller.SuperController;
/**
 * 监控
 * @author wangdingfeng
 */
@Controller
@RequestMapping("/system/monitor")
public class MonitorController extends SuperController{  
	
	/**
	 * 系统监控列表
	 */
	@RequiresPermissions("monitorList")
    @RequestMapping("/list")  
    public  String list(Model model){
		return "system/monitor/list";
    } 
}

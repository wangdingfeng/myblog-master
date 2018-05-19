package com.myblog.controller.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.collect.Lists;
import com.myblog.common.anno.Log;
import com.myblog.common.bean.Rest;
import com.myblog.common.controller.SuperController;
import com.myblog.entity.SysRole;
import com.myblog.entity.SysUser;
import com.myblog.entity.SysUserRole;
import com.myblog.service.ISysDeptService;
import com.myblog.service.ISysRoleService;
import com.myblog.service.ISysUserRoleService;
import com.myblog.service.ISysUserService;
/**
 * 用户控制器
 * @author wangdingfeng
 */
@Controller
@RequestMapping("/system/user")
public class UserController extends SuperController{  

	@Autowired private ISysUserService sysUserService;
	@Autowired private ISysRoleService sysRoleService;
	@Autowired private ISysUserRoleService sysUserRoleService;
	@Autowired private ISysDeptService sysDeptService;
	
	
    @RequestMapping("/list")  
    public  String list(Model model){
    	model.addAttribute("pactive", "系统管理");
		model.addAttribute("chactive", "用户管理");
	    return "system/user/list";
    }
	/**
	 * 分页查询用户
	 */
    @RequiresPermissions("listUser")
	@RequestMapping("/listJson")  
    @ResponseBody
	 public  Map<String,Object> listJson(Integer pageNumber,@RequestParam(defaultValue="10") Integer pageSize,String search){
		Map<String, Object> reMap = new HashMap<>();

		Page<Map<Object, Object>> page = getPage(pageNumber, pageSize);
		Page<Map<Object, Object>> pageData = sysUserService.selectUserPage(page, search);
		reMap.put("total", pageData.getTotal());
		reMap.put("rows", pageData.getRecords());
		reMap.put("page", pageData.getSize());

		return reMap;
	    }
	
    /**
     * 新增用户
     */
	@RequiresPermissions("addUser")
    @RequestMapping("/add")  
    public  String add(Model model){
    	model.addAttribute("roleList", sysRoleService.selectList(null));
    	model.addAttribute("deptList", sysDeptService.selectList(null));
		return "system/user/add";
    } 
    
    /**
     * 执行新增
     */
    @Log("创建用户")
    @RequiresPermissions("addUser")
    @RequestMapping("/doAdd")  
    @ResponseBody
    public  Rest doAdd(SysUser user,@RequestParam(value="roleId[]",required=false) String[] roleId){
    	
    	sysUserService.insertUser(user,roleId);
    	return Rest.ok();
    }  
    /**
     * 删除用户
     */
    @Log("删除用户")
    @RequiresPermissions("deleteUser")
    @RequestMapping("/delete")  
    @ResponseBody
    public  Rest delete(String id){
    	sysUserService.delete(id);
    	return Rest.ok();
    }  
    
	/**
	 * 编辑用户
	 */
    @RequestMapping("/edit/{id}")  
    @RequiresPermissions("editUser")
    public  String edit(@PathVariable String id,Model model){
    	SysUser sysUser = sysUserService.selectById(id);
    	
    	List<SysRole> sysRoles = sysRoleService.selectList(null);
    	EntityWrapper<SysUserRole> ew = new EntityWrapper<SysUserRole>();
    	ew.eq("userId ", id);
    	List<SysUserRole> mySysUserRoles = sysUserRoleService.selectList(ew);
    	List<String> myRolds = Lists.transform(mySysUserRoles, input -> input.getRoleId());
    	
    	model.addAttribute("sysUser",sysUser);
    	model.addAttribute("sysRoles",sysRoles);
    	model.addAttribute("myRolds",myRolds);
    	model.addAttribute("deptList", sysDeptService.selectList(null));
    	return "system/user/edit";
    } 
    /**
     * 执行编辑
     */
    @Log("编辑用户")
    @RequiresPermissions("editUser")
    @RequestMapping("/doEdit")  
    @ResponseBody
    public  Rest doEdit(SysUser sysUser,@RequestParam(value="roleId[]",required=false) String[] roleId,Model model){
    	sysUserService.updateUser(sysUser,roleId);
    	return Rest.ok();
    } 
    
    /**
     * 验证用户名是否已存在
     */
    @RequestMapping("/checkName")  
    @ResponseBody
    public Rest checkName(String userName){
    	List<SysUser> list = sysUserService.selectList(new EntityWrapper<SysUser>().eq("userName", userName));
    	if(list.size() > 0){
    		return Rest.failure("用户名已存在");
    	}
    	return Rest.ok();
    }
    
}

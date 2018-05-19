package com.myblog.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.myblog.entity.SysMenu;
import com.myblog.entity.vo.TreeMenu;
import com.myblog.entity.vo.TreeMenuAllowAccess;

/**
 *
 * SysMenu 表数据服务层接口
 *
 */
public interface ISysMenuService extends IService<SysMenu> {

	/**
	 * 获取指定用户拥有的菜单
	 */
	List<String> selectMenuIdsByuserId(String uid);
	/**
	 * 获取指定用户的菜单
	 * @param  menuIds 当前用户所在角色拥有的权限ID集合
	 * @param  pid 菜单父ID
	 */
	List<TreeMenu> selectTreeMenuByMenuIdsAndPid(List<String> menuIds, String pid);
	/**
	 * 获取当前用户的菜单
	 */
	List<TreeMenu> selectTreeMenuByUserId(String uid);
	/**
	 * 获取指定用户拥有权限
	 * @param  menuIds 该角色拥有的权限ID集合
	 * @param  pid 菜单父ID
	 */
	List<TreeMenuAllowAccess> selectTreeMenuAllowAccessByMenuIdsAndPid(List<String> menuIds, String pid);

}
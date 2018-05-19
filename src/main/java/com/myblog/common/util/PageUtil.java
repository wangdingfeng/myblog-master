package com.myblog.common.util;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 分页工具类
 * @param <T>
 * @author wangdingfeng
 */
public class PageUtil<T> implements Serializable {
	
	private int total;//总页数
    private int page; //当前页
    private int pageSize; //每页多少条
    private static final long serialVersionUID = 1L;
    private List<T>  rows= Collections.emptyList();
    private Map<String, Object> condition;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Map<String, Object> getCondition() {
        return condition;
    }

    public void setCondition(Map<String, Object> condition) {
        this.condition = condition;
    }

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}
    
}


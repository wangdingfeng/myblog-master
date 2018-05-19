package com.myblog.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import org.springframework.format.annotation.DateTimeFormat;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName("my_article")
public class MyArticle extends Model<MyArticle> {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -76131747258866315L;
	

	@TableId(type = IdType.AUTO)
	private Integer id;
	
	@TableField(value = "article_title")
    private String articleTitle;
	
	@TableField(value = "article_content")
    private String articleContent;
	/**
	 * 文章类型
	 */
	@TableField(value = "article_type")
    private String articleType;
	/**
	 * 是否原创
	 */
	@TableField(value = "article_is_original")
    private String articleIsOriginal;
	/**
	 * 文章封面图
	 */
	@TableField(value = "article_img")
    private String articleImg;
	/**
	 * 文章点击数
	 */
	@TableField(value = "article_onclick")
    private Integer articleOnclick;

    private Integer version;

    private String state;
	@TableField(value = "create_time")
    private Date createTime;

    private String creator;

	@TableField(value = "modify_time")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date modifyTime;

    private String operator;

    private String remark;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getArticleTitle() {
		return articleTitle;
	}




	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}




	public String getArticleContent() {
		return articleContent;
	}




	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}




	public String getArticleType() {
		return articleType;
	}




	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}




	public String getArticleIsOriginal() {
		return articleIsOriginal;
	}




	public void setArticleIsOriginal(String articleIsOriginal) {
		this.articleIsOriginal = articleIsOriginal;
	}




	public String getArticleImg() {
		return articleImg;
	}




	public void setArticleImg(String articleImg) {
		this.articleImg = articleImg;
	}




	public Integer getArticleOnclick() {
		return articleOnclick;
	}




	public void setArticleOnclick(Integer articleOnclick) {
		this.articleOnclick = articleOnclick;
	}




	public Integer getVersion() {
		return version;
	}




	public void setVersion(Integer version) {
		this.version = version;
	}




	public String getState() {
		return state;
	}




	public void setState(String state) {
		this.state = state;
	}




	public Date getCreateTime() {
		return createTime;
	}




	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}




	public String getCreator() {
		return creator;
	}




	public void setCreator(String creator) {
		this.creator = creator;
	}




	public Date getModifyTime() {
		return modifyTime;
	}




	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}




	public String getOperator() {
		return operator;
	}




	public void setOperator(String operator) {
		this.operator = operator;
	}




	public String getRemark() {
		return remark;
	}




	public void setRemark(String remark) {
		this.remark = remark;
	}


	public void setSystem(boolean isAdd,String operator){
		this.setOperator(operator);
		if(isAdd){
			this.setCreateTime(new Date());
			this.setModifyTime(new Date());
			this.setCreator(operator);
			this.setVersion(1);
		}else{
			this.setModifyTime(new Date());
		}
	}

	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return this.id;
	}

}

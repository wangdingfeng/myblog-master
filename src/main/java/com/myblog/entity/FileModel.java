package com.myblog.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * @Auther: wangdingfeng
 * @Date: 2018/5/16 10:20
 * @Description: 文件信息
 */
@TableName("ts_file")
public class FileModel extends Model<FileModel> {


    @TableId(type =IdType.AUTO)
    private Integer id;

    @TableField("file_name")
    private String fileName;

    @TableField("file_upload_name")
    private String fileUploadName;

    @TableField("file_type")
    private String fileType;

    @TableField("file_path")
    private String filePath;

    private Integer version;

    private String state;

    @TableField("create_time")
    private Date createTime;

    private String creator;

    @TableField("modify_time")
    private Date modifyTime;

    private String operator;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileUploadName() {
        return fileUploadName;
    }

    public void setFileUploadName(String fileUploadName) {
        this.fileUploadName = fileUploadName;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
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
        return this.id;
    }
}

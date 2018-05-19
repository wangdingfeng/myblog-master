package com.myblog.common.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 全局静态配置
 * @author wangdingfeng
 */
public class Config {

	private static Logger log = LoggerFactory.getLogger(Config.class);

	public static final String SSO_ENCODING = "UTF-8";
	/**
	 *文件路径
	 */
	public final static String filePath ;
	/**
	 * 图片路径
	 */
	public final static String imagePath = "images" ;

	static {
		// 初始化配置信息
		InputStream is = null;
		Properties prop = new Properties();
		try {
			is = Config.class.getResourceAsStream("/properties/config.properties");
			prop.load(is);
		} catch (IOException e) {
			log.error("系统错误！",e);
		}finally{
			if(is!=null){
				try {
					is.close();
				} catch (IOException e) {
					log.error("系统错误！",e);
				}
			}
		}
		filePath = prop.getProperty("file-path");
	}
}
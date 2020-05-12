package com.ck.utils;

import java.util.UUID;

public class UUIDUtils {
	/**
	 * 随机生成id
	 * @return
	 */
	public static String getId(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase().substring(0, 8);
	}
	
	
	public static String getR_id(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase().substring(0, 6);
	}
	/**
	 * 生成随机码
	 * @return
	 */
	public static String getCode(){
		return getId();
	}
	
	public static void main(String[] args) {
		System.out.println(getId());
		System.out.println(getCode());
	}
}

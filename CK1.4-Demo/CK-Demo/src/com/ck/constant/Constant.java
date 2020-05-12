package com.ck.constant;

//接口默认public static final
public interface Constant {

	//用户未激活
	int USER_IS_NOT_ACTIVE = 0;
	//用户已激活
	int USER_IS_ACTIVE = 1;
	
	
	//卡牌被兑换
	int CARD_IS_ACTIVE = 1;
	//用户已激活
	int CARD_IS_NOT_ACTIVE = 0;
	
	
	//ok代表勾选记住密码
	String SAVE_NAME = "ok";
	
	/**
	 * 商品未下架 0
	 * 商品下架 1
	 */
	int SHOP_NO_FLAG = 0;
	int SHOP_FLAG = 1;
	
	/**
	 * 商品热门 1
	 */
	int SHOP_HOT = 1;
	
	
	
	/**
	 * 未付款0
	 */
	int ORDER_WEIFUKUAN = 0;
	
	/**
	 * 已付款1
	 */
	int ORDER_YIFUKUAN = 1;
	
	/**
	 * 已经发货2
	 */
	int ORDER_YIFAHUO = 2;
	
	/**
	 * 已经完成3
	 */
	int ORDER_YIWANCHENG = 3;
}

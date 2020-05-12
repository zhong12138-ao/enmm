package com.ck.pojo;

import java.text.DecimalFormat;


import org.springframework.stereotype.Component;

@Component
public class User_card {
	private int id;
	private String user_id;
	private int card_id;
	private String card_name;
	private String card_star;
	private String card_image;
	private int card_level;
	
	public int getCard_StarInt() {
		return Integer.parseInt(card_star); 
	}
	
	public int getCard_level() {
		return card_level;
	}
	public void setCard_level(int card_level) {
		this.card_level = card_level;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCard_id() {
		return card_id;
	}
	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getCard_star() {
		return card_star;
	}
	public void setCard_star(String card_star) {
		this.card_star = card_star;
	}
	public String getCard_image() {
		return card_image;
	}
	public void setCard_image(String card_image) {
		this.card_image = card_image;
	}
	
	
	
}

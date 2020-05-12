package com.ck.pojo;

import org.springframework.stereotype.Component;

@Component
public class User_piece {
	private int id;
	private String user_id;
	private int fragment_id;
	private String fragment_name;
	private int fragment_num;
	private String fragment_image;
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
	public int getFragment_id() {
		return fragment_id;
	}
	public void setFragment_id(int fragment_id) {
		this.fragment_id = fragment_id;
	}
	public String getFragment_name() {
		return fragment_name;
	}
	public void setFragment_name(String fragment_name) {
		this.fragment_name = fragment_name;
	}
	public int getFragment_num() {
		return fragment_num;
	}
	public void setFragment_num(int fragment_num) {
		this.fragment_num = fragment_num;
	}
	public String getFragment_image() {
		return fragment_image;
	}
	public void setFragment_image(String fragment_image) {
		this.fragment_image = fragment_image;
	}
	
}

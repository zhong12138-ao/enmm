package com.ck.pojo;

import org.springframework.stereotype.Component;

@Component
public class Card_piece {
	private int id;
	private int fragment_id;
	private String fragment_name;
	private String fragment_image;
	private int state;
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getFragment_image() {
		return fragment_image;
	}
	public void setFragment_image(String fragment_image) {
		this.fragment_image = fragment_image;
	}
	
}

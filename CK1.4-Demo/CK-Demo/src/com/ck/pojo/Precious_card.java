package com.ck.pojo;

import org.springframework.stereotype.Component;

@Component
public class Precious_card {
	private int id;
	private int card_id;
	private String card_name;
	private String card_image;
	private int card1_id;
	private int card2_id;
	private int card3_id;
	private String card1_image;
	private String card2_image;
	private String card3_image;
	private int state;
	private String text;
	
	
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getCard1_image() {
		return card1_image;
	}
	public void setCard1_image(String card1_image) {
		this.card1_image = card1_image;
	}
	public String getCard2_image() {
		return card2_image;
	}
	public void setCard2_image(String card2_image) {
		this.card2_image = card2_image;
	}
	public String getCard3_image() {
		return card3_image;
	}
	public void setCard3_image(String card3_image) {
		this.card3_image = card3_image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getCard_image() {
		return card_image;
	}
	public void setCard_image(String card_image) {
		this.card_image = card_image;
	}
	public int getCard1_id() {
		return card1_id;
	}
	public void setCard1_id(int card1_id) {
		this.card1_id = card1_id;
	}
	public int getCard2_id() {
		return card2_id;
	}
	public void setCard2_id(int card2_id) {
		this.card2_id = card2_id;
	}
	public int getCard3_id() {
		return card3_id;
	}
	public void setCard3_id(int card3_id) {
		this.card3_id = card3_id;
	}
	
}

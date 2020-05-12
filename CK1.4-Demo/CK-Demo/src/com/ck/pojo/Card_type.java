package com.ck.pojo;

import org.springframework.stereotype.Component;

@Component
public class Card_type {
	private int id;
	private int type;
	private int card_id;
	private String generals_name;			//武将名称
	private String generals_image;
	private String generals_star;			//武将星级
	private double generals_attack;				//武将攻击
	private double generals_defense;				//武将防御
	private double generals_strategy;			//武将谋略
	private double generals_siege;				//武将攻城
	private double generals_speed;				//武将速度
	private String generals_points;				//武将等级
	private String generals_troop;              //武将军种
	private String generals_skill;              //武将技能
	private double blood;
	private double hurt;
	
	
	
	public double getBlood() {
		return blood=1000*Double.parseDouble(this.generals_star)+(this.generals_defense*50);
	}
	public void setBlood(double blood) {
		this.blood = blood;
	}
	public double getHurt() {
		return hurt=(this.generals_attack+this.generals_strategy)*Double.parseDouble(this.generals_star);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getCard_id() {
		return card_id;
	}
	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}
	public String getGenerals_name() {
		return generals_name;
	}
	public void setGenerals_name(String generals_name) {
		this.generals_name = generals_name;
	}
	public String getGenerals_image() {
		return generals_image;
	}
	public void setGenerals_image(String generals_image) {
		this.generals_image = generals_image;
	}
	public String getGenerals_star() {
		return generals_star;
	}
	public void setGenerals_star(String generals_star) {
		this.generals_star = generals_star;
	}
	public double getGenerals_attack() {
		return generals_attack;
	}
	public void setGenerals_attack(double generals_attack) {
		this.generals_attack = generals_attack;
	}
	public double getGenerals_defense() {
		return generals_defense;
	}
	public void setGenerals_defense(double generals_defense) {
		this.generals_defense = generals_defense;
	}
	public double getGenerals_strategy() {
		return generals_strategy;
	}
	public void setGenerals_strategy(double generals_strategy) {
		this.generals_strategy = generals_strategy;
	}
	public double getGenerals_siege() {
		return generals_siege;
	}
	public void setGenerals_siege(double generals_siege) {
		this.generals_siege = generals_siege;
	}
	public double getGenerals_speed() {
		return generals_speed;
	}
	public void setGenerals_speed(double generals_speed) {
		this.generals_speed = generals_speed;
	}
	public String getGenerals_points() {
		return generals_points;
	}
	public void setGenerals_points(String generals_points) {
		this.generals_points = generals_points;
	}
	public String getGenerals_troop() {
		return generals_troop;
	}
	public void setGenerals_troop(String generals_troop) {
		this.generals_troop = generals_troop;
	}
	public void setHurt(double hurt) {
		this.hurt = hurt;
	}
	public String getGenerals_skill() {
		return generals_skill;
	}
	public void setGenerals_skill(String generals_skill) {
		this.generals_skill = generals_skill;
	}
	
}

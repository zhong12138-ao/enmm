package com.ck.pojo;

import org.springframework.stereotype.Component;

@Component
public class Game_skill {
	private int id;
	private int skill_id;
	private String skill_name;
	private String skill_msg;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(int skill_id) {
		this.skill_id = skill_id;
	}
	public String getSkill_name() {
		return skill_name;
	}
	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}
	public String getSkill_msg() {
		return skill_msg;
	}
	public void setSkill_msg(String skill_msg) {
		this.skill_msg = skill_msg;
	}
	
}

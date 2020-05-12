package com.ck.pojo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class User {
	private String user_id;
	private String user_name;
	private String user_password;
	private int user_money;		//虎符,用户的钱
	private int user_points;	//战法经验,可以用于升级武将的技�?
	private int user_level;
	private String user_image;
	private int user_cardNum;
	private int c_times;		//抽取次数,抽五次可以必得一个四至五星武�?
	private int state;
	private String code;
	private String email;
	private int dice_point;
	private int login_day;
	private Date last_signin_time;
	private int user_exp;
	private int sign_state;
	
	
	public int getSign_state() {
		return sign_state;
	}
	public void setSign_state(int sign_state) {
		this.sign_state = sign_state;
	}
	public int getUser_exp() {
		return user_exp;
	}
	public void setUser_exp(int user_exp) {
		this.user_exp = user_exp;
	}
	public Date getLast_signin_time() {
		return last_signin_time;
	}
	public void setLast_signin_time(Date last_signin_time) {
		this.last_signin_time = last_signin_time;
	}
	public int getLogin_day() {
		return login_day;
	}
	public void setLogin_day(int login_day) {
		this.login_day = login_day;
	}
	public int getDice_point() {
		return dice_point;
	}
	public void setDice_point(int dice_point) {
		this.dice_point = dice_point;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public int getUser_money() {
		return user_money;
	}
	public void setUser_money(int user_money) {
		this.user_money = user_money;
	}
	public int getUser_points() {
		return user_points;
	}
	public void setUser_points(int user_points) {
		this.user_points = user_points;
	}
	public int getUser_level() {
		return user_level;
	}
	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public int getUser_cardNum() {
		return user_cardNum;
	}
	public void setUser_cardNum(int user_cardNum) {
		this.user_cardNum = user_cardNum;
	}
	public int getC_times() {
		return c_times;
	}
	public void setC_times(int c_times) {
		this.c_times = c_times;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
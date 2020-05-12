package com.ck.pojo;

import java.text.DecimalFormat;


import org.springframework.stereotype.Component;

@Component
public class Game_mode{
	private String Name;
	private String Image;
	private double damage=0;  //造成的最终伤�?
	private double Hurt;
	private double Health;
	private int Level=1;
	private double Speed;
	private double Defense;
	private int Reward_hufu;
	private int Reward_zhanling;
	private int Rank=2;
	private int Round=1;
	private String skill1Name;
	private String skill2Name;
	private String skill3Name;
	private int skill1ID=0;  //�?能唯�?标识
	private int skill2ID=0;
	private int skill3ID=0;
	private int skill1State=0; //�?�?1状�?�，控制能否使用�?1可用�?0不可用；2本回合使用；3生效�?
	private int skill2State=0;
	private int skill3State=0;
	private int skill1Time;  //�?�?1冷却时间，控制释放，0无冷却，n为冷却回�?
	private int skill2Time;
	private int skill3Time;
	private int skill1DTime=1;  //�?�?1持续时间，控制释放时间，默认生效�?回合
	private int skill2DTime=1;
	private int skill3DTime=1;
	private double temp1=0;
	private double temp2=0;
	
	//控制伤害精度
	DecimalFormat df = new DecimalFormat( "0.0 ");

	
	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public double getDamage() {
		return Double.parseDouble(df.format(damage));
	}

	public void setDamage(double damage) {
		this.damage = damage;
	}

	public double getHurt() {
		return Double.parseDouble(df.format(Hurt));
	}

	public void setHurt(double hurt) {
		Hurt = hurt;
	}

	public double getHealth() {
		return Double.parseDouble(df.format(Health));
	}

	public void setHealth(double health) {
		Health = health;
	}

	

	public int getLevel() {
		return Level;
	}

	public void setLevel(int level) {
		Level = level;
	}

	public double getSpeed() {
		return Double.parseDouble(df.format(Speed));
	}

	public void setSpeed(double speed) {
		Speed = speed;
	}

	public double getDefense() {
		return Double.parseDouble(df.format(Defense));
	}

	public void setDefense(double defense) {
		Defense = defense;
	}
	
	public int getReward_hufu() {
		return Reward_hufu;
	}

	public void setReward_hufu(int reward_hufu) {
		Reward_hufu = reward_hufu;
	}

	public int getReward_zhanling() {
		return Reward_zhanling;
	}

	public void setReward_zhanling(int reward_zhanling) {
		Reward_zhanling = reward_zhanling;
	}

	public int getRank() {
		return Rank;
	}

	public void setRank(int rank) {
		Rank = rank;
	}

	public int getRound() {
		return Round;
	}

	public void setRound(int round) {
		Round = round;
	}

	public String getSkill1Name() {
		return skill1Name;
	}

	public void setSkill1Name(String skill1Name) {
		this.skill1Name = skill1Name;
	}

	public String getSkill2Name() {
		return skill2Name;
	}

	public void setSkill2Name(String skill2Name) {
		this.skill2Name = skill2Name;
	}

	public String getSkill3Name() {
		return skill3Name;
	}

	public void setSkill3Name(String skill3Name) {
		this.skill3Name = skill3Name;
	}

	public int getSkill1ID() {
		return skill1ID;
	}

	public void setSkill1ID(int skill1id) {
		skill1ID = skill1id;
	}

	public int getSkill2ID() {
		return skill2ID;
	}

	public void setSkill2ID(int skill2id) {
		skill2ID = skill2id;
	}

	public int getSkill3ID() {
		return skill3ID;
	}

	public void setSkill3ID(int skill3id) {
		skill3ID = skill3id;
	}

	public int getSkill1State() {
		return skill1State;
	}

	public void setSkill1State(int skill1State) {
		this.skill1State = skill1State;
	}

	public int getSkill2State() {
		return skill2State;
	}

	public void setSkill2State(int skill2State) {
		this.skill2State = skill2State;
	}

	public int getSkill3State() {
		return skill3State;
	}

	public void setSkill3State(int skill3State) {
		this.skill3State = skill3State;
	}

	public int getSkill1Time() {
		return skill1Time;
	}

	public void setSkill1Time(int skill1Time) {
		this.skill1Time = skill1Time;
	}

	public int getSkill2Time() {
		return skill2Time;
	}

	public void setSkill2Time(int skill2Time) {
		this.skill2Time = skill2Time;
	}

	public int getSkill3Time() {
		return skill3Time;
	}

	public void setSkill3Time(int skill3Time) {
		this.skill3Time = skill3Time;
	}

	public int getSkill1DTime() {
		return skill1DTime;
	}

	public void setSkill1DTime(int skill1dTime) {
		skill1DTime = skill1dTime;
	}

	public int getSkill2DTime() {
		return skill2DTime;
	}

	public void setSkill2DTime(int skill2dTime) {
		skill2DTime = skill2dTime;
	}

	public int getSkill3DTime() {
		return skill3DTime;
	}

	public void setSkill3DTime(int skill3dTime) {
		skill3DTime = skill3dTime;
	}

	public double getTemp1() {
		return Double.parseDouble(df.format(temp1));
	}

	public void setTemp1(double temp1) {
		this.temp1 = temp1;
	}

	public double getTemp2() {
		return Double.parseDouble(df.format(temp2));
	}

	public void setTemp2(double temp2) {
		this.temp2 = temp2;
	}

	public DecimalFormat getDf() {
		return df;
	}

	public void setDf(DecimalFormat df) {
		this.df = df;
	} 
	
	
	
}

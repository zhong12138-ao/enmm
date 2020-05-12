package com.ck.controller;

import java.sql.SQLException;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ck.pojo.Card_type;
import com.ck.pojo.Game_mode;
import com.ck.pojo.User;
import com.ck.pojo.User_card;
import com.ck.service.CardService;
import com.ck.service.GameService;
import com.ck.service.UserService;

@RequestMapping(value = "/game")
@Controller
public class GameController {
	@Autowired
	private GameService gameService;
	@Autowired
	private CardService cardService;
	@Autowired
	private UserService userService;

	// 进入武将世界
	@RequestMapping(value = "/toGameAllCard0", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toGameAllCard0(ModelAndView mv, HttpServletRequest request) {
		List<String> img = new ArrayList<String>();
		try {
			for (int i = 0; i < 6; i++) {
				String img1 = gameService.getOneCCByRank(5).getGenerals_image();
				img.add(img1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("img", img);
		mv.setViewName("game_allCard0");
		return mv;
	}

	// 1.初始化游戏数据，进入游戏1页面
	@RequestMapping(value = "/toGameModeOne", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toGameModeOne(ModelAndView mv, HttpServletRequest request) {
		// 游戏1
		Game_mode gm1 = new Game_mode();
		Game_mode cp1 = new Game_mode();
		try {
			// 获取用户选择卡，并存入session
			Map<String, String[]> map = new HashMap<String, String[]>();
			map = request.getParameterMap();
			int id = Integer.parseInt(request.getParameter("g1choose"));
			String str[] = (String[]) map.get("g1skills");
			int skill1 = Integer.parseInt(str[0]);
			int skill2 = Integer.parseInt(str[1]);
			int skill3 = Integer.parseInt(str[2]);

			// 获取技能，存入
			getUserSkills(gm1, skill1, 1);
			getUserSkills(gm1, skill2, 2);
			getUserSkills(gm1, skill3, 3);
			gm1 = getGm(id, gm1);
			// 获取电脑卡
			cp1 = getComputerCard(gm1,cp1);
			request.getSession().setAttribute("gm1", gm1);
			request.getSession().setAttribute("cp1", cp1);
			String msg = "<xitong>【系统】</xitong>点击确定开始本场战斗，下方展示战斗详情。每通过一关主公将会获得虎符和战令点奖励。主公，向着人中吕布的目标前进吧！";
			mv.addObject("msg", msg);
			mv.addObject("gm1", gm1);
			mv.setViewName("game_mode_1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "战斗发生错误");
			mv.setViewName("game_mode_1");
			;
		}
		return mv;
	}

	// 获取武将属性
	public Game_mode getGm(int id, Game_mode gm1) throws Exception {
		User_card uc = cardService.getCardlevel(id);
		Card_type player = cardService.getTC_one(uc.getCard_id());
		// 五星武将的属性计算方式
		if (uc.getCard_star().equals("5")) {
			int level = uc.getCard_level();
			gm1.setHurt((player.getGenerals_attack() + (level * 2.5) + player.getGenerals_strategy() + (level * 2.5))
					* (Double.parseDouble(player.getGenerals_star())));
			gm1.setHealth(1000 * (Double.parseDouble(player.getGenerals_star()))
					+ ((player.getGenerals_siege() + level * 1.0) * 10)
					+ ((player.getGenerals_defense() + (level * 3.0)) * 20));
			gm1.setSpeed(player.getGenerals_speed() + (level * 3.0));
			gm1.setDefense(player.getGenerals_defense() + (level * 3.0));
			gm1.setName(player.getGenerals_name());
			gm1.setImage(player.getGenerals_image());
			gm1.setLevel(uc.getCard_level());
		}
		if (uc.getCard_star().equals("4")) {
			int level = uc.getCard_level();
			gm1.setHurt((player.getGenerals_attack() + (level * 2.0) + player.getGenerals_strategy() + (level * 2.0))
					* (Double.parseDouble(player.getGenerals_star())));
			gm1.setHealth(1000 * (Double.parseDouble(player.getGenerals_star()))
					+ ((player.getGenerals_siege() + level * 1.0) * 10)
					+ ((player.getGenerals_defense() + (level * 2.5)) * 20));
			gm1.setSpeed(player.getGenerals_speed() + (level * 2.5));
			gm1.setDefense(player.getGenerals_defense() + (level * 2.5));
			gm1.setName(player.getGenerals_name());
			gm1.setImage(player.getGenerals_image());
			gm1.setLevel(uc.getCard_level());
		}
		if (uc.getCard_star().equals("3")) {
			int level = uc.getCard_level();
			gm1.setHurt((player.getGenerals_attack() + (level * 1.5) + player.getGenerals_strategy() + (level * 1.5))
					* (Double.parseDouble(player.getGenerals_star())));
			gm1.setHealth(1000 * (Double.parseDouble(player.getGenerals_star()))
					+ ((player.getGenerals_siege() + level * 0.5) * 10)
					+ ((player.getGenerals_defense() + (level * 2.0)) * 20));
			gm1.setSpeed(player.getGenerals_speed() + (level * 2.0));
			gm1.setDefense(player.getGenerals_defense() + (level * 2.0));
			gm1.setName(player.getGenerals_name());
			gm1.setImage(player.getGenerals_image());
			gm1.setLevel(uc.getCard_level());
		}
		if (uc.getCard_star().equals("2")) {
			int level = uc.getCard_level();
			gm1.setHurt((player.getGenerals_attack() + (level * 1.0) + player.getGenerals_strategy() + (level * 1.0))
					* (Double.parseDouble(player.getGenerals_star())));
			gm1.setHealth(1000 * (Double.parseDouble(player.getGenerals_star()))
					+ ((player.getGenerals_siege() + level * 0.5) * 10)
					+ ((player.getGenerals_defense() + (level * 1.5)) * 20));
			gm1.setSpeed(player.getGenerals_speed() + (level * 1.0));
			gm1.setDefense(player.getGenerals_defense() + (level * 1.5));
			gm1.setName(player.getGenerals_name());
			gm1.setImage(player.getGenerals_image());
			gm1.setLevel(uc.getCard_level());
		}
		return gm1;

	}

	// 3.随机获取电脑卡牌，并存入
	public Game_mode getComputerCard(Game_mode gm1,Game_mode cp1) {
		Card_type ct = new Card_type();
		try {
			// 根据难度挑选相应星级的电脑卡牌
			if(gm1.getRank()==6) {
				int level = gm1.getLevel();
				ct = gameService.getOneCCByRank(5);
				cp1.setHurt((ct.getGenerals_attack()+ (level * 2.5) + ct.getGenerals_strategy()+ (level * 2.5))
						* (Double.parseDouble(ct.getGenerals_star())));
				cp1.setHealth(1000 * (Double.parseDouble(ct.getGenerals_star())) 
						+ ((ct.getGenerals_siege()+ level * 1.0) * 10)
						+ ((ct.getGenerals_defense()+level * 3.0)* 20));
				cp1.setSpeed(ct.getGenerals_speed()+ (level * 3.0));
				cp1.setName(ct.getGenerals_name());
				cp1.setImage(ct.getGenerals_image());
				cp1.setDefense(ct.getGenerals_defense()+ (level * 3.0));
				cp1.setLevel(level);
			}else {
			ct = gameService.getOneCCByRank(gm1.getRank());
			cp1.setHurt((ct.getGenerals_attack() + ct.getGenerals_strategy())
					* (Double.parseDouble(ct.getGenerals_star())));
			cp1.setHealth(1000 * (Double.parseDouble(ct.getGenerals_star())) + (ct.getGenerals_siege() * 10)
					+ (ct.getGenerals_defense() * 20));
			cp1.setSpeed(ct.getGenerals_speed());
			cp1.setName(ct.getGenerals_name());
			cp1.setImage(ct.getGenerals_image());
			cp1.setDefense(ct.getGenerals_defense());
			}
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
		return cp1;
	}

	// 2.通过数值获取用户选择技能，存入
	public void getUserSkills(Game_mode gm1, int num1, int num2) {
		// num1传入用户选的技能ID num2传入用来辨识给哪个技能赋值

		String skillName = "";
		int skillTime = 0;
		int skillDtime = 1;

		try {

			if (num1 == 1) {
				skillName = "怒火";
				skillTime = 10;
				skillDtime = 5;
			}
			if (num1 == 2) {
				skillName = "看破";
				skillTime = 5;
				skillDtime = 1;
			}
			if (num1 == 3) {
				skillName = "急行";
				skillTime = 3;
				skillDtime = 1;
			}
			if (num1 == 4) {
				skillName = "神医";
				skillTime = 2;
				skillDtime = 1;
			}
			if (num1 == 5) {
				skillName = "浴血";
				skillTime = 15;
				skillDtime = 3;
			}
			if (num1 == 6) {
				skillName = "影杀";
				skillTime = 3;
				skillDtime = 1;
			}
			if (num1 == 7) {
				skillName = "运气";
				skillTime = 0;
				skillDtime = 1;
			}
			if (num1 == 8) {
				skillName = "穿刺";
				skillTime = 3;
				skillDtime = 1;
			}
			if (num1 == 9) {
				skillName = "饮血";
				skillTime = 5;
				skillDtime = 1;
			}
			if (num1 == 10) {
				skillName = "格挡";
				skillTime = 5;
				skillDtime = 1;
			}

			if (num2 == 1) {
				if (num1 == 0) {
					gm1.setSkill1ID(num1);
					gm1.setSkill1DTime(1);
					gm1.setSkill1Time(999999);
					gm1.setSkill1Name("无");
					gm1.setSkill1State(0);
				} else {
					gm1.setSkill1ID(num1);
					gm1.setSkill1DTime(skillDtime);
					gm1.setSkill1Time(skillTime);
					gm1.setSkill1Name(skillName);
					gm1.setSkill1State(1);
				}
			}
			if (num2 == 2) {
				if (num1 == 0) {
					gm1.setSkill2ID(num1);
					gm1.setSkill2DTime(1);
					gm1.setSkill2Time(999999);
					gm1.setSkill2Name("无");
					gm1.setSkill2State(0);
				} else {
					gm1.setSkill2ID(num1);
					gm1.setSkill2DTime(skillDtime);
					gm1.setSkill2Time(skillTime);
					gm1.setSkill2Name(skillName);
					gm1.setSkill2State(1);
				}
			}
			if (num2 == 3) {
				if (num1 == 0) {
					gm1.setSkill3ID(num1);
					gm1.setSkill3DTime(1);
					gm1.setSkill3Time(999999);
					gm1.setSkill3Name("无");
					gm1.setSkill3State(0);
				} else {
					gm1.setSkill3ID(num1);
					gm1.setSkill3DTime(skillDtime);
					gm1.setSkill3Time(skillTime);
					gm1.setSkill3Name(skillName);
					gm1.setSkill3State(1);
				}
			}
		} catch (Exception e) {
		}
	}

	// 前台确定，后台进行一回合的判定

	// 4.确定进行一回合判定
	@RequestMapping(value = "/tobalance", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView tobalance(String[] g1UseSk, ModelAndView mv, HttpServletRequest request) {
		Game_mode gm1 = (Game_mode) request.getSession().getAttribute("gm1");
		Game_mode cp1 = (Game_mode) request.getSession().getAttribute("cp1");
		List<String> msg = new ArrayList<>();
		try {
			// 获取用户使用技能
			int skill1 = Integer.parseInt(g1UseSk[0]);
			int skill2 = Integer.parseInt(g1UseSk[1]);
			int skill3 = Integer.parseInt(g1UseSk[2]);

			if (cp1.getHealth() > 0) {

				// 更改技能状态
				if (skill1 == 1) {
					gm1.setSkill1State(2);
				}
				if (skill2 == 1) {
					gm1.setSkill2State(2);
				}
				if (skill3 == 1) {
					gm1.setSkill3State(2);
				}

				// 回合增加
				gm1.setRound(gm1.getRound() + 1);
				// 电脑难度增加
				if (gm1.getRound() > 15) {
					gm1.setRank(3);
				}
				if (gm1.getRound() > 25) {
					gm1.setRank(4);
				}
				if (gm1.getRound() > 35) {
					gm1.setRank(5);
				}
				if (gm1.getRound() > 55) {
					gm1.setRank(6);
				}
				// 伤害计算
				balanceDetail(gm1, cp1, msg);

			} else {
				// 电脑血量为零，换下一个
				// 每击败一个对手，获得虎符和战令
				gm1.setReward_hufu(gm1.getReward_hufu() + gm1.getRank() * 5);
				gm1.setReward_zhanling(gm1.getReward_zhanling() + gm1.getRank() * 3);
				// 根据回合数获取下一个对手
				getComputerCard(gm1,cp1);
			}

			request.getSession().setAttribute("gm1", gm1);
			request.getSession().setAttribute("cp1", cp1);
			mv.addObject("msg", msg);
			mv.addObject("gm1", gm1);
			mv.addObject("cp1", cp1);
			mv.setViewName("game_mode_1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "出错");
			mv.setViewName("game_mode_1");
		}
		return mv;
	}

	// 技能状态改变(暂时未用)

	// 7.技能生效
	public void skillAttack(List<String> msg, int num, int skillID, Game_mode gm1, Game_mode cp1) {
		String str = "";
		// 控制伤害精度
		DecimalFormat df = new DecimalFormat("0.0 ");

		if (skillID == 1) {
			// 破敌
			str = "<jineng>【技能】</jineng>技能[破敌]提高【" + gm1.getName() + "】的攻击力（" + gm1.getHurt() + "）至原本的150%（"
					+ (Double.parseDouble(df.format((gm1.getHurt() * 1.5)))) + "）。<br>";
			gm1.setHurt(Double.parseDouble(df.format((gm1.getHurt() * 1.5))));
			msg.add(str);
		}

		if (skillID == 5) {
			// 浴血
			str = "<jineng>【技能】</jineng>技能[浴血]使得【" + gm1.getName() + "】进入无敌状态！（持续三回合）<br>";
			msg.add(str);
			gm1.setDefense(gm1.getDefense() + 100000);
		}

		if (skillID == 8) {
			// 穿刺
			str = "<jineng>【技能】</jineng>技能[穿刺]使得【" + gm1.getName() + "】本回合攻击无视【" + cp1.getName() + "】的护甲！<br>";
			msg.add(str);
			cp1.setTemp1(cp1.getDefense());
			cp1.setDefense(0);
		}

		if (skillID == 10) {
			// 护盾
			str = "<jineng>【技能】</jineng>技能[护盾]使得【" + gm1.getName() + "】本回合防御值翻倍（" + (gm1.getDefense() * 2)
					+ "）转化为血量！<br>";
			msg.add(str);
			gm1.setDefense(gm1.getDefense() * 2);
		}

		if (skillID == 2) {
			// 磐石
			if (cp1.getDamage() == 0) {
				cp1.setDamage(cp1.getHurt() - gm1.getDefense());
				if (cp1.getDamage() <= 0) {
					cp1.setDamage(0);
				}
			}
			str = "<jineng>【技能】</jineng>技能[磐石]抵消了【" + cp1.getName() + "】的90%伤害（"
					+ (Double.parseDouble(df.format((cp1.getDamage() * 0.9)))) + "）!<br>";
			msg.add(str);
			cp1.setDamage(Double.parseDouble(df.format((cp1.getDamage() * 0.1))));
		}

		if (skillID == 3) {
			// 先锋
			str = "<jineng>【技能】</jineng>技能[先锋]使得【" + gm1.getName() + "】本回合获得先手！<br>";
			msg.add(str);
			gm1.setSpeed(gm1.getSpeed() + 10000);
		}

		if (skillID == 4) {
			// 回复
			str = "<jineng>【技能】</jineng>技能[回复]使得【" + gm1.getName() + "】本回合回复了500点血量！<br>";
			msg.add(str);
			gm1.setHealth(gm1.getHealth() + 500);
		}

		if (skillID == 6) {
			// 影杀
			str = "<jineng>【技能】</jineng>技能[影杀]使得【" + gm1.getName() + "】本回合攻击附带一次自身攻击10%（"
					+ (Double.parseDouble(df.format((gm1.getDamage() * 0.1)))) + "）的伤害！<br>";
			msg.add(str);
			if (gm1.getDamage() == 0) {
				gm1.setDamage(gm1.getHurt() - cp1.getDefense());
				if (gm1.getDamage() <= 0) {
					gm1.setDamage(0);
				}
			}
			gm1.setDamage(Double.parseDouble(df.format((gm1.getDamage() * 1.1))));

		}

		if (skillID == 7) {
			// 运气
			double luck = Double.parseDouble(df.format(0.5 + Math.random()));
			if (gm1.getDamage() == 0) {
				gm1.setDamage(gm1.getHurt() - cp1.getDefense());
				if (gm1.getDamage() <= 0) {
					gm1.setDamage(0);
				}
			}
			gm1.setTemp2(gm1.getDamage());
			gm1.setDamage(Double.parseDouble(df.format(gm1.getDamage() * luck)));
			str = "<jineng>【技能】</jineng>技能[运气]使得【" + gm1.getName() + "】本回合伤害变为" + gm1.getDamage() + "！<br>";
			msg.add(str);
			if (gm1.getDamage() > gm1.getTemp2()) {
				str = "<jineng>【技能】</jineng>运气不错嘛！欧皇？<br>";
				msg.add(str);
			}
			if (gm1.getDamage() < gm1.getTemp2()) {
				str = "<jineng>【技能】</jineng>非洲来的？？！非酋？<br>";
				msg.add(str);
			}
			if (gm1.getDamage() == gm1.getTemp2()) {
				str = "<jineng>【技能】</jineng>伤害不变？某种程度上你也是欧皇了！毕竟你看到我的几率非常之低。<br>";
				msg.add(str);
			}

		}

		if (skillID == 9) {
			// 饮血
			if (gm1.getDamage() == 0) {
				gm1.setDamage(gm1.getHurt() - cp1.getDefense());
				if (gm1.getDamage() <= 0) {
					gm1.setDamage(0);
				}
			}
			gm1.setHealth(gm1.getHealth() + (gm1.getDamage() * 0.5));
			str = "<jineng>【技能】</jineng>技能[饮血]使得【" + gm1.getName() + "】本回合所造成伤害的50％（"
					+ (Double.parseDouble(df.format((gm1.getDamage() * 0.5)))) + "）转化为血量！<br>";
			msg.add(str);
		}

	}

	// 持续技能生效

	// 6.持续技能判定
	public void skillAttackDuring(List<String> msg, int num, int skillID, Game_mode gm1, Game_mode cp1) {
		String str = "";
		// 控制伤害精度

		if (skillID == 1) {
			// 破敌
			str = "<jineng>【技能】</jineng>技能[破敌]持续中！【" + gm1.getName() + "】的攻击力为" + gm1.getHurt() + "。<br>";
			msg.add(str);
		}

		if (skillID == 5) {
			// 浴血
			str = "<jineng>【技能】</jineng>技能[浴血]持续中！【" + gm1.getName() + "】处于无敌状态！<br>";
			msg.add(str);
		}

		if (num == 1) {
			gm1.setSkill1DTime(gm1.getSkill1DTime() - 1);
			if (gm1.getSkill1DTime() > 0) {
				str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill1Name() + "]持续时间剩余" + gm1.getSkill1DTime() + "回合！<br>";
				msg.add(str);
			}
			if (gm1.getSkill1DTime() == 0) {
				// 技能失效
				skillEnd(gm1, cp1, gm1.getSkill1ID(), 1, msg);
				gm1.setSkill1Time(gm1.getSkill1Time() - 1);
			}
		}
		if (num == 2) {
			gm1.setSkill2DTime(gm1.getSkill2DTime() - 1);
			if (gm1.getSkill2DTime() > 0) {
				str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill2Name() + "]持续时间剩余" + gm1.getSkill2DTime() + "回合！<br>";
				msg.add(str);
			}
			if (gm1.getSkill2DTime() == 0) {
				// 技能失效
				skillEnd(gm1, cp1, gm1.getSkill2ID(), 2, msg);
				gm1.setSkill1Time(gm1.getSkill2Time() - 1);
			}

		}
		if (num == 3) {
			gm1.setSkill3DTime(gm1.getSkill3DTime() - 1);
			if (gm1.getSkill3DTime() > 1) {
				str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill3Name() + "]持续时间剩余" + gm1.getSkill3DTime() + "回合！<br>";
				msg.add(str);
			}
			if (gm1.getSkill3DTime() == 0) {
				// 技能失效
				skillEnd(gm1, cp1, gm1.getSkill3ID(), 3, msg);
				gm1.setSkill3Time(gm1.getSkill3Time() - 1);
			}
		}

	}

	// 8.技能失效
	public void skillEnd(Game_mode gm1, Game_mode cp1, int num1, int num2, List<String> msg) {
		// num1传入技能ID num2传入该修改哪个值
		String str = "";
		// 控制伤害精度
		DecimalFormat df = new DecimalFormat("0.0 ");

		if (num1 == 1) {
			// 破敌
			str = "<jineng>【技能】</jineng>技能[破敌]效果结束了，进入冷却。【" + gm1.getName() + "】的攻击力（" + gm1.getHurt() + "）还原至原本值。（"
					+ (Double.parseDouble(df.format((gm1.getHurt() * 0.666)))) + "）。<br>";
			gm1.setHurt(Double.parseDouble(df.format((gm1.getHurt() * 0.666))));
			msg.add(str);
		}

		if (num1 == 5) {
			// 浴血
			str = "<jineng>【技能】</jineng>技能[浴血]进入冷却了！【" + gm1.getName() + "】的无敌状态消失！<br>";
			msg.add(str);
			gm1.setDefense(gm1.getDefense() - 100000);
		}

		if (num1 == 8) {
			// 穿刺
			str = "<jineng>【技能】</jineng>技能[穿刺]进入冷却了！<br>";
			msg.add(str);
			cp1.setDefense(cp1.getTemp1());
			cp1.setTemp1(0);
		}

		if (num1 == 10) {
			// 护盾
			gm1.setDefense(Double.parseDouble(df.format((gm1.getDefense() * 0.5))));
			str = "<jineng>【技能】</jineng>技能[护盾]进入冷却了！【" + gm1.getName() + "】的防御值还原至原本值（" + gm1.getDefense() + "）。<br>";
			msg.add(str);

		}

		if (num1 == 2) {
			// 磐石
			str = "<jineng>【技能】</jineng>技能[磐石]进入冷却了！<br>";
			msg.add(str);
			cp1.setDamage(Double.parseDouble(df.format((cp1.getDamage() * 10))));
		}

		if (num1 == 3) {
			// 先锋
			str = "<jineng>【技能】</jineng>技能[先锋]进入冷却了！<br>";
			msg.add(str);
			gm1.setSpeed(gm1.getSpeed() - 10000);
		}

		if (num1 == 4) {
			// 回复
			str = "【技能】技能[回复]进入冷却了！<br>";
			msg.add(str);
		}

		if (num1 == 6) {
			// 影杀
			str = "【技能】技能[影杀]进入冷却了！<br>";
			msg.add(str);
			gm1.setDamage(Double.parseDouble(df.format((gm1.getDamage() * 0.909))));

		}

		if (num1 == 7) {
			// 运气
			gm1.setDamage(gm1.getTemp2());
			gm1.setTemp2(0);
		}

		if (num1 == 9) {
			// 饮血
			str = "<jineng>【技能】</jineng>技能[饮血]进入冷却了！<br>";
			msg.add(str);
		}

		// 技能数值改变
		if (num2 == 1) {
			gm1.setSkill1State(0);
		}
		if (num2 == 2) {
			gm1.setSkill2State(0);
		}
		if (num2 == 3) {
			gm1.setSkill3State(0);
		}
	}

	// 最终结算

	// 9.最终伤害计算

	public void balanceFinal(Game_mode gm1, Game_mode cp1, List<String> msg) {
		// num传入该修改哪个技能的冷却
		String str = "";

		if (gm1.getDamage() == 0) {
			gm1.setDamage(gm1.getHurt() - cp1.getDefense());
			if (gm1.getDamage() <= 0) {
				gm1.setDamage(0);
			}
		}
		if (cp1.getDamage() == 0) {
			cp1.setDamage(cp1.getHurt() - gm1.getDefense());
			if (cp1.getDamage() <= 0) {
				cp1.setDamage(0);
			}
		}

		// 判断先手
		if (gm1.getSpeed() > cp1.getSpeed()) {
			// 玩家先手
			str = "<xitong>【系统】</xitong>【" + gm1.getName() + "】速度为" + gm1.getSpeed() + "点，快于【" + cp1.getName() + "】的"
					+ cp1.getSpeed() + "点，获得了先手攻击的资格！<br>";
			msg.add(str);

			// 伤害计算
			cp1.setHealth(cp1.getHealth() - gm1.getDamage());
			if (cp1.getHealth() <= 0) {
				cp1.setHealth(0);
			}
			str = "<xitong>【系统】</xitong>【" + gm1.getName() + "】对【" + cp1.getName() + "】造成了" + gm1.getDamage() + "点伤害！【"
					+ cp1.getName() + "】剩余血量" + cp1.getHealth() + "点！<br>";
			msg.add(str);

			// 伤害后判断电脑生命
			if (cp1.getHealth() > 0) {
				// 电脑生命值大于0进行反击
				gm1.setHealth(gm1.getHealth() - cp1.getDamage());
				if (gm1.getHealth() <= 0) {
					gm1.setHealth(0);
				}
				str = "<xitong>【系统】</xitong>【" + cp1.getName() + "】对【" + gm1.getName() + "】造成了" + cp1.getDamage()
						+ "点伤害！【" + gm1.getName() + "】剩余血量" + gm1.getHealth() + "点！<br>";
				msg.add(str);
				// 玩家阵亡
				if (gm1.getHealth() <= 0) {
					str = "<xitong>【系统】</xitong>【" + gm1.getName() + "】阵亡！<br>";
					msg.add(str);
					gm1.setHealth(0);
				}
			} else {
				// 电脑生命值小于0提醒
				str = "<xitong>【系统】</xitong>【" + cp1.getName() + "】阵亡！<br>";
				msg.add(str);
				cp1.setHealth(0);
			}

		} else {
			// 反之为电脑先手
			// 先手日志
			str = "<xitong>【系统】</xitong>【" + cp1.getName() + "】速度为" + cp1.getSpeed() + "点，快于【" + gm1.getName() + "】的"
					+ gm1.getSpeed() + "点，获得了先手攻击的资格！<br>";
			msg.add(str);

			// 伤害计算
			gm1.setHealth(gm1.getHealth() - cp1.getDamage());
			if (gm1.getHealth() <= 0) {
				gm1.setHealth(0);
			}
			str = "<xitong>【系统】</xitong>【" + cp1.getName() + "】对【" + gm1.getName() + "】造成了" + cp1.getDamage()
					+ "点伤害！<br>";
			msg.add(str);

			// 伤害后判断玩家生命
			if (cp1.getHealth() > 0) {
				// 玩家生命值大于0进行反击
				cp1.setHealth(cp1.getHealth() - gm1.getDamage());
				if (cp1.getHealth() <= 0) {
					cp1.setHealth(0);
				}
				str = "<xitong>【系统】</xitong>【" + gm1.getName() + "】对【" + cp1.getName() + "】造成了" + gm1.getDamage()
						+ "点伤害！【" + cp1.getName() + "】剩余血量" + cp1.getHealth() + "点！<br>";
				msg.add(str);
				// 电脑阵亡
				if (cp1.getHealth() <= 0) {
					str = "<xitong>【系统】</xitong>【" + cp1.getName() + "】阵亡！<br>";
					msg.add(str);
					cp1.setHealth(0);
				}
			} else {
				// 玩家生命值小于0提醒
				str = "<xitong>【系统】</xitong>【" + gm1.getName() + "】阵亡！<br>";
				msg.add(str);
				gm1.setHealth(0);
			}
		}

	}

	// 本回合伤害计算

	// 5.一回合技能详细判定
	public void balanceDetail(Game_mode gm1, Game_mode cp1, List<String> msg) {
		String str = "<xitong>【战斗日志】</xitong>";
		msg.add(str);

		// 首先，电脑血量高于0进行伤害计算
		if (cp1.getHealth() > 0) {
			// 技能CD
			if (gm1.getSkill1State() == 0) {
				if (gm1.getSkill1Time() > 990000) {
				} else {
					gm1.setSkill1Time(gm1.getSkill1Time() - 1);
					if (gm1.getSkill1Time() > 0) {
						str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill1Name() + "]冷却还有" + gm1.getSkill1Time()
								+ "回合！<br>";
						msg.add(str);
					}
					if (gm1.getSkill1Time() == 0) {
						str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill1Name() + "]冷却结束！可以使用了！<br>";
						msg.add(str);
						getUserSkills(gm1, gm1.getSkill1ID(), 1);
					}
				}
			}
			if (gm1.getSkill2State() == 0) {
				if (gm1.getSkill2Time() > 990000) {
				} else {
					gm1.setSkill2Time(gm1.getSkill2Time() - 1);
					if (gm1.getSkill2Time() > 0) {
						str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill2Name() + "]冷却还有" + gm1.getSkill2Time()
								+ "回合！<br>";
						msg.add(str);
					}
					if (gm1.getSkill2Time() == 0) {
						str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill2Name() + "]冷却结束！可以使用了！<br>";
						msg.add(str);
						getUserSkills(gm1, gm1.getSkill2ID(), 2);
					}
				}
			}
			if (gm1.getSkill3State() == 0) {
				if (gm1.getSkill3Time() > 990000) {
				} else {
					gm1.setSkill3Time(gm1.getSkill3Time() - 1);
					if (gm1.getSkill3Time() > 0) {
						str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill3Name() + "]冷却还有" + gm1.getSkill3Time()
								+ "回合！<br>";
						msg.add(str);
					}
					if (gm1.getSkill3Time() == 0) {
						str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill3Name() + "]冷却结束！可以使用了！<br>";
						msg.add(str);
						getUserSkills(gm1, gm1.getSkill3ID(), 3);
					}
				}
			}

			// 技能生效处理方式
			// 技能持续中
			if (gm1.getSkill1State() == 3) {
				skillAttackDuring(msg, 1, gm1.getSkill1ID(), gm1, cp1);
			}
			if (gm1.getSkill2State() == 3) {
				skillAttackDuring(msg, 2, gm1.getSkill2ID(), gm1, cp1);
			}
			if (gm1.getSkill3State() == 3) {
				skillAttackDuring(msg, 3, gm1.getSkill3ID(), gm1, cp1);
			}
			// 记录技能变化
			int skillchange1 = 0;
			int skillchange2 = 0;
			int skillchange3 = 0;

			if (gm1.getSkill1State() == 2) {
				skillAttack(msg, 1, gm1.getSkill1ID(), gm1, cp1);
				skillchange1 = 1;
			}
			if (gm1.getSkill2State() == 2) {
				skillAttack(msg, 2, gm1.getSkill2ID(), gm1, cp1);
				skillchange2 = 1;
			}
			if (gm1.getSkill3State() == 2) {
				skillAttack(msg, 3, gm1.getSkill3ID(), gm1, cp1);
				skillchange3 = 1;
			}

			balanceFinal(gm1, cp1, msg);

			if (skillchange1 == 1) {
				if (gm1.getSkill1Time() == 0) {
					gm1.setSkill1State(1);
				} else {
					gm1.setSkill1State(3);
					gm1.setSkill1DTime(gm1.getSkill1DTime() - 1);
					if (gm1.getSkill1DTime() > 0) {
						str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill1Name() + "]持续时间剩余" + gm1.getSkill1DTime()
								+ "回合！<br>";
						msg.add(str);
					}
					if (gm1.getSkill1DTime() == 0) {
						// 技能失效
						skillEnd(gm1, cp1, gm1.getSkill1ID(), 1, msg);
					}
				}

			}

			if (skillchange2 == 1) {
				if (gm1.getSkill2Time() == 0) {
					gm1.setSkill2State(1);
				} else {
					gm1.setSkill2State(3);
					gm1.setSkill2DTime(gm1.getSkill2DTime() - 1);
					if (gm1.getSkill2DTime() > 0) {
						str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill2Name() + "]持续时间剩余" + gm1.getSkill2DTime()
								+ "回合！<br>";
						msg.add(str);
					}
					if (gm1.getSkill2DTime() == 0) {
						// 技能失效
						skillEnd(gm1, cp1, gm1.getSkill2ID(), 2, msg);
					}
				}
			}

			if (skillchange3 == 1) {
				if (gm1.getSkill3Time() == 0) {
					gm1.setSkill3State(1);
				} else {
					gm1.setSkill3State(3);
					gm1.setSkill3DTime(gm1.getSkill3DTime() - 1);
					if (gm1.getSkill3DTime() > 0) {
						str = "<jineng>【技能】</jineng>技能[" + gm1.getSkill3Name() + "]持续时间剩余" + gm1.getSkill3DTime()
								+ "回合！<br>";
						msg.add(str);
					}
					if (gm1.getSkill3DTime() == 0) {
						// 技能失效
						skillEnd(gm1, cp1, gm1.getSkill3ID(), 3, msg);
						gm1.setSkill3Time(gm1.getSkill3Time() - 1);
					}
				}
			}

		} else {
			// 玩家血量为零
			str = "<xitong>【系统】</xitong>【" + gm1.getName() + "】:“主公！再接再厉！”<br>";
			msg.add(str);
		}

	}

	// 游戏结束

	// 10.游戏1结束
	@RequestMapping(value = "/gameModeOver1", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView gameModeOver1(ModelAndView mv, HttpServletRequest request) {
		Game_mode gm1 = (Game_mode) request.getSession().getAttribute("gm1");
		User user = (User) request.getSession().getAttribute("user");
		user.setUser_money(user.getUser_money() + gm1.getReward_hufu());
		user.setUser_points(user.getUser_points() + gm1.getReward_zhanling());
		user.setUser_exp(user.getUser_exp()+gm1.getRound()*1);
		if(user.getUser_level()>=0&&user.getUser_level()<=5) {
			if(user.getUser_exp()>=500) {
				user.setUser_level(user.getUser_level()+1);
				user.setUser_exp(user.getUser_exp()-500);
			}
		}
		if(user.getUser_level()>=6&&user.getUser_level()<=10) {
			if(user.getUser_exp()>=900) {
				user.setUser_level(user.getUser_level()+1);
				user.setUser_exp(user.getUser_exp()-900);
			}
		}
		if(user.getUser_level()>=11&&user.getUser_level()<=15) {
			if(user.getUser_exp()>=1500) {
				user.setUser_level(user.getUser_level()+1);
				user.setUser_exp(user.getUser_exp()-1500);
			}
		}
		if(user.getUser_level()>=16&&user.getUser_level()<=20) {
			if(user.getUser_exp()>=3000) {
				user.setUser_level(user.getUser_level()+1);
				user.setUser_exp(user.getUser_exp()-3000);
			}
		}
		try {
			userService.update(user);
			User user1 = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg = "您获得了" + gm1.getReward_hufu() + "虎符、" + gm1.getReward_zhanling() + "战令和"+gm1.getRound()*1+"点经验值";
		mv.addObject("msg", msg);
		mv.setViewName("game_menu");
		return mv;
	}

	// 游戏2
	@RequestMapping(value = "/tobalanceTwo", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView tobalanceTwo(ModelAndView mv, HttpServletRequest request) {
		List<String> msg = new ArrayList<>();
		Game_mode gm1 = (Game_mode) request.getSession().getAttribute("gm1");
		Game_mode gm2 = (Game_mode) request.getSession().getAttribute("gm2");
		Game_mode gm3 = (Game_mode) request.getSession().getAttribute("gm3");
		Game_mode cp1 = (Game_mode) request.getSession().getAttribute("cp1");
		Game_mode cp2 = (Game_mode) request.getSession().getAttribute("cp2");
		Game_mode cp3 = (Game_mode) request.getSession().getAttribute("cp3");
		if (gm1.getHealth() >= 0 && cp1.getHealth() >= 0) {
			balanceFinal(gm1, cp1, msg);
		}
		if (gm1.getHealth() > 0 && cp1.getHealth() <= 0) {
			balanceFinal(gm1, cp2, msg);
		}
		if (gm1.getHealth() > 0 && cp2.getHealth() <= 0) {
			balanceFinal(gm1, cp3, msg);
		}
		if (gm1.getHealth() <= 0 && cp1.getHealth() > 0) {
			balanceFinal(gm2, cp1, msg);
		}
		if (gm2.getHealth() <= 0 && cp1.getHealth() > 0) {
			balanceFinal(gm3, cp1, msg);
		}
		if (gm1.getHealth() <= 0 && cp1.getHealth() <= 0 && gm2.getHealth() > 0 && cp2.getHealth() > 0) {
			balanceFinal(gm2, cp2, msg);
		}
		if (gm1.getHealth() <= 0 && cp1.getHealth() <= 0 && cp2.getHealth() <= 0 && gm2.getHealth() > 0
				&& cp3.getHealth() > 0) {
			balanceFinal(gm2, cp3, msg);
		}
		if (gm1.getHealth() <= 0 && cp1.getHealth() <= 0 && gm2.getHealth() <= 0 && gm3.getHealth() > 0
				&& cp2.getHealth() > 0) {
			balanceFinal(gm3, cp2, msg);
		}
		if (gm1.getHealth() <= 0 && cp1.getHealth() <= 0 && gm2.getHealth() <= 0 && cp2.getHealth() <= 0
				&& cp3.getHealth() > 0 && gm3.getHealth() > 0) {
			balanceFinal(gm3, cp3, msg);
		}

		if (gm3.getHealth() <= 0) {
			msg.add("游戏结束，电脑胜利");
			mv.addObject("flag", 0);
		}
		if (cp3.getHealth() <= 0) {
			msg.add("游戏结束，玩家胜利");
			mv.addObject("flag", 1);
		}
		mv.addObject("msg", msg);
		mv.addObject("gm1", gm1);
		mv.addObject("gm2", gm2);
		mv.addObject("gm3", gm3);
		mv.addObject("cp1", cp1);
		mv.addObject("cp2", cp2);
		mv.addObject("cp3", cp3);
		request.getSession().setAttribute("gm1", gm1);
		request.getSession().setAttribute("gm2", gm2);
		request.getSession().setAttribute("gm3", gm3);
		request.getSession().setAttribute("cp1", cp1);
		request.getSession().setAttribute("cp2", cp2);
		request.getSession().setAttribute("cp3", cp3);
		mv.setViewName("game_mode_2");
		return mv;
	}

	@RequestMapping(value = "/gameModeOver2/{flag}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView gameModeOver2(ModelAndView mv, HttpServletRequest request, @PathVariable int flag)
			throws Exception {

		User user = (User) request.getSession().getAttribute("user");
		String msg = "";
		if (flag == 1) {
			user.setUser_money(user.getUser_money() + 500);
			user.setUser_points(user.getUser_points() + 200);
			user.setUser_exp(user.getUser_exp()+100);
			msg = "胜利，您获得了500虎符、200战令和100经验值";
		} else if (flag == 0) {
			user.setUser_money(user.getUser_money() + 500);
			user.setUser_points(user.getUser_points() + 200);
			user.setUser_exp(user.getUser_exp()+10);
			msg = "失败，您获得了200虎符、50战令和10点经验值";
		}
		if(user.getUser_level()>=0&&user.getUser_level()<=5) {
			if(user.getUser_exp()>=500) {
				user.setUser_level(user.getUser_level()+1);
				user.setUser_exp(user.getUser_exp()-500);
			}
		}
		if(user.getUser_level()>=6&&user.getUser_level()<=10) {
			if(user.getUser_exp()>=900) {
				user.setUser_level(user.getUser_level()+1);
				user.setUser_exp(user.getUser_exp()-900);
			}
		}
		if(user.getUser_level()>=11&&user.getUser_level()<=15) {
			if(user.getUser_exp()>=1500) {
				user.setUser_level(user.getUser_level()+1);
				user.setUser_exp(user.getUser_exp()-1500);
			}
		}
		if(user.getUser_level()>=16&&user.getUser_level()<=20) {
			if(user.getUser_exp()>=3000) {
				user.setUser_level(user.getUser_level()+1);
				user.setUser_exp(user.getUser_exp()-3000);
			}
		}
		userService.update(user);
		mv.addObject("msg", msg);
		mv.setViewName("game_menu");
		return mv;
	}

	// 游戏2
	@RequestMapping(value = "/toGameMode2/{num}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toGameMode2(ModelAndView mv, HttpServletRequest request, @PathVariable int num) {

		Map<String, String[]> map = new HashMap<String, String[]>();
		map = request.getParameterMap();
		String str[] = (String[]) map.get("g2choose");
		int card_id1 = 0, card_id2 = 0, card_id3 = 0;
		// 获取前台传递id值
		int id1 = Integer.parseInt(str[0]);
		int id2 = Integer.parseInt(str[1]);
		int id3 = Integer.parseInt(str[2]);
		// 获取电脑卡牌的值
		if (num == 1) {// 桃园结义
			card_id1 = 404;
			card_id2 = 430;
			card_id3 = 408;
		}
		if (num == 2) {// 汉末三将
			card_id1 = 401;
			card_id2 = 405;
			card_id3 = 540;
		}
		if (num == 3) {// 母仪浮梦
			card_id1 = 438;
			card_id2 = 433;
			card_id3 = 547;
		}
		if (num == 4) {// 曹魏名将
			card_id1 = 424;
			card_id2 = 425;
			card_id3 = 512;
		}
		if (num == 5) {// 风华绝代
			card_id1 = 446;
			card_id2 = 546;
			card_id3 = 507;
		}
		if (num == 6) {// 巾帼之姿
			card_id1 = 457;
			card_id2 = 531;
			card_id3 = 548;
		}
		if (num == 7) {// 绝代智谋
			card_id1 = 528;
			card_id2 = 526;
			card_id3 = 510;
		}
		if (num == 8) {// 将门虎女
			card_id1 = 518;
			card_id2 = 531;
			card_id3 = 544;
		}
		if (num == 9) {// 三国鼎立
			card_id1 = 503;
			card_id2 = 512;
			card_id3 = 534;
		}
		// 玩家自己取出的自己卡牌包里的卡牌
		Game_mode gm1 = new Game_mode();
		Game_mode gm2 = new Game_mode();
		Game_mode gm3 = new Game_mode();
		Game_mode cp1 = new Game_mode();
		Game_mode cp2 = new Game_mode();
		Game_mode cp3 = new Game_mode();
		try {
			gm1 = getGm(id1, gm1);
			gm2 = getGm(id2, gm2);
			gm3 = getGm(id3, gm3);
			cp1.setRank(3);
			cp2.setRank(4);
			cp3.setRank(5);
			cp1 = getComputerCard2(card_id1, cp1);
			cp2 = getComputerCard2(card_id2, cp2);
			cp3 = getComputerCard2(card_id3, cp3);
			mv.addObject("gm1", gm1);
			mv.addObject("gm2", gm2);
			mv.addObject("gm3", gm3);
			mv.addObject("cp1", cp1);
			mv.addObject("cp2", cp2);
			mv.addObject("cp3", cp3);
			request.getSession().setAttribute("gm1", gm1);
			request.getSession().setAttribute("gm2", gm2);
			request.getSession().setAttribute("gm3", gm3);
			request.getSession().setAttribute("cp1", cp1);
			request.getSession().setAttribute("cp2", cp2);
			request.getSession().setAttribute("cp3", cp3);
			mv.setViewName("game_mode_2");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "战斗发生错误");
			mv.setViewName("game_mode_2");
		}
		return mv;
	}

	// 获取电脑卡牌
	public Game_mode getComputerCard2(int card_id, Game_mode cp1) {

		Card_type ct = new Card_type();
		try {
			// 根据难度挑选相应星级的电脑卡牌
			ct = cardService.getTC_one(card_id);
			cp1.setHurt((ct.getGenerals_attack() + ct.getGenerals_strategy())
					* (Double.parseDouble(ct.getGenerals_star())));
			cp1.setHealth(1000 * (Double.parseDouble(ct.getGenerals_star())) + (ct.getGenerals_siege() * 10)
					+ (ct.getGenerals_defense() * 20));
			cp1.setSpeed(ct.getGenerals_speed());
			cp1.setName(ct.getGenerals_name());
			cp1.setImage(ct.getGenerals_image());
			cp1.setDefense(ct.getGenerals_defense());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cp1;
	}
}

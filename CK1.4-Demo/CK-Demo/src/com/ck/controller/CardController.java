package com.ck.controller;

import java.io.UnsupportedEncodingException;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.smartcardio.CardPermission;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.ck.pojo.Card_piece;
import com.ck.pojo.Card_type;
import com.ck.pojo.Precious_card;
import com.ck.pojo.Game_skill;
import com.ck.pojo.User;
import com.ck.pojo.User_card;
import com.ck.pojo.User_piece;
import com.ck.pojo.User_skill;
import com.ck.service.CardService;
import com.ck.service.UserService;
import com.ck.utils.AlipayConfig;
import com.ck.utils.UUIDUtils;

@RequestMapping(value = "/card")
@Controller
public class CardController {

	@Autowired
	private UserService userService;

	@Autowired
	private CardService cardService;

	// 进入武将世界
	@RequestMapping(value = "/toGameAllCard1", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toGameAllCard1(ModelAndView mv, HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		List<Card_type> Owncard_list = new ArrayList<Card_type>();
		List<Card_type> NotOwncard_list = new ArrayList<Card_type>();
		try {
			Owncard_list = cardService.seleteOwnCard(user.getUser_id());
			NotOwncard_list = cardService.seleteNotOwnCard(user.getUser_id());
			mv.addObject("Owncard_list", Owncard_list);
			mv.addObject("NotOwncard_list", NotOwncard_list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("game_allCard1");
		return mv;
	}

	// 进入商城界面
	@RequestMapping(value = "/toShop", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toShop(ModelAndView mv, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		User_piece user_piece = new User_piece();
		try {
			Card_piece card_piece = (Card_piece)request.getSession().getAttribute("card_piece");
			if(card_piece==null) {
				card_piece = cardService.getOnePiece(1);
			}else {
				
			}
			request.getSession().setAttribute("card_piece", card_piece);
			user_piece = cardService.seleteUser_piece(user.getUser_id(), card_piece.getFragment_id());
			if(user_piece!=null) {
				request.getSession().setAttribute("buy", 1);
			}
			if(user_piece==null) {
				request.getSession().setAttribute("buy", null);
			}
			User_skill yinxue = new User_skill();
			yinxue = userService.seleteUserSkill(user.getUser_id(), 9);
			if(yinxue==null) {
				mv.addObject("yinxue_buy", 0);
			}else {
				mv.addObject("yinxue_buy", 1);
			}
			User_skill gedang = new User_skill();
			gedang = userService.seleteUserSkill(user.getUser_id(), 10);
			if(gedang==null) {
				mv.addObject("gedang_buy", 0);
			}else {
				mv.addObject("gedang_buy", 1);
			}
			
			mv.addObject("yinxue", yinxue);
			mv.addObject("gedang", gedang);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("game_shop");
		return mv;
	}

	// 单抽
	@RequestMapping(value = "/getOne/{num}&{type}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getOne(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@PathVariable int num, @PathVariable int type) {
		User user = (User) request.getSession().getAttribute("user");
		Card_type ct = new Card_type();
		int c_times = user.getC_times();
		int cg = 1;
		while (user.getUser_money() < 200) {
			mv.addObject("msg", "您的余额不足!请先充值");
			return toShop(mv, request);
		}
		while (user.getUser_cardNum() > 149) {
			mv.addObject("msg", "您的卡包已满，请清理!");
			return getUser_card(mv, request);
		}
		try {
			ct = cardService.getOne(type, c_times);
			if (ct.getGenerals_star().equals("4")) {
				mv.addObject("ct", ct);
				mv.addObject("type", type);
				cardService.updateUser(num, user);
				user = userService.getUserInfo(user);
				request.getSession().setAttribute("user", user);
				cardService.updateUC(user.getUser_id(), ct);
				cg = 4;
				mv.addObject("cg", cg);
				mv.setViewName("game_recruitR");
				return mv;
			}
			if (ct.getGenerals_star().equals("5")) {
				mv.addObject("ct", ct);
				mv.addObject("type", type);
				cardService.updateUser(num, user);
				user = userService.getUserInfo(user);
				request.getSession().setAttribute("user", user);
				cardService.updateUC(user.getUser_id(), ct);
				cg = 5;
				mv.addObject("cg", cg);
				mv.setViewName("game_recruitR");
				return mv;
			}
			mv.addObject("cg", cg);
			mv.addObject("ct", ct);
			mv.addObject("type", type);
			cardService.updateUser(num, user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
			cardService.updateUC(user.getUser_id(), ct);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "抽卡失败。");
		}
		mv.setViewName("game_recruitR");
		return mv;

	}

	// 五连抽
	@RequestMapping(value = "/getFive/{num}&{type}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getFive(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@PathVariable int num, @PathVariable int type) {
		User user = (User) request.getSession().getAttribute("user");
		List<Card_type> ct_list = new ArrayList<Card_type>();
		while (user.getUser_money() < 950) {
			mv.addObject("msg", "您的余额不足!请先充值");
			return toShop(mv, request);
		}
		while (user.getUser_cardNum() > 145) {
			mv.addObject("msg", "您的卡包已满，请清理!");
			return getUser_card(mv, request);
		}
		try {
			ct_list = cardService.getFive(type);
			for (int i = 0; i < 5; i++) {
				if (Integer.parseInt(ct_list.get(i).getGenerals_star()) > 4) {
					mv.addObject("type", type);
					mv.addObject("ct_listget", ct_list.get(i).getGenerals_image());
					cardService.updateUser(num, user);
					user = userService.getUserInfo(user);
					request.getSession().setAttribute("user", user);
					cardService.updateFiveUC(user.getUser_id(), ct_list);
					mv.addObject("ct_list", ct_list);
					mv.setViewName("game_recruitR");
					return mv;
				}
			}
			mv.addObject("type", type);
			mv.addObject("ct_list", ct_list);
			cardService.updateUser(num, user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
			cardService.updateFiveUC(user.getUser_id(), ct_list);
			mv.setViewName("game_recruitR");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "异常");
		}
		return mv;
	}

	// 获取用户卡牌并前往用户卡牌页面
	@RequestMapping(value = "/getUser_card", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getUser_card(ModelAndView mv, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String user_id = user.getUser_id();
		List<User_card> card_list = new ArrayList<User_card>();
		try {
			card_list = cardService.getUserCard(user_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "未查询到相关用户信息。");
			mv.setViewName("user_card");
			return mv;
		}
		List<User_card> Precious_card_list = new ArrayList<User_card>();
		List<User_card> five_list = new ArrayList<User_card>();
		List<User_card> four_list = new ArrayList<User_card>();
		List<User_card> other_list = new ArrayList<User_card>();
		for (int i = 0; i < card_list.size(); i++) {
			if (card_list.get(i).getCard_star().equals("6")) {
				Precious_card_list.add(card_list.get(i));
			}
			if (card_list.get(i).getCard_star().equals("5")) {
				five_list.add(card_list.get(i));
			}
			if (card_list.get(i).getCard_star().equals("4")) {
				four_list.add(card_list.get(i));
			}
			if (card_list.get(i).getCard_star().equals("3") || card_list.get(i).getCard_star().equals("2")) {
				other_list.add(card_list.get(i));
			}
		}
		mv.addObject("Precious_card_list", Precious_card_list);
		mv.addObject("five_list", five_list);
		mv.addObject("four_list", four_list);
		mv.addObject("other_list", other_list);
		mv.setViewName("user_card");
		return mv;
	}

	// 获取当前卡包卡牌并进入卡牌组页面
	@RequestMapping(value = "/getCardGroup/{type}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getCardGroup(ModelAndView mv, HttpServletRequest request, @PathVariable int type) {
		List<Card_type> list;
		try {
			list = cardService.getAll(type);
			mv.addObject("list", list);
			mv.setViewName("game_cardGroup");
			return mv;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "错误");
			mv.setViewName("game_cardGroup");
		}
		return mv;
	}

	// 进行兑换
	@RequestMapping(value = "/postDuiHuan/{card1_id}&{card2_id}&{card3_id}&{card_id}&{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView postDuiHuan(ModelAndView mv, HttpServletRequest request, @PathVariable int card1_id,
			@PathVariable int card2_id, @PathVariable int card3_id, @PathVariable int card_id, @PathVariable int id) {
		try {
			User user = (User) request.getSession().getAttribute("user");
			Precious_card dc = new Precious_card();
			cardService.deleteDC(card1_id, card2_id, card3_id);
			cardService.updateNum(user);
			dc = cardService.getDuiHuan(id);
			if (dc.getState() == 0) {
				cardService.updateDC(card_id);
				cardService.updateUCD(user, dc);
				user = userService.getUserInfo(user);
				request.getSession().setAttribute("user", user);
				mv.addObject("msg", "兑换成功");
				getUser_card(mv, request);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "兑换失败");
			mv.setViewName("game_exchange");
		}
		return mv;
	}

	// 进入兑换详情页面
	@RequestMapping(value = "/toExchangeInfo/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toExchangeInfo(ModelAndView mv, HttpServletRequest request, @PathVariable int id) {
		Precious_card dc = new Precious_card();
		User user = (User) request.getSession().getAttribute("user");
		try {
			dc = cardService.getDuiHuan(id);
			User_card user_card = cardService.getOneUserCard(user.getUser_id(),dc.getCard_id());
			int num1 = 0, num2 = 0, num3 = 0;
			List<Object> list_num = new ArrayList<>();
			list_num = cardService.getDuiHuanInfo(dc, num1, num2, num3);
			mv.addObject("dc", dc);
			mv.addObject("user_card", user_card);
			mv.addObject("list_num", list_num);
			mv.setViewName("game_exchangeInfo");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "错误");
			mv.setViewName("game_exchangeInfo");
		}
		return mv;
	}

	// 获取武将信息并前往武将详细页
	@RequestMapping(value = "/toGameCardInfo/{card_id}&{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toGameCardInfo(ModelAndView mv, HttpServletRequest request, @PathVariable int card_id,
			@PathVariable int id) {
		Card_type ct = new Card_type();
		User_card uc = new User_card();
		try {
			User user = (User) request.getSession().getAttribute("user");
			ct = cardService.getTC_one(card_id);
			uc = cardService.getCardlevel(id);
			mv.addObject("ct", ct);
			mv.addObject("uc", uc);
			mv.setViewName("game_cardInfo");
			;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "获取武将信息失败");
			mv.setViewName("game_cardInfo");
			;
		}
		return mv;
	}

	// 转换战法经验
	@RequestMapping(value = "/deleteCardToZhanLing", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView deleteCardToZhanLing(ModelAndView mv, HttpServletRequest request) {
		int card_star = Integer.parseInt(request.getParameter("card_star"));
		User user = (User) request.getSession().getAttribute("user");
		try {
			if (card_star == 5) {
				cardService.deleteCardToZhanfa(user, card_star);
			}
			if (card_star == 4) {
				cardService.deleteCardToZhanfa(user, card_star);
			}
			if (card_star == 3) {
				cardService.deleteCardToZhanfa(user, card_star);
			}
			if (card_star == 2) {
				cardService.deleteCardToZhanfa(user, card_star);
			}
			user = cardService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
			getUser_card(mv, request);
			mv.addObject("msg1", "分解成功");
			mv.setViewName("user_card");
			;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg1", "分解失败");
			mv.setViewName("user_card");
		}
		return mv;
	}

	// 分解单张
	@RequestMapping(value = "/resolveOne/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView resolveOne(ModelAndView mv, HttpServletRequest request, @PathVariable int id) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			cardService.del_user_one_card(user, id);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
			getUser_card(mv, request);
			mv.addObject("msg1", "分解成功");
			mv.setViewName("user_card");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mv.addObject("msg1", "分解失败");
			getUser_card(mv, request);
			mv.setViewName("user_card");
		}
		return mv;
	}

	// 选择出战武将
	@RequestMapping(value = "/userCardChoose/{mode}&{num}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView userCardChoose(ModelAndView mv, HttpServletRequest request, @PathVariable int mode,
			@PathVariable int num) {
		User user = (User) request.getSession().getAttribute("user");
		String user_id = user.getUser_id();
		List<User_card> card_list = new ArrayList<User_card>();
		try {
			card_list = cardService.getUserCard(user_id);
			List<User_card> Precious_card_list = new ArrayList<User_card>();
			List<User_card> five_list = new ArrayList<User_card>();
			List<User_card> four_list = new ArrayList<User_card>();
			List<User_card> other_list = new ArrayList<User_card>();
			for (int i = 0; i < card_list.size(); i++) {
				if (card_list.get(i).getCard_star().equals("6")) {
					Precious_card_list.add(card_list.get(i));
				}
				if (card_list.get(i).getCard_star().equals("5")) {
					five_list.add(card_list.get(i));
				}
				if (card_list.get(i).getCard_star().equals("4")) {
					four_list.add(card_list.get(i));
				}
				if (card_list.get(i).getCard_star().equals("3") || card_list.get(i).getCard_star().equals("2")) {
					other_list.add(card_list.get(i));
				}
			}
			List<User_skill> user_skills = new ArrayList<User_skill>();
			user_skills = userService.seleteUserAllSkill(user_id);
			List<Integer> skill_id = new ArrayList<Integer>();
			for(int i=0 ;i<user_skills.size();i++) {
				skill_id.add(user_skills.get(i).getSkill_id());
			}
			mv.addObject("five_list", five_list);
			mv.addObject("four_list", four_list);
			mv.addObject("other_list", other_list);
			mv.addObject("skill_id", skill_id);
			mv.addObject("num", num);
			mv.addObject("mode", mode);
			mv.setViewName("game_userChoose");
			;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "错误");
		}
		return mv;
	}

	// 升级
	@RequestMapping(value = "/uplevel", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView uplevel(ModelAndView mv, HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("id"));
		try {
			User_card uc = new User_card();
			User_card uc1 = new User_card();
			User user = (User) request.getSession().getAttribute("user");
			uc = cardService.getCardlevel(id);
			if (Integer.parseInt(uc.getCard_star()) == 5) {
				if(user.getUser_points()<160) {
					mv.addObject("msg", "您的战令点不足哦，去分解不需要的武将吧");
					return mv;
				}else {
					user.setUser_points(user.getUser_points() - 160);
				}
			}
			if (Integer.parseInt(uc.getCard_star()) == 4) {
				if(user.getUser_points()<80) {
					mv.addObject("msg", "您的战令点不足哦，去分解不需要的武将吧");
					return mv;
				}else {
					user.setUser_points(user.getUser_points() - 80);
				}
			}
			if (Integer.parseInt(uc.getCard_star()) == 3) {
				if(user.getUser_points()<40) {
					mv.addObject("msg", "您的战令点不足哦，去分解不需要的武将吧");
					return mv;
				}else {
					user.setUser_points(user.getUser_points() - 40);
				}
			}
			if (Integer.parseInt(uc.getCard_star()) == 2) {
				if(user.getUser_points()<20) {
					mv.addObject("msg", "您的战令点不足哦，去分解不需要的武将吧");
					return mv;
				}else {
					user.setUser_points(user.getUser_points() - 20);
				}
			}
			userService.update(user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
			int card_level = uc.getCard_level() + 1;
			cardService.uplevel(card_level, id);
			uc1 = cardService.getCardlevel(id);
			mv.addObject("uc", uc1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}

	// 获取碎片
	@RequestMapping(value = "/getOnePiece", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getOnePiece(ModelAndView mv, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		int num = (int)((Math.random() * (12 - 1)) + 1);
		try {
			Card_piece card_piece = cardService.getOnePiece(num);
			request.getSession().setAttribute("card_piece", card_piece);
			if(user.getUser_money()<50) {
				mv.addObject("msg", "余额不足");
			}else {
				user.setUser_money(user.getUser_money()-50);
				userService.update(user);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return toShop(mv,request);
	}

	// 购买shop卡牌碎片
	@RequestMapping(value = "/buy_ShopCard", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView buy_ShopCard(ModelAndView mv, HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = (User) request.getSession().getAttribute("user");
		try {
			Card_piece card_piece = cardService.getOnePiece(id);
			User_piece user_piece = new User_piece();
			User_piece user_piece1 = new User_piece();
			user_piece = cardService.seleteUser_piece(user.getUser_id(), card_piece.getFragment_id());
			if (user_piece == null) {
				user_piece1.setFragment_id(card_piece.getFragment_id());
				user_piece1.setFragment_name(card_piece.getFragment_name());
				user_piece1.setFragment_image(card_piece.getFragment_image());
				user_piece1.setFragment_num(user_piece1.getFragment_num() + 5);
				user_piece1.setUser_id(user.getUser_id());
				cardService.insertUser_piece(user_piece1);
			} else {
				user_piece.setFragment_num(user_piece.getFragment_num() + 5);
				cardService.updateUser_piece(user_piece);
			}
			card_piece.setState(1);
			cardService.updateCard_piece(id);
			user.setUser_money(user.getUser_money() - 1000);
			userService.update(user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}

	// 购买shop其他商品
	@RequestMapping(value = "/buy_ShopOther", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView buy_ShopOther(ModelAndView mv, HttpServletRequest request) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		User user = (User) request.getSession().getAttribute("user");
		User_skill user_skill = new User_skill();
		User_skill user_skill1 = new User_skill();
		Game_skill skill = new Game_skill();
		// 购买摇骰子次数10次5000虎符
		try {
			if (num == 1) {
				user.setDice_point(user.getDice_point() + 10);
				user.setUser_money(user.getUser_money() - 5000);
			}
			// 购买战令点500——5000虎符  1000战令点——8000虎符
			if (num == 2) {
				user.setUser_points(user.getUser_points() + 500);
				user.setUser_money(user.getUser_money() - 5000);
			}
			if (num == 3) {
				user.setUser_points(user.getUser_points() + 1000);
				user.setUser_money(user.getUser_money() - 8000);
			}
			// 技能饮血——2000虎符  技能护盾——2000虎符
			if (num == 4) {
				user_skill = userService.seleteUserSkill(user.getUser_id(), 9);
				if(user_skill==null) {
					int id = 9;
					skill = userService.seleteSkill(id);
					user.setUser_money(user.getUser_money() - 2000);
					user_skill1.setUser_id(user.getUser_id());
					user_skill1.setSkill_id(skill.getSkill_id());
					user_skill1.setSkill_name(skill.getSkill_name());
					userService.update_userSkill(user_skill1);
				}else {}
			}
			if(num == 5) {
				user_skill = userService.seleteUserSkill(user.getUser_id(), 10);
				if(user_skill==null) {
					int id = 10;
					skill = userService.seleteSkill(id);
					user.setUser_money(user.getUser_money() - 2000);
					user_skill1.setUser_id(user.getUser_id());
					user_skill1.setSkill_id(skill.getSkill_id());
					user_skill1.setSkill_name(skill.getSkill_name());
					userService.update_userSkill(user_skill1);
				}
				else {}
			}
			userService.update(user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	//支付宝支付
	@RequestMapping(value = "/forAli", method = RequestMethod.POST)
	@ResponseBody
	public String forAli(HttpServletRequest request) {

		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		
		//请求
		String result="";
		try {
			request.setCharacterEncoding("UTF-8");
			//商户订单号，商户网站订单系统中唯一订单号，必填
			String out_trade_no = new String(UUIDUtils.getCode().getBytes("ISO-8859-1"),"UTF-8");
			//付款金额，必填
			String total_amount = new String("0.01");
			//订单名称，必填
			String subject = new String("50000虎符");
			//商品描述，可空
			String body = new String("购买虎符");
			
			alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
					+ "\"total_amount\":\""+ total_amount +"\"," 
					+ "\"subject\":\""+ subject +"\"," 
					+ "\"body\":\""+ body +"\"," 
					+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
			//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
			//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			//		+ "\"total_amount\":\""+ total_amount +"\"," 
			//		+ "\"subject\":\""+ subject +"\"," 
			//		+ "\"body\":\""+ body +"\"," 
			//		+ "\"timeout_express\":\"10m\"," 
			//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
			//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
			
			result = alipayClient.pageExecute(alipayRequest).getBody();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//输出
		return result;
	}
	
	//支付返回
	@RequestMapping(value = "/pay_return", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView pay_return(ModelAndView mv, HttpServletRequest request) {
		try {
			User user = (User) request.getSession().getAttribute("user");
			user.setUser_money(user.getUser_money()+50000);
			userService.update(user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		toShop(mv, request);
	    return mv;
	}
}

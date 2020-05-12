package com.ck.controller;

import java.util.ArrayList;


import java.util.Calendar;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ck.constant.Constant;
import com.ck.pojo.Card_type;
import com.ck.pojo.Game_skill;
import com.ck.pojo.User;
import com.ck.pojo.User_piece;
import com.ck.pojo.User_skill;
import com.ck.service.CardService;
import com.ck.service.UserService;
import com.ck.utils.UUIDUtils;

@RequestMapping(value = "/user")
@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private CardService cardService;

	// 登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView login(ModelAndView mv, String username, String password, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			User user = userService.findByUsername(username);
			if (user == null) {
				mv.addObject("msg", "该用户不存在");
				mv.setViewName("user_login");
				return mv;
			}
			if (!user.getUser_password().equals(password)) {
				mv.addObject("msg", "密码错误");
				mv.setViewName("user_login");
				return mv;
			}
			if (user.getState() == Constant.USER_IS_NOT_ACTIVE) {
				mv.addObject("msg", "该用户未激活");
				mv.setViewName("user_login");
				return mv;
			}
			Date date = new Date();
			if (user.getLast_signin_time() == null) {
				int login_day = user.getLogin_day() + 1;
				user.setLogin_day(login_day);
			} else {
				Calendar c1 = Calendar.getInstance();
				c1.setTime(user.getLast_signin_time());
				int last_day = c1.get(Calendar.DAY_OF_MONTH);

				Calendar c2 = Calendar.getInstance();
				c2.setTime(date);
				int now_day = c2.get(Calendar.DAY_OF_MONTH);

				if (now_day > last_day) {
					int login_day = user.getLogin_day() + 1;
					user.setLogin_day(login_day);
					user.setSign_state(0);
					userService.updateAllCard_piece();
				}
			}
			user.setLast_signin_time(date);
			userService.update(user);
			user = userService.findByUsername(username);
			request.getSession().setAttribute("user", user);
			mv.addObject("msg", "");
			mv.setViewName("user_lobby");
			return mv;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "异常");
			mv.setViewName("user_login");
			return mv;
		}
	}

	// 注册
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView regist(ModelAndView mv, User user, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			// 1.1 手动封装uid
			user.setUser_id(UUIDUtils.getId());
			// 1.2 手动封装激活状态码state
			user.setState(Constant.USER_IS_NOT_ACTIVE);
			// 1.3 手动封装激活码code
			user.setCode(UUIDUtils.getCode());
			user.setUser_level(1);
			user.setUser_money(user.getUser_money()+50000);
			User user1 = userService.findByUsername(user.getUser_name());
			if (user1 == null) {
				int i = userService.regist(user);
				if (i <= 0) {
					mv.addObject("msg", "注册失败，清联系管理员！");
					mv.setViewName("user_register");
					return mv;
				}
				mv.addObject("msg", "注册成功！请前往邮箱激活。");
				setUser_skill(2, request, user);
				setUser_skill(3, request, user);
				setUser_skill(4, request, user);
				mv.setViewName("user_login");
				request.getSession().setAttribute("user", user);
				return mv;
			} else {
				mv.addObject("msg", "注册失败，用户名已存在！请重新注册");
				mv.setViewName("user_register");
				return mv;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "异常！");
			mv.setViewName("user_register");
			return mv;
		}
	}

	// 退出登录
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView logout(ModelAndView mv, HttpServletRequest request) {
		request.getSession().invalidate();
		mv.setViewName("user_login");
		return mv;
	}

	// 激活账户
	@RequestMapping(value = "/active", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView active(ModelAndView mv, HttpServletRequest request) {
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			User user = userService.active(user1.getCode());
			if (user == null) {
				mv.addObject("msg", "用户激活失败，请重试！11");
				mv.setViewName("user_register");
				return mv;
			}
			mv.addObject("msg", "用户激活成功！");
			mv.setViewName("user_login");
			request.getSession().setAttribute("user", user);
			return mv;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "用户激活失败，请重试a ！");
			mv.setViewName("user_register");
			return mv;
		}
	}

	//更改密码
	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateUserInfo(ModelAndView mv, String user_name, String user_password,String user_image,
			HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			request.setCharacterEncoding("UTF-8");
			User user2 = userService.findByUsername(user_name);
			if(user2!=null) {
				mv.addObject("msg", "用户名已存在");
			}else {
				if(user_password.equals("")&&user_name.equals("")) {
				
				}else if(user_name.equals("")) {
					user.setUser_password(user_password);
					userService.update(user);
					user = userService.getUserInfo(user);
					mv.addObject("user", user);
					request.getSession().setAttribute("user", user);
					mv.addObject("msg", "修改密码成功");
				}else if(user_password.equals("")) {
					user.setUser_name(user_name);
					userService.update(user);
					user = userService.getUserInfo(user);
					mv.addObject("user", user);
					request.getSession().setAttribute("user", user);
					mv.addObject("msg", "修改用户名成功");
				}else {
					user.setUser_password(user_password);
					user.setUser_name(user_name);
					userService.update(user);
					user = userService.getUserInfo(user);
					mv.addObject("user", user);
					request.getSession().setAttribute("user", user);
					mv.addObject("msg", "修改成功");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "修改失败");
		}
		return to_UserInformation(mv,request);
	}
	
	// 前往用户信息界面
	@RequestMapping(value = "/to_UserInformation", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView to_UserInformation(ModelAndView mv, HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		List<User_skill> user_skill = new ArrayList<User_skill>();
		try {
			user_skill = userService.seleteUserAllSkill(user.getUser_id());
			mv.addObject("user_skill", user_skill);
			mv.setViewName("user_information");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mv.setViewName("500");
		}
		return mv;
	}
	
	// 更新虎符
	@RequestMapping(value = "/updatehufu", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView updatehufu(ModelAndView mv, HttpServletRequest request) {
		try {
			User user = (User) request.getSession().getAttribute("user");
			int money = Integer.parseInt(request.getParameter("money"));
			user.setUser_money(user.getUser_money() + money);
			userService.update(user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}

	// 摇骰子
	@RequestMapping(value = "/rolldice", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView rolldice(ModelAndView mv, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getDice_point() <= 0) {
			mv.addObject("data", "抱歉您的点数不足");
			return mv;
		}
		try {
			user.setDice_point(user.getDice_point() - 1);
			userService.update(user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}

	// 摇骰子获得武将
	@RequestMapping(value = "/gethuodongcard", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView gethuodongcard(ModelAndView mv,HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = (User) request.getSession().getAttribute("user");
		user.setUser_cardNum(user.getUser_cardNum() + 1);
		try {
			Card_type ct = cardService.getTC_one(id);
			cardService.updateUC(user.getUser_id(), ct);
			userService.update(user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "添加失败");
		}
		return mv;
	}
	
	//插入用户技能
	public void setUser_skill(int num, HttpServletRequest request, User user) {
		Game_skill skill = new Game_skill();
		User_skill user_skill = new User_skill();
		try {
			skill = userService.seleteSkill(num);
			user_skill.setUser_id(user.getUser_id());
			user_skill.setSkill_id(skill.getSkill_id());
			user_skill.setSkill_name(skill.getSkill_name());
			userService.update_userSkill(user_skill);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	// 获取用户卡牌碎片
	@RequestMapping(value = "/getUserPiece", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getUser_piece(ModelAndView mv, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		List<User_piece> user_picelist = new ArrayList<User_piece>();
		try {
			user_picelist = userService.getUserPiece(user.getUser_id());	
			mv.addObject("user_picelist", user_picelist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("user_piece");
		return mv;
	}
	
	// 兑换卡牌碎片
	@RequestMapping(value = "/pieceToCard", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView pieceToCard(ModelAndView mv, HttpServletRequest request) {

		int fragment_id = Integer.parseInt(request.getParameter("fragment_id"));
		User user = (User) request.getSession().getAttribute("user");
		User_piece user_piece = new User_piece();
		try {
			Card_type card_type = cardService.getTC_one(fragment_id);
			user_piece = cardService.seleteUser_piece(user.getUser_id(), fragment_id);
			if (user_piece.getFragment_num() >= 80) {
				user_piece.setFragment_num(user_piece.getFragment_num() - 80);
				user.setUser_cardNum(user.getUser_cardNum() + 1);
				cardService.updateUC(user.getUser_id(), card_type);
				userService.update(user);
				cardService.updateUser_piece(user_piece);
				mv.addObject("msg", "兑换成功");
			} else {
				mv.addObject("msg", "兑换失败");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "兑换失败");
		}
		return getUser_piece(mv, request);
	}
	
	//签到卡牌奖励
	@RequestMapping(value = "/getSignCard", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getSignCard(ModelAndView mv,HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = (User) request.getSession().getAttribute("user");
		user.setUser_cardNum(user.getUser_cardNum() + 1);
		try {
			Card_type ct = cardService.getTC_one(id);
			cardService.updateUC(user.getUser_id(), ct);
			user.setSign_state(1);
			userService.update(user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("msg", "添加失败");
		}
		return mv;
	}
	
	//签到虎符奖励
	@RequestMapping(value = "/getSignHufu", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getSignHufu(ModelAndView mv,HttpServletRequest request) {
		try {
			User user = (User) request.getSession().getAttribute("user");
			int money = Integer.parseInt(request.getParameter("money"));
			user.setUser_money(user.getUser_money() + money);
			user.setSign_state(1);
			userService.update(user);
			user = userService.getUserInfo(user);
			request.getSession().setAttribute("user", user);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
}
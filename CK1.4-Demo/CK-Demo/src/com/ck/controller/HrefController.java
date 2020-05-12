package com.ck.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ck.pojo.User;
import com.ck.pojo.User_skill;
import com.ck.service.CardService;
import com.ck.service.UserService;

@RequestMapping(value = "/href")
@Controller
public class HrefController {
	@Autowired
	private UserService userService;

	@Autowired
	private CardService cardService;
	
	// 前往招募界面
	@RequestMapping(value = "/to_recruit", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView to_recruit(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("user_recruit");
		return mv;
	}
	
	// 进入游戏菜单
	@RequestMapping(value = "/toGamemenu", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toGamemenu(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("game_menu");
		return mv;
	}

	// 进入用户主页面
	@RequestMapping(value = "/toUserlobby", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toUserlobby(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("user_lobby");
		return mv;
	}
	
	//返回兑换界面
	@RequestMapping(value = "/toGameExchange", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView toGameExchange(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("game_exchange");
		return mv;
	}
}

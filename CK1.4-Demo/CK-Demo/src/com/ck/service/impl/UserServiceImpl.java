package com.ck.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ck.constant.Constant;
import com.ck.dao.UserMapper;
import com.ck.pojo.Game_skill;
import com.ck.pojo.User;
import com.ck.pojo.User_piece;
import com.ck.pojo.User_skill;
import com.ck.service.UserService;
import com.ck.utils.MailUtils;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	public int regist(User user) throws Exception {
		int i = userMapper.add(user);
		
		//2、发送激活邮件
		String emailMsg = 
				"恭喜"+user.getUser_name()+"，成为我们游戏的一员！<a href='http://localhost:8080/CK-Demo/user/active'>点此激活</a>";
		MailUtils.sendMail(user.getEmail(), emailMsg);
		return i;
	}

	@Override
	//用户激活
	public User active(String code) throws Exception {
		//1、通过code获取用户
		User user = userMapper.getUserByCode(code);
		//通过激活活码没有找到用户
		if(user==null){
			return null;
		}
		//2、若获取到则修改用户状态码，并清空激活码
		user.setState(Constant.USER_IS_ACTIVE);
		user.setCode(null);
		
		//调用update方法执行更新修改
		userMapper.update(user);
		user = userMapper.getUserInfo(user);
		return user;
	}
	
	@Override
	public User findByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findByUsername(username);
	}

	@Override
	public User getUserInfo(User user) throws Exception {
		return userMapper.getUserInfo(user);
	}

	@Override
	public void update(User user) throws Exception {
		// TODO Auto-generated method stub
		Date date = new Date();
		user.setLast_signin_time(date);
		userMapper.update(user);
	}

	@Override
	public void update_userSkill(User_skill user_skill) throws Exception {
		// TODO Auto-generated method stub
		userMapper.update_userSkill(user_skill);
	}

	@Override
	public Game_skill seleteSkill(int id) throws Exception {
		// TODO Auto-generated method stub
		Game_skill game_skill = new Game_skill();
		game_skill = userMapper.seleteSkill(id);
		return game_skill;
	}

	@Override
	public User_skill seleteUserSkill(String user_id,int skill_id) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.seleteUserSkill(user_id,skill_id);
	}

	@Override
	public void updateAllCard_piece() throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateAllCard_piece();
	}

	@Override
	public List<User_piece> getUserPiece(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserPiece(user_id);
	}

	@Override
	public List<User_skill> seleteUserAllSkill(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.seleteUserAllSkill(user_id);
	}


	

}

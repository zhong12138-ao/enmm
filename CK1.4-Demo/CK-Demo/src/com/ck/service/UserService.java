package com.ck.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ck.pojo.Game_skill;
import com.ck.pojo.User;
import com.ck.pojo.User_piece;
import com.ck.pojo.User_skill;

@Service
public interface UserService {

	User findByUsername(String username) throws Exception;

	int regist(User user) throws Exception;

	User active(String code) throws Exception;

	User getUserInfo(User user) throws Exception;

	void update(User user) throws Exception;

	void update_userSkill(User_skill user_skill) throws Exception;

	Game_skill seleteSkill(int id) throws Exception;

	User_skill seleteUserSkill(String user_id, int skill_id) throws Exception;

	void updateAllCard_piece() throws Exception;

	List<User_piece> getUserPiece(String user_id) throws Exception;
	
	List<User_skill> seleteUserAllSkill(String user_id) throws Exception;
}

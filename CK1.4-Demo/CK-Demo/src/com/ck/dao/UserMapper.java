package com.ck.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ck.pojo.Game_skill;
import com.ck.pojo.User;
import com.ck.pojo.User_piece;
import com.ck.pojo.User_skill;


@Repository
public interface UserMapper {

	User findByUsername(String username) throws Exception;

	User getUserByCode(String code) throws Exception;

	void update(User user) throws Exception;

	int add(User user) throws Exception;

	User getUserInfo(User user) throws Exception;

	void update_userSkill(User_skill user_skill) throws Exception;

	Game_skill seleteSkill(int id) throws Exception;

	User_skill seleteUserSkill(@Param("user_id")String user_id,@Param("skill_id")int skill_id) throws Exception;

	void updateAllCard_piece() throws Exception;
	
	List<User_piece> getUserPiece(String user_id) throws Exception;

	List<User_skill> seleteUserAllSkill(String user_id) throws Exception;
}
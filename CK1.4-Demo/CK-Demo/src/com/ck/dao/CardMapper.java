package com.ck.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ck.pojo.Card_piece;
import com.ck.pojo.Card_type;
import com.ck.pojo.Precious_card;
import com.ck.pojo.User;
import com.ck.pojo.User_card;
import com.ck.pojo.User_piece;
@Repository
public interface CardMapper {

	Card_type getOne(int type) throws Exception;   //普�?�单�?
	Card_type getOneSpe(int type) throws Exception;//特殊单抽

	List<Card_type> getFive(int type) throws Exception;

	void updateUser(int num,User user) throws Exception;
	
	User getUserInfo(User user) throws Exception;
	
	void updateUC(User_card user_card) throws Exception;

	List<Card_type> getAll(int type) throws Exception;

	Precious_card getDuiHuan(int id) throws Exception;
	
	List<User_card> getUserCard(String user_id) throws Exception;

	User_card getDuiHuanInfo(int card_id) throws Exception;

	void updateDC(int card_id) throws Exception;

	void deleteDC(int card_id) throws Exception;

	void updateNum(User user) throws Exception;

	Card_type getTC_one(int card_id) throws Exception;

	int selectStarCard(int card_star) throws Exception;
	
	void deleteUC(int card_star) throws Exception;
	
	void uplevel(@Param("card_level")int card_level,@Param("id")int id) throws Exception;
	
	void del_user_one_card(int id) throws Exception;
	
	User_card get_user_one_card(int id) throws Exception;
	
	Card_piece getOnePiece(int id) throws Exception;
	
	void insertUser_piece(User_piece user_piece) throws Exception;
	
	User_piece seleteUser_piece(@Param("user_id") String user_id,@Param("fragment_id") int fragment_id) throws Exception;
	
	void updateCard_piece(int id) throws Exception;
	
	void updateUser_piece(User_piece user_piece) throws Exception;
	
	List<Card_type> seleteOwnCard(String user_id) throws Exception;
	
	List<Card_type> seleteNotOwnCard(String user_id) throws Exception;
	
	User_card getOneUserCard(@Param("user_id") String user_id,@Param("card_id") int card_id) throws Exception;
	
	

}

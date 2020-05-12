package com.ck.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.ck.pojo.Card_piece;
import com.ck.pojo.Card_type;
import com.ck.pojo.Precious_card;
import com.ck.pojo.User;
import com.ck.pojo.User_card;
import com.ck.pojo.User_piece;
@Service
public interface CardService {
	//获取一张卡牌
	Card_type getOne(int type, int c_times) throws Exception;

	List<Card_type> getFive(int type) throws Exception;

	void updateUser(int num,User user) throws Exception;
	
	User getUserInfo(User user) throws Exception;

	void updateUC( String user_id, Card_type ct) throws Exception;

	void updateFiveUC(String user_id, List<Card_type> ct_list) throws Exception;

	List<Card_type> getAll(int type) throws Exception;
	
	List<User_card> getUserCard(String user_id) throws Exception;

	Precious_card getDuiHuan(int id) throws Exception;

	List<Object> getDuiHuanInfo(Precious_card dc, int num1, int num2, int num3) throws Exception;

	void updateDC(int card_id) throws Exception;

	void deleteDC(int card1_id, int card2_id, int card3_id) throws Exception;

	void updateNum(User user) throws Exception;

	void updateUCD(User user, Precious_card dc) throws Exception;

	Card_type getTC_one(int card_id) throws Exception;

	void deleteCardToZhanfa(User user,int card_star) throws Exception;

	User_card getCardlevel(int id) throws Exception;

	void uplevel(int card_level,int id) throws Exception;

	void del_user_one_card(User user, int id) throws Exception;

	Card_piece getOnePiece(int id) throws Exception;

	void insertUser_piece(User_piece user_piece) throws Exception;

	User_piece seleteUser_piece(String user_id, int fragment_id) throws Exception;

	void updateCard_piece(int id) throws Exception;

	void updateUser_piece(User_piece user_piece) throws Exception;

	List<Card_type> seleteOwnCard(String user_id) throws Exception;

	List<Card_type> seleteNotOwnCard(String user_id) throws Exception;

	User_card getOneUserCard(String user_id, int card_id) throws Exception;

}

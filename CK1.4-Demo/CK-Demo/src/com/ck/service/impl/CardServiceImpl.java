package com.ck.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ck.dao.CardMapper;
import com.ck.dao.UserMapper;
import com.ck.pojo.Card_piece;
import com.ck.pojo.Card_type;
import com.ck.pojo.Precious_card;
import com.ck.pojo.User;
import com.ck.pojo.User_card;
import com.ck.pojo.User_piece;
import com.ck.service.CardService;
@Service
public class CardServiceImpl implements CardService {
	
	@Autowired
	private CardMapper cardMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public Card_type getOne(int type,int c_times) throws Exception {
		// TODO Auto-generated method 
		Card_type ct = new Card_type();
		if((5-c_times%5)!=1) {
			ct=cardMapper.getOne(type);
		}else {
			ct=cardMapper.getOneSpe(type);
		}
		return ct;
	}

	@Override
	public List<Card_type> getFive(int type) throws Exception {
		// TODO Auto-generated method stub
		List<Card_type> ct_list = new ArrayList<Card_type>();
		ct_list = cardMapper.getFive(type);
		Card_type ct = new Card_type();
		ct = cardMapper.getOneSpe(type);
		ct_list.set(2, ct);
		return ct_list;
	}

	@Override
	public void updateUser(int num,User user) throws Exception {
		// TODO Auto-generated method stub
		if(num==1) {
			user.setC_times(user.getC_times()+1);
			user.setUser_cardNum(user.getUser_cardNum()+1);
			user.setUser_money(user.getUser_money()-(num*200));
			userMapper.update(user);
		}else{
			user.setC_times(user.getC_times()+5);
			user.setUser_cardNum(user.getUser_cardNum()+5);
			user.setUser_money(user.getUser_money()-950);
			userMapper.update(user);
		}
	}
	
	@Override
	public User getUserInfo(User user) throws Exception {
		return userMapper.getUserInfo(user);
		
	}
	
	@Override
	public void updateUCD(User user, Precious_card dc) throws Exception {

		// TODO Auto-generated method stub
		User_card user_card = new User_card();
		user_card.setCard_id(dc.getCard_id());
		user_card.setUser_id(user.getUser_id());
		user_card.setCard_name(dc.getCard_name());
		user_card.setCard_image(dc.getCard_image());
		user_card.setCard_star("6");
		user_card.setCard_level(1);
		cardMapper.updateUC(user_card);
	}
	
	@Override
	public void updateUC(String user_id,Card_type ct) throws Exception {
		// TODO Auto-generated method stub
		User_card user_card = new User_card();
		user_card.setCard_id(ct.getCard_id());
		user_card.setUser_id(user_id);
		user_card.setCard_name(ct.getGenerals_name());
		user_card.setCard_image(ct.getGenerals_image());
		user_card.setCard_star(ct.getGenerals_star());
		user_card.setCard_level(1);
		cardMapper.updateUC(user_card);
	}

	@Override
	public void updateFiveUC(String user_id, List<Card_type> ct_list) throws Exception {
		
		for(int i = 0;i<5;i++) {
			User_card user_card = new User_card();
			user_card.setCard_id(ct_list.get(i).getCard_id());
			user_card.setUser_id(user_id);
			user_card.setCard_name(ct_list.get(i).getGenerals_name());
			user_card.setCard_image(ct_list.get(i).getGenerals_image());
			user_card.setCard_star(ct_list.get(i).getGenerals_star());
			user_card.setCard_level(1);
			cardMapper.updateUC(user_card);
		}
	}

	@Override
	public List<Card_type> getAll(int type) throws Exception {
		// TODO Auto-generated method stub
		List<Card_type> list = cardMapper.getAll(type);
		return list;
	}

	@Override
	public Precious_card getDuiHuan(int id) throws Exception {
		// TODO Auto-generated method stub
		Precious_card dc = new Precious_card();
		dc = cardMapper.getDuiHuan(id);
		return dc;
	}

	@Override
	public List<Object> getDuiHuanInfo(Precious_card dc, int num1, int num2, int num3) throws Exception {
		// TODO Auto-generated method stub
		List<Object> list = new ArrayList<>();
    	if(cardMapper.getDuiHuanInfo(dc.getCard1_id())!=null) {
			num1 = 1;
			list.add(num1);
		}else {
			num1 = 0;
			list.add(num1);
		}
		if(cardMapper.getDuiHuanInfo(dc.getCard2_id())!=null) {
			num2 = 1;
			list.add(num2);
		}else {
			num2 = 0;
			list.add(num2);
		}
		if(cardMapper.getDuiHuanInfo(dc.getCard3_id())!=null) {
			num3 = 1;
			list.add(num3);
		}else {
			num3 = 0;
			list.add(num3);
		}
		return list;
	}
	
	@Override
	public List<User_card> getUserCard(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return cardMapper.getUserCard(user_id);
	}

	@Override
	public void updateDC(int card_id) throws Exception {
		// TODO Auto-generated method stub
		cardMapper.updateDC(card_id);
	}

	@Override
	public void deleteDC(int card1_id, int card2_id, int card3_id) throws Exception {
		// TODO Auto-generated method stub
		int card_id ;
		card_id = card1_id;
		cardMapper.deleteDC(card_id);
		card_id = card2_id;
		cardMapper.deleteDC(card_id);
		card_id = card3_id;
		cardMapper.deleteDC(card_id);
	}

	@Override
	public void updateNum(User user) throws Exception {
		// TODO Auto-generated method stub
		user.setUser_cardNum(user.getUser_cardNum()-2);
		userMapper.update(user);
	}

	

	@Override
	public Card_type getTC_one(int card_id) throws Exception {
		// TODO Auto-generated method stub
		Card_type ct = new Card_type();
		ct = cardMapper.getTC_one(card_id);
		return ct;
	}

	@Override
	public void deleteCardToZhanfa(User user,int card_star) throws Exception {
		// TODO Auto-generated method stub
		int num = cardMapper.selectStarCard(card_star);
		cardMapper.deleteUC(card_star);
		if(card_star==2) {
			user.setUser_points(user.getUser_points()+(num*20));
		}else if(card_star==3) {
			user.setUser_points(user.getUser_points()+(num*50));
		}else if(card_star==4) {
			user.setUser_points(user.getUser_points()+(num*200));
		}else if(card_star==5) {
			user.setUser_points(user.getUser_points()+(num*500));
		}
		user.setUser_cardNum(user.getUser_cardNum()-num);
		userMapper.update(user);
	}

	@Override
	public User_card getCardlevel(int id) throws Exception {
		User_card uc = new User_card();
		uc = cardMapper.get_user_one_card(id);
		return uc;
	}

	@Override
	public void uplevel(int card_level,int id) throws Exception {
		// TODO Auto-generated method stub
		cardMapper.uplevel(card_level,id);
	}

	@Override
	public void del_user_one_card(User user, int id) {
		// TODO Auto-generated method stub
		try {
			User_card uc = cardMapper.get_user_one_card(id);
			cardMapper.del_user_one_card(id);
			if(uc.getCard_star().equals("5")) {
				user.setUser_points(user.getUser_points()+(uc.getCard_level()*128));
			}
			if(uc.getCard_star().equals("4")) {
				user.setUser_points(user.getUser_points()+(uc.getCard_level()*64));
			}
			if(uc.getCard_star().equals("3")) {
				user.setUser_points(user.getUser_points()+(uc.getCard_level()*32));
			}
			if(uc.getCard_star().equals("2")) {
				user.setUser_points(user.getUser_points()+(uc.getCard_level()*16));
			}
			user.setUser_cardNum(user.getUser_cardNum()-1);
			userMapper.update(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Card_piece getOnePiece(int id) throws Exception {
		// TODO Auto-generated method stub
		Card_piece card_piece = cardMapper.getOnePiece(id);
		return card_piece;
	}

	@Override
	public void insertUser_piece(User_piece user_piece) throws Exception {
		// TODO Auto-generated method stub
		cardMapper.insertUser_piece(user_piece);
		
	}

	@Override
	public User_piece seleteUser_piece(String user_id, int fragment_id) throws Exception {
		// TODO Auto-generated method stub
		User_piece user_piece = new User_piece();
		user_piece = cardMapper.seleteUser_piece(user_id,fragment_id);
		return user_piece;
	}

	@Override
	public void updateCard_piece(int id) throws Exception {
		// TODO Auto-generated method stub
		cardMapper.updateCard_piece(id);
	}

	@Override
	public void updateUser_piece(User_piece user_piece) throws Exception {
		// TODO Auto-generated method stub
		cardMapper.updateUser_piece(user_piece);
	}

	@Override
	public List<Card_type> seleteOwnCard(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return cardMapper.seleteOwnCard(user_id);
	}

	@Override
	public List<Card_type> seleteNotOwnCard(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return cardMapper.seleteNotOwnCard(user_id);
	}
	
	@Override
	public User_card getOneUserCard(String user_id, int card_id) throws Exception {
		// TODO Auto-generated method stub
		return cardMapper.getOneUserCard(user_id,card_id);
	}
	

}

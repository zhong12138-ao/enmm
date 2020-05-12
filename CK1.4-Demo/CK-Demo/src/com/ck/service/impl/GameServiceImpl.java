package com.ck.service.impl;

import java.sql.SQLException;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ck.dao.GameMapper;
import com.ck.pojo.Card_type;
import com.ck.service.GameService;
import com.ck.utils.UUIDUtils;

@Service
public class GameServiceImpl implements GameService {

	@Autowired
	private GameMapper gameMapper;

	

	@Override
	public Card_type getOneCCByRank(int rank) throws SQLException {
		// TODO Auto-generated method stub
		Card_type ct = new Card_type();
		ct = gameMapper.getOneCCByRank(rank);
		return ct;
	}
}

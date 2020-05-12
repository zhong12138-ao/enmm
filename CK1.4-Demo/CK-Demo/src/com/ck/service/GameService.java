package com.ck.service;

import java.sql.SQLException;


import org.springframework.stereotype.Service;

import com.ck.pojo.Card_type;
@Service
public interface GameService {

	Card_type getOneCCByRank(int rank) throws SQLException;
	
}

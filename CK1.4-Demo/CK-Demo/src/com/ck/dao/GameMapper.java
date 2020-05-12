package com.ck.dao;

import java.sql.SQLException;



import org.springframework.stereotype.Repository;

import com.ck.pojo.Card_type;
@Repository
public interface GameMapper {

	
	Card_type getOneCCByRank(int rank) throws SQLException;


	

}

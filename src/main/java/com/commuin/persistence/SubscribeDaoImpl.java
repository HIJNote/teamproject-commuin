package com.commuin.persistence;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Subscribe;

@Repository
public class SubscribeDaoImpl implements SubscribeDao {
	@Autowired
	SqlSessionTemplate mybatis;

	@Override
	public int selectSubscribe(Subscribe subscribe) {

		return mybatis.selectOne("subscribe.selectSubscribeCheck", subscribe);
	}

	@Override
	public void insertsubscribe(Subscribe subscribe) {
		
		 mybatis.insert("subscribe.insertSubscribe", subscribe);
		 mybatis.update("subscribe.updateCountUp", subscribe);
	}

	@Override
	public void deletesubscribe(Subscribe subscribe) {
		mybatis.delete("subscribe.deleteSubscribe", subscribe);
		 mybatis.update("subscribe.updateCountDown", subscribe);
	}
	
	
}

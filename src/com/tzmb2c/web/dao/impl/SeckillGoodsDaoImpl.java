/*
 * 文 件 名:  SeckillGoodsDaoImpl.java
 * 创 建 人:  admin
 * 创建时间:  2016-10-26
 */
package com.tzmb2c.web.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tzmb2c.web.dao.SeckillGoodsDao;
import com.tzmb2c.web.pojo.SeckillGoodsPojo;
import com.tzmb2c.web.mapper.SeckillGoodsMapper;

/**
 * SeckillGoods Dao层
 */
public class SeckillGoodsDaoImpl implements SeckillGoodsDao {
	
    @Autowired
    private SeckillGoodsMapper seckillGoodsMapper;
    
	public int add(SeckillGoodsPojo seckillGoods) throws SQLException{
		if(null == seckillGoods){
			return 0;
		}
        int rows = seckillGoodsMapper.insert(seckillGoods);
        return rows;
	}

    public int update(SeckillGoodsPojo seckillGoods) throws SQLException{
		if(null == seckillGoods){
			return 0;
		}
        int rows = seckillGoodsMapper.update(seckillGoods);
        return rows;
    }
    
    public int delete(Long id) throws SQLException{
		if(null == id){
			return 0;
		}
        int rows = seckillGoodsMapper.deleteById(id);
        return rows;
    }
    
    public SeckillGoodsPojo getById(Long id) throws SQLException{
		if(null == id){
			return null;
		}
		SeckillGoodsPojo seckillGoods = seckillGoodsMapper.getById(id);
        return seckillGoods;
    }
	
	public Integer countBy(Map<String, Object> params) throws SQLException{
		Integer rows = seckillGoodsMapper.countBy(params);
		return rows;
	}
	
	public List<SeckillGoodsPojo> listPage(Map<String, Object> params) throws SQLException{
		List<SeckillGoodsPojo> lists = seckillGoodsMapper.listPage(params);		
		return lists;
	}
}

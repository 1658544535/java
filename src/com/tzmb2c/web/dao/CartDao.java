package com.tzmb2c.web.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.tzmb2c.web.pojo.CartPojo;

public interface CartDao {

  List<CartPojo> getCartAll() throws SQLException;

  List<CartPojo> getCartAllByShopId(Map<String, Object> map) throws SQLException;

  void insertCart(CartPojo cartPojo) throws SQLException;

  void updateCart(CartPojo cartPojo) throws SQLException;

  void updateNumCartWeb(CartPojo cartPojo) throws SQLException;

  int updateStatusCartWeb(String[] ids) throws SQLException;

  CartPojo getfindByIdCart(Long id) throws SQLException;

  void deleteCart(Long id) throws SQLException;

  void deleteCarts(String[] ids) throws SQLException;

  int cartAllCount(Map<String, Object> map);

  int findCartByUserIdCount(Long id);

  List<CartPojo> cartAllList(Map<String, Object> map);

  CartPojo findCartById(Long id) throws SQLException;

  CartPojo findCartByProductId(CartPojo cartPojo) throws SQLException;

  CartPojo findCartByUserId(CartPojo cartPojo) throws SQLException;

  List<CartPojo> findCartByUserId(Long id) throws SQLException;

  List<CartPojo> findCartByShopUserId(Long id) throws SQLException;

  List<CartPojo> findCartShopByUserId(Long id) throws SQLException;

  List<CartPojo> getCartsByIds(String[] ids) throws SQLException;

  List<CartPojo> getCartsByIdsSummit(String[] ids) throws SQLException;

  public List<CartPojo> submitCartsByIds(String[] ids) throws SQLException;// 按专场分组商品

  List<CartPojo> findCartByUserIdAndShopId(CartPojo cartDaoPojo) throws SQLException;

  public List<CartPojo> groupCartBrandByUserId(Long id) throws SQLException;

  public List<CartPojo> findCartByUserIdAndBrand(CartPojo cartDaoPojo) throws SQLException;

}

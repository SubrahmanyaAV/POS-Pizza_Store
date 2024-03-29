package com.cruds.pos.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.cruds.pos.bean.CartBean;
import com.cruds.pos.bean.OrderBean;
import com.cruds.pos.bean.StoreBean;
import com.cruds.pos.exception.POSException;
import com.cruds.pos.form.CartFormBean;
import com.cruds.pos.form.OrderFormBean;

public interface CustomerService {
	
	public boolean addToCart(CartBean cart) throws POSException;
	
	public CartBean edit(int cartID); 
	
	boolean modifyCart(CartBean cart) throws POSException;
	
	OrderBean confirmOrderDetails(OrderBean order);
	OrderBean confirmOrder(OrderFormBean order);
	
	OrderBean cancelOrder(String orderID);
	
	public void Update(CartBean cart);
	
	public Set<StoreBean> searchStore(String city);//ArrayList<StoreBean> viewStore(String city);
	
	ArrayList<CartBean> viewCart();
	
	ArrayList <OrderBean> viewOrder();
	
	boolean addToCartFood(CartFormBean cart) throws POSException;//boolean addToCart(CartBean cart);
	public List<CartBean> list(Long customer_id);
}

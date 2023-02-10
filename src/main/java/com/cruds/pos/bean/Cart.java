package com.cruds.pos.bean;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Cart {
	
	private List<FoodBean> list;
	private LocalDate orderDate;
	private double total;
	
	public void add(FoodBean fb)
	{
		if(list == null)
		{
			list = new ArrayList<>();
		}
		list.add(fb);
		orderDate = LocalDate.now();
		total = total + fb.getPrice();
	}
	
	public List<FoodBean> getList() {
		return list;
	}

	public double getTotal() {
		return total;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Cart [list=" + list + "]";
	}


}

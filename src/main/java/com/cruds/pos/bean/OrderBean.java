package com.cruds.pos.bean;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="orders")
public class OrderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="o_id")
	private Long o_id;

	@Column(length=6,name="orderID")
	private String orderID;			

	@Column(name="orderDate",nullable = false)
	private LocalDate orderDate;

	@Column(name="totalPrice",nullable = false)
	private double totalPrice;

	@Column(name="orderStatus",length=15)
	private String orderStatus;

	@ManyToOne
	@JoinColumn(name="customer_id")
	private CredentialsBean credentials;

	@ManyToOne
	@JoinColumn(name="s_id")
	private StoreBean store;

	/*	@ManyToOne
	@JoinColumn(name="cartID")
	private CartBean cart;
	 */	
	
	public OrderBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderBean(String orderID, LocalDate orderDate, double totalPrice, String orderStatus) {
		super();
		this.orderID = orderID;
		this.orderDate = orderDate;
		this.totalPrice = totalPrice;
		this.orderStatus = orderStatus;
	}

	public OrderBean(String orderID, LocalDate orderDate, double totalPrice, String orderStatus,
			CredentialsBean credentials, StoreBean store) {
		super();
		this.orderID = orderID;
		this.orderDate = orderDate;
		this.totalPrice = totalPrice;
		this.orderStatus = orderStatus;
		this.credentials = credentials;
		this.store = store;
	}

	public Long getO_id() {
		return o_id;
	}

	public void setO_id(Long o_id) {
		this.o_id = o_id;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public CredentialsBean getCredentials() {
		return credentials;
	}

	public void setCredentials(CredentialsBean credentials) {
		this.credentials = credentials;
	}

	public StoreBean getStore() {
		return store;
	}

	public void setStore(StoreBean store) {
		this.store = store;
	}

	@Override
	public String toString() {
		return "OrderBean [o_id=" + o_id + ", orderID=" + orderID + ", orderDate=" + orderDate + ", totalPrice="
				+ totalPrice + ", orderStatus=" + orderStatus + ",  credentials=" + credentials
				+ ", store=" + store + "]";
	}

}

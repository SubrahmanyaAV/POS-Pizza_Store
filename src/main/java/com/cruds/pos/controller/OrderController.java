package com.cruds.pos.controller;

import java.time.LocalDate;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cruds.pos.bean.Cart;
import com.cruds.pos.bean.CredentialsBean;
import com.cruds.pos.bean.OrderBean;
import com.cruds.pos.bean.StoreBean;
import com.cruds.pos.form.OrderFormBean;
import com.cruds.pos.service.CustomerServiceImpl;

@Controller
public class OrderController {
	
	@Autowired
	CustomerServiceImpl customerService;
	
	@RequestMapping(value = "order.html", method= RequestMethod.GET)
	public String ShowOrder(Model model)
	{
		model.addAttribute("command", new OrderFormBean());
		model.addAttribute("ORDERS", customerService.viewOrder());
		return "order";	
	}
	
	@RequestMapping(value="order.html", method=RequestMethod.POST)
	public String order(@ModelAttribute ("OrderFormBean") OrderFormBean orderFormBean
			,RedirectAttributes redirectAttributes,HttpSession session)
	{
		customerService.confirmOrder(orderFormBean);
/*		
		CredentialsBean c = new CredentialsBean("admin", "secret", "A", 0, "Y");
		StoreBean sb = new StoreBean("1", "XYZ Pizza", "1st Cross", "12345", "Tumkur", "Karnataka", "572101");
		OrderBean ob = new OrderBean("1", LocalDate.now(), 399, "Success", "SS Puram", "Tumkur", "Karnataka", "572102", "12345", c, sb);

*/
/*		
		customerService.confirmOrder(new OrderFormBean("admin", "secret", 0, 1
				, "1", LocalDate.now(), 399, "Success", "SS Puram", "Tumkur", "Karnataka", "572102"
				, "12345","1", "XYZ Pizza", "1st Cross", "12345", "Tumkur", "Karnataka", "572101")
				,cb);
		
*/		return "order";
		
/*		if(customerService.confirmOrder(orderFormBean,cb) != null)
		{
			redirectAttributes.addFlashAttribute("MESSAGE", "Thank You,Order Placed Successfully");
			redirectAttributes.addFlashAttribute("neworder", orderFormBean);
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "Unknown error while ordering!");
		}
		return "order";
*/	}
	
	@RequestMapping(value = "addorder.html", method= RequestMethod.GET)
	public String ShowProfileForm(Model model)
	{
		model.addAttribute("order", new OrderBean());
		model.addAttribute("VIEWORDER", customerService.viewOrder());
		return "order";	
	}
	
	@RequestMapping(value="addorder.html", method=RequestMethod.POST)
	public String orderList(HttpSession session)
	{
		Cart cart = (Cart) session.getAttribute("CART");
		
		CredentialsBean cb = (CredentialsBean) session.getAttribute("USER");
		CredentialsBean c = new CredentialsBean(cb.getId());
		
		StoreBean sb = (StoreBean) session.getAttribute("STORE");
		StoreBean s = new StoreBean(sb.getId());
		
		String uniqueID = UUID.randomUUID().toString();
		String orderID = uniqueID.substring(0, 10); 
	
		customerService.confirmOrderDetails(new OrderBean(orderID, LocalDate.now(), cart.getTotal(), "Success",c,s));
		return "order";
	}
	

	@RequestMapping(value="/order-del-{orderID}", method=RequestMethod.GET)
	public String Cancel(@PathVariable("orderID") String orderID)
	{
		customerService.cancelOrder(orderID);
		System.out.println("cancel order " + orderID);
		return "cancelorder";
	}


}

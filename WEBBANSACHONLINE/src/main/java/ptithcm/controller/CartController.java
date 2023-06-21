package ptithcm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.dao.CartDao;
import ptithcm.dao.InvoiceDao;
import ptithcm.model.Cart;
import ptithcm.model.Member;
import ptithcm.model.Role;

@Controller
@RequestMapping("cart")
public class CartController {
	CartDao cartDao = new CartDao();
	InvoiceDao invoiceDao = new InvoiceDao();
	public static boolean checkAddCart = false;
	
	@RequestMapping("del/{id}")
	public String delete(@PathVariable("id") int id) {
		if (MemberController.roleLoginForm.getId() == 2) {
			System.out.println("vo del xoa sp: " + id);
			cartDao.delete(id);
			return "redirect:/cart/index.htm";
		}else{
			return "redirect:/cart/index.htm";
		}
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Model model, Cart cart, HttpServletRequest request, HttpServletResponse response) {

		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {

				return "redirect:/home/products/1.htm";
			}
			// Member
			else if (MemberController.roleLoginForm.getId() == 2) {
				cart.setMemberId(MemberController.memberLoginForm.getId());
				cartDao.add(cart);
				model.addAttribute("list", cartDao.getCarts(MemberController.memberLoginForm.getId()));
				return "redirect:/cart/index.htm";
			}
			// not login
			else {
				return "redirect:/user/login.htm";
			}
		}
		// not login
		else {
			return "redirect:/user/login.htm";
		}
	}
	
	@RequestMapping("index")
	public String index(Model model, HttpServletRequest request) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				return "redirect:/home/products/1.htm";
			}

			// member
			if (MemberController.roleLoginForm.getId() == 2) {
				model.addAttribute("list", cartDao.getCarts(MemberController.memberLoginForm.getId()));
				return "cart/index";
			}
			// not exist
			else {
				return "redirect:/user/login.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
	
	@ModelAttribute("cartNumber")
	public int getCartCount() {
		int cartcount = 0;
		if (MemberController.memberLoginForm != null) {
			cartcount = cartDao.getCarts(MemberController.memberLoginForm.getId()).size();
		}

		return cartcount;
	}

	@ModelAttribute("memberLoginForm")
	public Member getMember() {
		return MemberController.memberLoginForm;
	}

	@ModelAttribute("roleLogin")
	public Role getRole() {
		return MemberController.roleLoginForm;
	}

}

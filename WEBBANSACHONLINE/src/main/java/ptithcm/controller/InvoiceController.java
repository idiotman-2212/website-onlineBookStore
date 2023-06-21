package ptithcm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.dao.InvoiceDao;
import ptithcm.model.Invoice;
import ptithcm.model.Member;
import ptithcm.model.Role;
import ptithcm.dao.CartDao;

@Transactional
@Controller
public class InvoiceController {
	InvoiceDao invoiceDao = new InvoiceDao();
	CartDao cartDao = new CartDao();
	
	@RequestMapping(value = "cart/checkout")
	public String checkout(Model model, HttpServletRequest request) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				return "redirect:/home/products/1.htm";
			}
			// Member
			else if (MemberController.roleLoginForm.getId() == 2) {
				model.addAttribute("invoice", new Invoice());
				return "cart/checkout";
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
	
	@RequestMapping(value = "cart/checkout", method = RequestMethod.POST)
	public String checkout(Model model, @ModelAttribute("invoice") Invoice invoice, BindingResult errors) {
		System.out.println("voo daay nef");
		System.out.println("voo emami" + invoice.getEmail());
		System.out.println("voo daay address" + invoice.getTel());
		System.out.println("voo daay tel" + invoice.getAddress());
		if (invoice != null) {
			System.out.println("co khac rong ");
			if (invoice.getEmail().trim().equals("")) {
				errors.rejectValue("email", "invoice", "Vui lòng nhập email");
			}
			if (invoice.getTel().trim().equals("")) {
				errors.rejectValue("tel", "invoice", "Vui lòng nhập số điện thoại");
			}
			if (invoice.getAddress().trim().equals("")) {
				errors.rejectValue("address", "invoice", "Vui lòng nhập address");
			}
			if (!invoice.getEmail().trim().equals("") && !invoice.getTel().trim().equals("")
					&& !invoice.getAddress().trim().equals("")) {

				System.out.println();
				// System.out.println("member id: " +
				// MemberController.memberLoginForm.getId());
				// if (MemberController.memberLoginForm != null) {
				invoice.setMemberId(MemberController.memberLoginForm.getId());
				// }
				invoiceDao.add(invoice);
				return "redirect:/user/invoices.htm";
			}

		} else {
			System.out.println("cart rong");
		}
		return "cart/checkout";
	}
	
	// show list invoice
	@RequestMapping("user/invoices")
	public String index(Model model) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				return "redirect:/home/products/1.htm";
			} else if (MemberController.roleLoginForm.getId() == 2) {
				model.addAttribute("list", invoiceDao.getAllInvoice(MemberController.memberLoginForm.getId()));
				return "order/list";
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
	
	// cancel invoice
	@RequestMapping("user/invoice/cancel/{id}")
	public String cancel(@PathVariable("id") int id) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				return "redirect:/home/products/1.htm";
			} else if (MemberController.roleLoginForm.getId() == 2) {
				System.out.println("vo del");
				invoiceDao.cancel(id);
				return "redirect:/user/invoices.htm";
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
	
	// show list invoice
	@RequestMapping("user/invoice/detail/{id}")
	public String invoiceDetail(Model model,@PathVariable("id") int id) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				return "redirect:/home/products/1.htm";
			} else if (MemberController.roleLoginForm.getId() == 2) {
				model.addAttribute("list", invoiceDao.getAllInvoiceDdetail(id));
				return "order/detail";
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
	
	@ModelAttribute("cartNumber")
	public int getCartCount() {
		CartDao cartDao = new CartDao();
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

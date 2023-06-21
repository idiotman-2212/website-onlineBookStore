package ptithcm.controller;

import java.io.UnsupportedEncodingException;
import java.util.ResourceBundle;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

import ptithcm.dao.MemberDao;
import ptithcm.helper.Helper;
import ptithcm.model.Member;
import ptithcm.model.Role;
import ptithcm.dao.CartDao;

@Transactional
@Controller
public class MemberController {
	@Autowired
	JavaMailSender mailer;

	MemberDao memberDao = new MemberDao();
	public static Role roleLoginForm;
	public static Member memberLoginForm;

	// show list emp
	@RequestMapping("admin/users")
	public String index(Model model) {
		if (MemberController.roleLoginForm != null) {
			if (MemberController.roleLoginForm.getId() == 1) {
				model.addAttribute("list", memberDao.getAllMember());
				return "member/list";
			} else {
				return "redirect:/home/products/1.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
	
	// Del emp
	@RequestMapping("admin/user/del/{id}")
	public String delete(@PathVariable("id") int id) {
		if (MemberController.roleLoginForm != null) {
			if (MemberController.roleLoginForm.getId() == 1) {
				System.out.println("vo del");
				memberDao.delete(id);
				return "redirect:/admin/users.htm";
			} else {
				return "redirect:/home/products/1.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
	
	@RequestMapping(value = "admin/user/dels.htm", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, ModelMap model) {
		if (MemberController.roleLoginForm != null) {
			if (MemberController.roleLoginForm.getId() == 1) {
				String arrAuthorID[] = request.getParameterValues("authorIds");
				try {
					if (arrAuthorID.length != 0) {
						for (String id : arrAuthorID) {
							memberDao.delete(Integer.parseInt(id));
						}
						model.addAttribute("list", memberDao.getAllMember());
					}
					return "redirect:/admin/users.htm";
				} catch (Exception e) {
					model.addAttribute("error", e.getMessage());
					model.addAttribute("list", memberDao.getAllMember());
					return "redirect:/admin/users.htm";
				}
			} else {
				return "redirect:/home/products/1.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
		
	// Insert emp
	@RequestMapping("admin/user/add")
	public String add(Model model, HttpServletRequest request, HttpServletResponse response) {
		if (MemberController.roleLoginForm != null) {
			if (MemberController.roleLoginForm.getId() == 1) {
				model.addAttribute("member", new Member());
				return "member/add";
			} else {
				return "redirect:/home/products/1.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}	
		
	@RequestMapping(value = "admin/user/add", method = RequestMethod.POST)
	public String addMember(Model model, @ModelAttribute("member") Member member, BindingResult errors,
			HttpServletRequest request, HttpServletResponse response) {
		if (MemberController.roleLoginForm != null) {
			if (MemberController.roleLoginForm.getId() == 1) {
				if (member.getUsername().trim().equals("")) {
					errors.rejectValue("username", "member", "VUI LÒNG NHẬP HỌ TÊN NHÂN VIÊN !");
				}
				if (member.getEmail().trim().equals("")) {
					errors.rejectValue("email", "member", "VUI LÒNG NHẬP EMAIL !");
				} else if (memberDao.getMemberIDByEmail(member.getEmail()) != -1) {
					errors.rejectValue("email", "member", "Email đã tồn tại!");
				} else if (Helper.checkEmail(member.getEmail().trim()) == false) {
					errors.rejectValue("email", "member", "EMAIL KHÔNG HỢP LỆ !");
				}
				if (member.getPassword().trim().equals("")) {
					errors.rejectValue("password", "member", "VUI LÒNG NHẬP MẬT KHẨU !");
				}
				if (member.getTel().trim().equals("")) {
					errors.rejectValue("tel", "member", "VUI LÒNG NHẬP SỐ ĐIỆN THOẠI !");
				} else if (memberDao.getMemberIDByPhone(member.getTel()) != -1) {
					errors.rejectValue("tel", "member", "SỐ ĐIỆN THOẠI ĐÃ TỒN TẠI !");
				} else if (Helper.isValidPhone(member.getTel().trim()) == false) {
					errors.rejectValue("tel", "member", "SỐ ĐIỆN THOẠI KHÔNG HỢP LỆ !");
				}
				if (Helper.checkEmail(member.getEmail().trim()) == false
						|| memberDao.getMemberIDByEmail(member.getEmail()) != -1
						|| Helper.isValidPhone(member.getTel().trim()) == false
						|| memberDao.getMemberIDByPhone(member.getTel()) != -1 || member.getTel().trim().equals("")
						|| member.getPassword().trim().equals("") || member.getEmail().trim().equals("")
						|| member.getUsername().trim().equals("")) {
					return "member/add";
				} else {
					memberDao.addEmployee(member);
					return "member/add";
				}
			} else {
				return "redirect:/user/login.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
		
	// Edit emp
	@RequestMapping(value = "admin/user/edit/{id}", method = RequestMethod.GET)
	public String edit(Model model, @PathVariable("id") int id, HttpServletRequest request,
			HttpServletResponse response) {
		if (MemberController.roleLoginForm != null) {
			if (MemberController.roleLoginForm.getId() == 1) {
				System.out.println("vô edit tren");
				model.addAttribute("member", memberDao.getMember(id));
				System.out.println("add attribute rooif");
				return "member/edit";
			} else {
				return "redirect:/user/login.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
		
	@RequestMapping(value = "admin/user/edit", method = RequestMethod.POST)
	public String edit(Model model, @ModelAttribute("member") Member member, BindingResult errors,
			HttpServletRequest request, HttpServletResponse response) {
		if (MemberController.roleLoginForm != null) {
			if (MemberController.roleLoginForm.getId() == 1) {
				if (member.getUsername().trim().equals("")) {
					System.out.println("user name rong");
					errors.rejectValue("username", "member", "Vui lòng nhập tên người dùng!");
				}
				if (member.getEmail().trim().equals("")) {
					System.out.println("mail name rong");
					errors.rejectValue("email", "member", "Vui lòng nhập email!");
				}
				// mail da ton tai
				else if (memberDao.getMemberIDByEmail(member.getEmail()) > 1) {
					errors.rejectValue("email", "member", "Email đã tồn tại!");
				}
				// mail k hop le
				else if (Helper.checkEmail(member.getEmail().trim()) == false) {
					errors.rejectValue("email", "member", "EMAIL KHÔNG HỢP LỆ !");
				}
				if (member.getPassword().trim().equals("")) {
					System.out.println("pass name rong");
					errors.rejectValue("password", "member", "Vui lòng nhập password!");
				}
				if (member.getTel().trim().equals("")) {
					System.out.println("tel name rong");
					errors.rejectValue("tel", "member", "Vui lòng nhập số điện thoại!");
				}
				// so dt da ton tai
				else if (memberDao.getMemberIDByPhone(member.getTel()) > 1) {
					errors.rejectValue("tel", "member", "Số điện thoại đã tồn tại!");
				}
				// so dt k hop le
				else if (Helper.isValidPhone(member.getTel().trim()) == false) {
					errors.rejectValue("tel", "member", "Số điện thoại không hợp lệ!");
				}
				//
				if (memberDao.getMemberIDByEmail(member.getEmail()) > 1
						|| memberDao.getMemberIDByPhone(member.getTel()) > 1 || member.getTel().trim().equals("")
						|| member.getPassword().trim().equals("") || member.getEmail().trim().equals("")
						|| member.getUsername().trim().equals("")) {
					return "member/edit";
				} else {
					memberDao.edit(member);
					return "redirect:/admin/users.htm";
				}
			} else {
				return "redirect:/user/login.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
		
	@RequestMapping(value = "user/register")
	public String register(Model model) {
		model.addAttribute("member", new Member());
		return "member/register";
	}
		
	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	public String register(Model model, @ModelAttribute("member") Member member, BindingResult errors)
			throws UnsupportedEncodingException {
		ResourceBundle labels = ResourceBundle.getBundle("login", LocaleContextHolder.getLocale());// );
		if (member.getUsername().trim().equals("")) {
			errors.rejectValue("username", "member",
					new String(labels.getString("label.errNoName").getBytes("ISO-8859-1"), "UTF-8"));
		}
		if (member.getEmail().trim().equals("")) {
			errors.rejectValue("email", "member",
					new String(labels.getString("label.errNoEmail").getBytes("ISO-8859-1"), "UTF-8"));
		} else if (memberDao.getMemberIDByEmail(member.getEmail()) != -1) {
			errors.rejectValue("email", "member",
					new String(labels.getString("label.errEmailExist").getBytes("ISO-8859-1"), "UTF-8"));
		} else if (Helper.checkEmail(member.getEmail().trim()) == false) {
			errors.rejectValue("email", "member", labels.getString("label.errEmailValid"));
		}
		if (member.getPassword().trim().equals("")) {
			errors.rejectValue("password", "member",
					new String(labels.getString("label.errNoPass").getBytes("ISO-8859-1"), "UTF-8"));
		} else if (Helper.checkPassword(member.getPassword().trim()) == false) {
			errors.rejectValue("password", "member",
					new String(labels.getString("label.errPassToWeak").getBytes("ISO-8859-1"), "UTF-8"));
		}
		if (member.getTel().trim().equals("")) {
			errors.rejectValue("tel", "member",
					new String(labels.getString("label.errNoPhone").getBytes("ISO-8859-1"), "UTF-8"));
		} else if (memberDao.getMemberIDByPhone(member.getTel()) != -1) {
			errors.rejectValue("tel", "member",
					new String(labels.getString("label.errPhoneExist").getBytes("ISO-8859-1"), "UTF-8"));
		} else if (Helper.isValidPhone(member.getTel().trim()) == false) {
			errors.rejectValue("tel", "member",
					new String(labels.getString("label.errPhoneValid").getBytes("ISO-8859-1"), "UTF-8"));
		}
		if (Helper.checkPassword(member.getPassword().trim()) == false
				|| Helper.isValidPhone(member.getTel().trim()) == false
				|| Helper.checkEmail(member.getEmail().trim()) == false
				|| memberDao.getMemberIDByEmail(member.getTel()) != -1
				|| memberDao.getMemberIDByEmail(member.getEmail()) != -1 || member.getTel().trim().equals("")
				|| member.getPassword().trim().equals("") || member.getEmail().trim().equals("")
				|| member.getUsername().trim().equals("")) {
			return "member/register";
		} else {
			memberDao.add(member);
			return "redirect:/user/login.htm";
		}
	}
		
	@RequestMapping(value = "user/logout", method = RequestMethod.GET)
	public String logout(HttpServletResponse response, HttpServletRequest request, ModelMap model) {
		MemberController.memberLoginForm = null;
		MemberController.roleLoginForm = null;
		return "redirect:/home/products/1.htm";
	}

	@RequestMapping(value = "user/login", method = RequestMethod.GET)
	public String showLogin(ModelMap model) {
		model.addAttribute("member", new Member());
		return "member/login";
	}
		
	@RequestMapping(value = "user/login", method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute("member") Member member, BindingResult errors,
			HttpServletResponse response, HttpServletRequest request) {

		System.out.println("email: " + member.getEmail());
		System.out.println("passs: " + member.getPassword());
		if (member.getEmail().trim().equals("")) {
			System.out.println("email login rong");
			errors.rejectValue("email", "member", "Vui lòng nhập email!");
		} else if (Helper.checkEmail(member.getEmail().trim()) == false) {
			errors.rejectValue("email", "member", "Email không hợp lệ!");
		}

		if (member.getPassword().trim().equals("")) {
			System.out.println("password login rong");
			errors.rejectValue("password", "member", "Vui lòng nhập password!");
		}
		// login
		if (Helper.checkEmail(member.getEmail().trim()) == false || member.getEmail().trim().equals("")
				|| member.getPassword().trim().equals("")) {
			return "member/login";
		} else {
			if (memberDao.getMemberIDByEmail(member.getEmail()) != -1
					|| memberDao.getMemberIDByPhone(member.getTel()) != -1) {
				System.out.println("co email pass");
				Member memberLogin = memberDao.login(member.getPassword(), member.getEmail());
				if (memberLogin != null) {
					System.out.println("login thanh cong");
					memberLoginForm = memberLogin;
					Role rolelogin = memberDao.getRoleLogin(memberLogin.getId());
					if (rolelogin != null) {
						MemberController.roleLoginForm = rolelogin;
						/*
						 * Cookie cookieMail = new Cookie("userEmail",
						 * memberLogin.getEmail());
						 * cookieMail.setPath(request.getServletContext().
						 * getContextPath()); cookieMail.setMaxAge(30 * 24 *
						 * 3600); response.addCookie(cookieMail);
						 * 
						 * Cookie cookieID = new Cookie("userID",
						 * memberLogin.getId().toString());
						 * cookieID.setPath(request.getServletContext().
						 * getContextPath()); cookieID.setMaxAge(30 * 24 *
						 * 3600); response.addCookie(cookieID);
						 * 
						 * Cookie cookielogin = new Cookie("userPass",
						 * memberLogin.getPassword());
						 * cookielogin.setPath(request.getServletContext().
						 * getContextPath()); cookielogin.setMaxAge(30 * 24 *
						 * 3600); response.addCookie(cookielogin);
						 * 
						 * Cookie cookie = new Cookie("userRole",
						 * rolelogin.getId().toString());
						 * cookie.setPath(request.getServletContext().
						 * getContextPath()); cookie.setMaxAge(30 * 24 * 3600);
						 * response.addCookie(cookie);
						 */

						return "redirect:/admin/authors.htm";
					}
				} else {
					System.out.println("dang nhap that bai");
					errors.rejectValue("password", "member", "Mật khẩu không đúng!");
				}

			}
			// email password k ton tai
			else {
				errors.rejectValue("email", "member", "Email   không tồn tại trong hệ thống!");
			}
		}

		return "member/login";
	}

		@RequestMapping("user/forgot")
		public String showForgot(ModelMap model) {
			model.addAttribute("member", new Member());
			return "member/forgot";
		}
		
		@RequestMapping(value = "user/forgot", method = RequestMethod.POST)
		public String resetPassWord(ModelMap model, @ModelAttribute("member") Member member, BindingResult errors) {
			if (member.getEmail().trim().equals("")) {
				System.out.println("mail forgot rong");
				errors.rejectValue("email", "member", "Vui lòng nhập email!");
			} else if (Helper.checkEmail(member.getEmail().trim()) == false) {
				errors.rejectValue("email", "member", "Email không hợp lệ!");
			} else if (memberDao.getMemberIDByEmail(member.getEmail()) == -1) {
				errors.rejectValue("email", "member", "Email chưa tạo tài khoản trong hệ thống");
			} else {
				System.out.println("mail forgot :" + member.getEmail());
				try { // Tạo mail
					MimeMessage mail = mailer.createMimeMessage(); // Sử
					// dụng lớp trợ giúp
					MimeMessageHelper helper = new MimeMessageHelper(mail);
					helper.setFrom("n20dccn125@student.ptithcm.edu.vn", "LẤY LẠI MẬT KHẨU WEB BÁN SÁCH ONLINE");
					helper.setTo(member.getEmail());
					helper.setReplyTo("n20dccn125@student.ptithcm.edu.vn", "n20dccn125@student.ptithcm.edu.vn");
					helper.setSubject("RESET PASSWORD");
					String password = Helper.randomPassword();
					helper.setText("MẬT KHẨU KHÔI PHỤC MẶc ĐỊNH CỦA BẠN LÀ: " + password + ".\n XIN CẢM ƠN !", true);

					// Gửi mail
					mailer.send(mail);
					if (memberDao.updatePassword(password, member.getEmail()) > 0) {
						model.addAttribute("message", "dat mat khau thanh cong !");
						return "redirect:/user/login.htm";
					} else {
						model.addAttribute("message", "dat mat khau that bai!");
					}
				} catch (Exception ex) {
					model.addAttribute("message", "Gửi email thất bại !");
				}
			}
			return "member/forgot";

		}
		
		@RequestMapping(value = "user/edit", method = RequestMethod.GET)
		public String editUser(Model model, HttpServletRequest request, HttpServletResponse response) {
			if (MemberController.roleLoginForm != null) {
				model.addAttribute("member", memberDao.getMember(MemberController.memberLoginForm.getId()));
				return "member/edit_user";
			} else {
				return "redirect:/user/login.htm";
			}
		}
		
		@RequestMapping(value = "user/edit", method = RequestMethod.POST)
		public String editUser(Model model, @ModelAttribute("member") Member member, BindingResult errors,
				HttpServletRequest request, HttpServletResponse response) {

			if (MemberController.roleLoginForm != null) {
				if (member.getUsername().trim().equals("")) {
					errors.rejectValue("username", "member", "VUI LÒNG NHẬP TÊN NGƯỜI DÙNG !");
				}
				if (member.getEmail().trim().equals("")) {
					errors.rejectValue("email", "member", "VUI LÒNG NHẬP EMAIL !");
				}
				else if (memberDao.getMemberIDByEmail(member.getEmail()) > 1) {
					errors.rejectValue("email", "member", "EMAIL ĐÃ TỒN TẠI !");
				}
				else if (Helper.checkEmail(member.getEmail().trim()) == false) {
					errors.rejectValue("email", "member", "EMAIL KHÔNG HỢP LỆ !");
				}

				if (member.getPassword().trim().equals("")) {
					System.out.println("pass name rong");
					errors.rejectValue("password", "member", "VUI LÒNG NHẬP MẬT KHẨU !");
				}

				if (member.getTel().trim().equals("")) {
					System.out.println("tel name rong");
					errors.rejectValue("tel", "member", "VUI LÒNG NHẬP SỐ ĐIỆN THOẠI !");
				}
				// so dt da ton tai
				else if (memberDao.getMemberIDByPhone(member.getTel()) > 1) {
					errors.rejectValue("tel", "member", "SỐ ĐIỆN THOẠI ĐÃ TỒN TẠI !");
				}
				// so dt k hop le
				else if (Helper.isValidPhone(member.getTel().trim()) == false) {
					errors.rejectValue("tel", "member", "SỐ ĐIỆN THOẠI KHÔNG HỢP LỆ !");
				}

				//k hop le
				if (memberDao.getMemberIDByEmail(member.getEmail()) > 1 || memberDao.getMemberIDByPhone(member.getTel()) > 1
						|| member.getTel().trim().equals("") || member.getPassword().trim().equals("")
						|| member.getEmail().trim().equals("") || member.getUsername().trim().equals("")) {
					return "member/edit_user";

				} else {

					System.out.println("edit user 3:"+member.getPassword());
					memberDao.edit(member);
					MemberController.memberLoginForm = member;
					return "redirect:/home/products/1.htm";
				}
			} else {
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

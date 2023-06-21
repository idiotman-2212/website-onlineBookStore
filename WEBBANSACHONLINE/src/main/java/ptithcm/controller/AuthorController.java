package ptithcm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.dao.AuthorDao;
import ptithcm.model.Author;
import ptithcm.model.Member;
import ptithcm.model.Role;

@Controller
public class AuthorController {
	private AuthorDao authorDao = new AuthorDao();
	
	// show list author
	@RequestMapping("admin/authors")
	public String index(Model model) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {

				model.addAttribute("list", authorDao.getAllAuthor());
				return "author/list";
			} else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
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
	
	// Insert Author
	@RequestMapping("admin/author/add.htm")
	public String add() {
		return "author/add";
	}
	
	@RequestMapping(value = "admin/author/add.htm", method = RequestMethod.POST)
	public String addPost(Author author) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {

				// if insert success, then return back to admin/authors.htm page
				if (authorDao.insert(author) == 1) {
					return "redirect:/admin/authors.htm";
				}
				// if not, still be there
				return "author/add";
			} else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
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
	
	//del author
	@RequestMapping("admin/author/del/{id}")
	public String delete(@PathVariable("id") int id) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				System.out.println("vo del");
				authorDao.delete(id);
				return "redirect:/admin/authors.htm";
			} else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
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
	
	@RequestMapping(value = "admin/author/dels.htm", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, ModelMap model) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {

				String arrAuthorID[] = request.getParameterValues("authorIds");
				try {
					if (arrAuthorID.length != 0) {
						for (String id : arrAuthorID) {
							authorDao.delete(Integer.parseInt(id));
						}
						model.addAttribute("list", authorDao.getAllAuthor());
					}
					return "redirect:/admin/authors.htm";
				} catch (Exception e) {
					model.addAttribute("error", e.getMessage());
					model.addAttribute("list", authorDao.getAllAuthor());
					return "redirect:/admin/authors.htm";
				}
			} else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
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
	
	// edit author
	@RequestMapping("admin/author/edit/{id}")
	public String edit(Model model, @PathVariable("id") int id) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				System.out.println("vô đây hk á");
				model.addAttribute("o", authorDao.getAuthor(id));
				return "author/edit";
			} else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
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
	
	@RequestMapping(value = "admin/author/edit/{id}", method = RequestMethod.POST)
	public String edit(Model model, Author obj, @PathVariable("id") int id) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				
				System.out.println("vô đây hk ta");
				authorDao.edit(obj);
				return "redirect:/admin/authors.htm";
			} else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
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
	
	@ModelAttribute("memberLoginForm")
	public Member getMember() {
		return MemberController.memberLoginForm;
	}
	
	@ModelAttribute("roleLogin")
	public Role getRole() {
		return MemberController.roleLoginForm;
	}
}

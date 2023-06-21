package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.dao.ProductDao;
import ptithcm.dao.CategoryDao;
import ptithcm.dao.CartDao;
import ptithcm.model.Category;
import ptithcm.model.Member;
import ptithcm.model.Product;
import ptithcm.model.Role;

@Controller
public class ProductController {
	ProductDao productDao = new ProductDao();
	private static int size = 6;
	int id = 0;
	String image = "";

	@RequestMapping(value = { "home/products", "home/products/{p}" })
	public String index(Model model, @PathVariable(value = "p") Integer page) {
		model.addAttribute("title", "Mini Shop");
		int pageNum = (int) Math.ceil(productDao.count() / (double) size);
		model.addAttribute("pageNum", pageNum);
		if (page == null)
			page = 1;
		// show product from id to id by using page,
		model.addAttribute("list", productDao.getProducts(page, size));
		return "product/index";
	}
	
	@RequestMapping("home/browse/{id}")
	public String browse(Model model,@PathVariable("id") int id) {
		model.addAttribute("size",productDao.getProductsByCategoryID(id).size());
		model.addAttribute("list", productDao.getProductsByCategoryID(id));
		return "product/index";
	}
	
	@RequestMapping("home/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") int id) {
		Product product = productDao.getProduct(id);
		model.addAttribute("title", product.getTitle());
		model.addAttribute("o", product);
		return "product/detail";
	}
	
	@RequestMapping("home/search")
	public String search(Model model, @RequestParam("q") String q) {
		model.addAttribute("title", "Result for " + q);
		model.addAttribute("list", productDao.search(q));
		return "product/search";
	}
	
	// show list product for admin
	@RequestMapping(value = "admin/products")
	public String listProduct(Model model, HttpServletRequest request, HttpServletResponse response) {// ,
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				model.addAttribute("list", productDao.getAllProducts());
				return "product/list_admin";
			}
			// Member
			else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
			} else {
				return "redirect:/user/login.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
	
	// Insert 
	@RequestMapping("admin/product/add")
	public String addProduct(Model model, HttpServletRequest request, HttpServletResponse response) {

		if (MemberController.memberLoginForm != null) {
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				model.addAttribute("product", new Product());
				return "product/add";
			}
			else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
			} else {
				return "redirect:/user/login.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
	
	private static String upload(String path, MultipartFile part) throws IOException {
		String fileName;
		try (InputStream is = part.getInputStream()) {
			fileName = part.getOriginalFilename().replaceAll("\\s", "_");
			try (OutputStream os = new FileOutputStream(new File(path + fileName))) {
				int len = 0;
				byte[] bytes = new byte[1024];
				while ((len = is.read(bytes, 0, 1024)) > 0) {
					os.write(bytes, 0, len);
				}
			}
		}
		return fileName;
	}
	
	@RequestMapping(value = "admin/product/add", method = RequestMethod.POST)
	public String addProduct(Model model, @ModelAttribute("product") Product product, HttpServletRequest request,
			BindingResult errors, @RequestParam("f") MultipartFile part) {
		if (MemberController.memberLoginForm != null) {
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				try {
					String path = request.getServletContext().getRealPath("/images/");
					String name = upload(path, part);
					model.addAttribute("name", name);
					if (product.getTitle().equals("")) {
						errors.rejectValue("title", "product", "CHƯA NHẬP TÊN SÁCH !");
					}
					if (product.getIsbn().equals("")) {
						errors.rejectValue("isbn", "product", "CHƯA NHẬP MÃ VẠCH !");
					}
					if (product.getPrice() == 0) {
						errors.rejectValue("price", "product", "CHƯA NHẬP GIÁ TIỀN !");
					}
					if (product.getPages().equals("")) {
						errors.rejectValue("pages", "product", "CHƯA NHẬP SỐ TRANG !");
					}
					if (name.equals("")) {
						errors.rejectValue("imageUrl", "product", "CHƯA CHỌN HÌNH ẢNH !");
					}
					if (product.getTitle().equals("") || product.getTitle().equals("") || product.getPrice() == 0
							|| product.getPages().equals("") || name.equals("")) {
						return "product/add";
					} else {
						product.setImageUrl(name);
						Integer id = productDao.insert(product);
						return "redirect:/admin/products.htm";
					}

				} catch (IOException e) {
					e.printStackTrace();
				}
				return "product/add";

			} else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
			} else {
				return "redirect:/user/login.htm";
			}
		} else {
			return "redirect:/user/login.htm";
		}
	}
	
	private void renameImage(String name, String name2, String path) {
		File f1 = new File(path + name);
		File f2 = new File(path + name2);
		// if f2 is exist, del it
		if (f2.exists()) {
			f2.delete();
		}
		boolean b = f1.renameTo(new File(path + name2));
		if (b == true) {
			System.out.println("ddoi ten thanh cong");
		} else {
			System.out.println("doi ten that bai");
		}
	}
	
	@RequestMapping("admin/product/del/{id}")
	public String delete(@PathVariable("id") int id, HttpServletRequest request, HttpServletResponse response) {

		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				System.out.println("vo del");

				delFile(id, request);
				productDao.delete(id);
				return "redirect:/admin/products.htm";
			}
			// Member
			else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
			} else {
				return "redirect:/user/login.htm";
			}

		} else
			return "redirect:/user/login.htm";
	}
	
	public boolean delFile(int id, HttpServletRequest request) {
		Product product = productDao.getProduct(id);
		String fileName = product.getImageUrl();
		String path = request.getServletContext().getRealPath("/images/");
		File file = new File(path + fileName);
		if (file.exists()) {
			// del file
			file.delete();
			if (file.exists())
				return false;
			else
				return true;
		}
		return false;
	}
	
	// del list product
	@RequestMapping(value = "admin/product/dels.htm", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, ModelMap model) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				String arrAuthorID[] = request.getParameterValues("productIds");
				try {
					if (arrAuthorID.length != 0) {
						for (String id : arrAuthorID) {
							productDao.delete(Integer.parseInt(id));
						}
						model.addAttribute("list", productDao.getAllProducts());
					}
					return "redirect:/admin/products.htm";
				} catch (Exception e) {
					model.addAttribute("error", e.getMessage());
					model.addAttribute("list", productDao.getAllProducts());
					return "redirect:/admin/products.htm";
				}
			}
			// Member
			else if (MemberController.roleLoginForm.getId() == 2) {
				return "redirect:/home/products/1.htm";
			} else {
				return "redirect:/user/login.htm";
			}

		} else {
			return "redirect:/user/login.htm";
		}
	}
	
	// Edit author
	@RequestMapping("admin/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") int id) {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				System.out.println("vô đây hk á");
				this.id = id;
				Product product = productDao.getProduct(id);
				image = product.getImageUrl();
				model.addAttribute("product", product);
				return "product/edit";
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
	
	@RequestMapping(value = "admin/product/edit", method = RequestMethod.POST)
	public String edit(Model model, @ModelAttribute("product") Product product, HttpServletRequest request,
			BindingResult errors, @RequestParam("f") MultipartFile part) throws IOException {
		if (MemberController.memberLoginForm != null) {
			// admin
			if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 3) {
				String path = request.getServletContext().getRealPath("/images/");
				if (!part.isEmpty()) {
					image = upload(path, part);
				}

				// model.addAttribute("imageUrl", name);

				if (product.getTitle().equals("")) {
					errors.rejectValue("title", "product", "Bạn chưa nhập tên sách");
				}

				if (product.getIsbn().equals("")) {
					errors.rejectValue("isbn", "product", "Bạn chưa nhập mã vạch");
				}

				if (product.getPrice() == 0) {
					errors.rejectValue("price", "product", "Bạn chưa nhập giá sách");
				}

				if (product.getPages().equals("")) {
					errors.rejectValue("pages", "product", "Bạn chưa nhập số trang");
				}

				if (product.getTitle().equals("") || product.getTitle().equals("") || product.getPrice() == 0
						|| product.getPages().equals("")) {
					return "product/add";
				} else {

					System.out.println("title product edit: " + product.getTitle());
					System.out.println("isbn product edit: " + product.getIsbn());
					System.out.println("trang product edit: " + product.getPages());
					System.out.println("gia product edit: " + product.getPrice());
					product.setImageUrl(image);
					product.setId(id);
					productDao.edit(product, this.id);
					return "redirect:/admin/products.htm";
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

	@ModelAttribute("cartNumber")
	public int getCartCount() {
		CartDao cartDao = new CartDao();
		int cartcount = 0;
		if (MemberController.memberLoginForm != null) {
			cartcount = cartDao.getCarts(MemberController.memberLoginForm.getId()).size();
		}

		return cartcount;
	}

	@ModelAttribute("category")
	public List<Category> getallcategory() {
		CategoryDao categoryDao = new CategoryDao();
		List<Category> list = categoryDao.getAllCategory();
		return list;
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

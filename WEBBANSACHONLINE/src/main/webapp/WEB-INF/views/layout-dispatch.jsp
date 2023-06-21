<%@page import="ptithcm.controller.MemberController"%>
<%
	String view = request.getParameter("view");
	// System.out.print("view:aaaaa " + view);
	/* //user 
	if (view.contains("product/index") || view.contains("product/search") || view.contains("product/browse")) {
		pageContext.forward("user_layout.jsp");
	}
	
	//login
	else if ((view.contains("member/login") && MemberController.roleLoginForm.getId() == 2)
			|| view.contains("member/register") || view.contains("member/logout")
			|| view.contains("member/forgot") || view.contains("member/edit_user")) {
		pageContext.forward("login-form.jsp");
	
	}
	// admin
	else if (MemberController.roleLoginForm.getId() == 1 || MemberController.roleLoginForm.getId() == 2
			|| view.contains("author") || view.contains("category") || view.contains("product/add")
			|| view.contains("product/edit") || view.contains("product/list_admin")) {
		pageContext.forward("admin_layout.jsp");
	}
	
	//cart 
	else if (view.contains("product/detail") || view.contains("cart") || view.contains("order")) {
		pageContext.forward("login-form.jsp");
	} */
	if (MemberController.roleLoginForm != null) {
		//member
		if (MemberController.roleLoginForm.getId() == 2) {
			if (view.contains("member/login") || view.contains("member/register")
					|| view.contains("member/logout") || view.contains("member/forgot")
					|| view.contains("member/edit_user")) {
				pageContext.forward("login-form.jsp");
			} else if (view.contains("product/detail") || view.contains("cart") || view.contains("order")) {
				pageContext.forward("login-form.jsp");
			}else if(view.contains("admin/about")){
				pageContext.forward("login-form.jsp");
			} else {
				pageContext.forward("user_layout.jsp");
			}
		}
		// admin
		else if (MemberController.roleLoginForm.getId() == 3 || MemberController.roleLoginForm.getId() == 1) {
			if (view.contains("product/index") || view.contains("product/search")
					|| view.contains("product/browse")) {
				pageContext.forward("admin_layout_home.jsp");
			} else {
				pageContext.forward("admin_layout.jsp");
			}
		}
		//on't know
		else {
			pageContext.forward("user_layout.jsp");
		}
	}
	//not login
	else {
		//login form
		if (view.contains("member/login") || view.contains("member/register") || view.contains("member/logout")
				|| view.contains("member/forgot") || view.contains("member/edit_user")) {
			pageContext.forward("login-form.jsp");
		}
		else if(view.contains("admin/about")){
			pageContext.forward("login-form.jsp");
		}
		//normal form
		else
			pageContext.forward("user_layout.jsp");
	}
%>
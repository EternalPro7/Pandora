package web.member.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import web.emp.bean.EmpVO;
import web.emp.service.impl.EmpServiceImpl;
import web.member.bean.MemberVO;
import web.member.service.MemberService;
import web.member.service.impl.MemberServiceImpl;

@WebServlet("/MemberLoginServlet")
@MultipartConfig
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req.getContextPath());

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//登入
		if ("MemberLogin".equals(action)) {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			MemberVO selectMemberVO = new MemberVO();
			selectMemberVO.setMemberEmail(email);
			selectMemberVO.setMemberPassword(password);
			MemberService memberService = new MemberServiceImpl();
			
			MemberVO memberVO = memberService.selectByEmailAndPassword(selectMemberVO);
			req.getSession().setAttribute("loginMember", memberVO);
			//System.out.println(email);
			

			if (memberVO != null) {
				String url = "/front-end/Member/MemberHomePage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);
				return;
			} else {
				req.setAttribute("errorMsg", "帳號密碼錯誤");
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/Member/MemberLogin.jsp");
				failView.forward(req, resp);
				return;
			}
		}
		
//登出	
		if ("MemberSignOut".equals(action)) {
			String url = req.getContextPath() + "/front-end/Member/MemberLogin.jsp";
			req.getSession().invalidate();
			resp.sendRedirect(url);

		}
		
//全部會員資料
		if ("MemberAllList".equals(action)) {

			MemberService memberSerive = new MemberServiceImpl();
			List<MemberVO> memberAllList = memberSerive.getAll();
			req.setAttribute("memberAllList", memberAllList);
			RequestDispatcher successView = req.getRequestDispatcher("/Member_InfoAll.jsp");
			successView.forward(req, resp);
			return;
		}
//個別會員資料

//登入會員修改
		if ("LoginMemberForUpdate".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println(req.getParameter("loginMember"));
			
			Integer memberId = Integer.valueOf(req.getParameter("loginMember"));
			MemberServiceImpl memberService = new MemberServiceImpl();
			MemberVO memberVOupdate = memberService.getOneMember(memberId);
			req.setAttribute("memberVOupdate", memberVOupdate);

			String url = "/EMP_GetOneEdiotrByManger.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, resp);
		}
//新增
			if ("MemberAdd".equals(action)) {
			String url = req.getContextPath() + "/MemberRegister.jsp";
			List<String> errorMsgs = new LinkedList<String>();
			Map<String, String> errorMsgsMap = new LinkedHashMap<>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("errorMsgsMap", errorMsgsMap);
			MemberServiceImpl memberSvc = new MemberServiceImpl();
					
//			Part fileEmpPictureId = req.getPart("empPictureId"); // Retrieves <input type="file" name="empPictureId">
//			byte[] empPictureId = fileEmpPictureId.getInputStream().readAllBytes();

			
			
			String chineseName = req.getParameter("chineseName");
			String chineseNameReg = "^[(\u4e00-\u9fa5)]{2,10}$";
			if (chineseName == null || chineseName.trim().length() == 0) {
				errorMsgs.add("中文姓名: 請勿空白");
				errorMsgsMap.put("chineseName", "中文姓名: 請勿空白");
			} else if (!chineseName.trim().matches(chineseNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("中文姓名: 限輸入中文");
				errorMsgsMap.put("hineseName", "中文姓名: 限輸入中文");
			}
			
			LocalDate memberBirthday = null;
			try {
				memberBirthday = java.sql.Date.valueOf(req.getParameter("memberBirthday").trim()).toLocalDate();
			} catch (IllegalArgumentException e) {
				memberBirthday = new java.sql.Date(System.currentTimeMillis()).toLocalDate();
				errorMsgs.add("請輸入生日日期!");
				errorMsgsMap.put("memberBirthday", "請輸入生日日期!");
			}
			
			String memberEnglishFirstName = req.getParameter("memberEnglishFirstName");
			String memberEnglishFirstNameReg = "[A-Za-z]{1,50}";
			if (memberEnglishFirstName == null || memberEnglishFirstName.trim().length() == 0) {
				errorMsgs.add("英文姓名: 請勿空白");
				errorMsgsMap.put("memberEnglishFirstName", "英文姓名: 請勿空白");
			} else if (!memberEnglishFirstName.trim().matches(memberEnglishFirstNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓名: 限輸入英文字母");
				errorMsgsMap.put("memberEnglishFirstName", "英文姓名: 限輸入英文字母");
			}

			String memberEnglishLastName = req.getParameter("memberEnglishLastName");
			String memberEnglishLastNameReg = "[A-Za-z]{1,50}";
			if (memberEnglishLastName == null || memberEnglishLastName.trim().length() == 0) {
				errorMsgs.add("英文姓氏: 請勿空白");
				errorMsgsMap.put("memberEnglishLastName", "英文姓氏: 請勿空白");
			} else if (!memberEnglishLastName.trim().matches(memberEnglishLastNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓氏: 限輸入英文字母");
				errorMsgsMap.put("memberEnglishLastName", "英文姓氏: 限輸入英文字母");
			}

			
			String memberPassportNo = req.getParameter("memberPassportNo");
			String memberPassportNoReg = "^[0-9]{9}$";
			if (memberPassportNo == null || memberPassportNo.trim().length() == 0) {
				errorMsgs.add("護照號碼: 請勿空白");
				errorMsgsMap.put("memberPassportNo", "護照號碼: 請勿空白");
			} else if (!memberPassportNo.trim().matches(memberPassportNoReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("護照號碼: 請輸入9碼的數字");
				errorMsgsMap.put("memberPassportNo", "護照號碼: 請輸入9碼的數字");
			}
			
			String memberIdNo = req.getParameter("memberIdNo");
			String memberIdNoReg = "^[A-Z]{1}[1-2]{1}[0-9]{8}$";
			if (memberIdNo == null || memberIdNo.trim().length() == 0) {
				errorMsgs.add("身分證字號: 請勿空白");
				errorMsgsMap.put("memberIdNo", "護照號碼: 請勿空白");
			} else if (!memberIdNo.trim().matches(memberIdNoReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("身分證字號: 請以英文大寫開頭並接上9碼數字");
				errorMsgsMap.put("memberIdNo", "身分證字號: 請以英文大寫開頭並接上9碼數字");
			}
			
					String jobLevels = req.getParameter("jobLevels");
					if (jobLevels == null || jobLevels.trim().length() == 0) {
						errorMsgs.add("職位請勿空白");
						errorMsgsMap.put("jobLevels", "職位請勿空白");
					} else {
						jobLevels = req.getParameter("jobLevels");
					}

					String gender = req.getParameter("gender");
					if (gender == null || gender.trim().length() == 0) {
						errorMsgs.add("是個人都會有性別");
						errorMsgsMap.put("gender", "人都會有性別!");
					}

//					LocalDate empBirthday = null;
//					if (req.getParameter("empBirthday") != null && req.getParameter("empBirthday").length()!= 0) {
//						empBirthday = LocalDate.parse(req.getParameter("empBirthday"));
//					}else {
//						errorMsgs.add("請輸入日期");
//					}
					

					

					String email = req.getParameter("email");
					String emailReg = "^([a-zA-Z0-9_\\-.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";

					if (email == null || email.trim().length() == 0) {
						errorMsgs.add("Email: 請勿空白");
						errorMsgsMap.put("email", "Email: 請勿空白");
					} else if (!email.trim().matches(emailReg)) {
						errorMsgs.add("Email: 格式輸入錯誤");
						errorMsgsMap.put("email", "Email: 格式輸入錯誤");
					}
					try {
						if (empSvc.isExistEmail(email)) {
							errorMsgsMap.put("email", "帳號已存在");
						}
					} catch (Exception e) {
						errorMsgsMap.put("email", "帳號已存在");
					}

					LocalDate startDate = null;
					String startDateString = req.getParameter("startDate");
					if (startDateString == null || startDateString.trim().length() == 0) {
						errorMsgs.add("雇用日期請勿空白");
						errorMsgsMap.put("startDate", "雇用日期請勿空白");
					} else {
						startDate = LocalDate.parse(req.getParameter("startDate"));
					}

//					LocalDate startDate = null;
//					try {
//						startDate = java.sql.Date.valueOf(req.getParameter("startDate").trim()).toLocalDate();
//					} catch (IllegalArgumentException e) {
//						startDate =new java.sql.Date(System.currentTimeMillis()).toLocalDate();
//						errorMsgs.add("請輸入雇用日期!");
//					}
//					

					String empAddress = req.getParameter("empAddress");
					if (empAddress == null || empAddress.trim().length() == 0) {
						errorMsgs.add("地址:請勿空白");
						errorMsgsMap.put("empAddress", "地址:請勿空白");
					}

					String empCellphoneNo = req.getParameter("empCellphoneNo");
					String empCellphoneNoReg = "^[0-9]{10}$";
					if (empCellphoneNo == null || empCellphoneNo.trim().length() == 0) {
						errorMsgs.add("地址:請勿空白");
						errorMsgsMap.put("empCellphoneNo", "地址:請勿空白");
					} else if (!empCellphoneNo.trim().matches(empCellphoneNoReg)) {
						errorMsgs.add("手機號碼:請輸入10碼的數字 ");
						errorMsgsMap.put("empCellphoneNo", "手機號碼:請輸入10碼的數字 ");
					}

					EmpVO empVO = new EmpVO();
					empVO.setEmpPictureId(empPictureId);
					empVO.setEnglishLastName(englishLastName);
					empVO.setEnglishFirstName(englishFirstName);
					empVO.setJobLevels(jobLevels);
					empVO.setGender(gender);
					empVO.setEmpBirthday(empBirthday);
					empVO.setPassportNo(passportNo);
					empVO.setEmail(email);
					empVO.setStartDate(startDate);
					empVO.setEmpCellphoneNo(empCellphoneNo);
					empVO.setEmpAddress(empAddress);

//					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty() || !errorMsgsMap.isEmpty()) {

						req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req

						RequestDispatcher failureView = req.getRequestDispatcher("/EMP_Register.jsp");
						failureView.forward(req, resp);
						return;
					}

					/*************************** 2.開始新增資料 ***************************************/

					empVO = empSvc.addEmp(empVO);
					req.setAttribute("empAllList", empSvc.getAll());
					/*************************** 3.完成,準備轉交(Send the Success view) ***********/
					RequestDispatcher successView = req.getRequestDispatcher("/EMP_InfoAll.jsp");
					successView.forward(req, resp);

					return;
				}		
	}

}

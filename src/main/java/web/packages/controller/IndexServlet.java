package web.packages.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import web.cruiseline.bean.CruiseLineVO;
import web.cruiseline.bean.PortsOfCallListVO;
import web.cruiseline.service.impl.CruiseLineServiceImpl;
import web.packages.bean.PackageDetailVO;
import web.packages.bean.PackagesVO;
import web.packages.bean.PortsOfCallDateVO;
import web.packages.service.PackageDetailService;
import web.packages.service.PackagesService;
import web.packages.service.PortsOfCallDateService;
import web.packages.service.PortsOfCallListService;
import web.packages.service.impl.PackageDetailServiceImpl;
import web.packages.service.impl.PackagesServiceImpl;
import web.packages.service.impl.PortsOfCallDateServiceImpl;
import web.packages.service.impl.PortsOfCallListServiceImpl;


@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private Gson gson = new Gson();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);

		if ("homePage".equals(action)) {
			resp.setContentType("application/json;charset=UTF-8");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Map<String, String[]> map = req.getParameterMap();
			PackagesService packagesService = new PackagesServiceImpl();
			
			List<PackagesVO> packageAll = packagesService.getAll(map);
			List<String> packagesList = packageAll.stream().map(vo -> vo.toString())
					.collect(Collectors.toList());
			System.out.println(packagesList);
			List<String> packageNoList = packageAll.stream().map(vo -> vo.getPackageNo().toString())
					.collect(Collectors.toList());
			List<String> departureDistinct = packageAll.stream().map(vo -> vo.getDeparture()).distinct()
					.collect(Collectors.toList());
			List<String> destinationDistinct = packageAll.stream().map(vo -> vo.getDestination()).distinct()
					.collect(Collectors.toList());
			List<String> departureTimeDistinct = packageAll.stream()
					.map(vo -> vo.getDepartureTime().format(DateTimeFormatter.ofPattern("yyyy-MM"))).distinct()
					.collect(Collectors.toList());
			List<String> duration = packageAll.stream().map(vo -> vo.getDuration().toString())
					.collect(Collectors.toList());

			List<String> count = new ArrayList<String>();
			count.add((String.valueOf(packagesList.toArray().length)));
			PrintWriter out = resp.getWriter();
			
			Map<String, List<String>> optionMap = new HashMap<>();
			optionMap.put("packageNoList", packageNoList);
			optionMap.put("departureDistinct", departureDistinct);
			optionMap.put("destinationDistinct", destinationDistinct);
			optionMap.put("departureTimeDistinct", departureTimeDistinct);
			optionMap.put("packagesList", packagesList);
			optionMap.put("Duration", duration);
			optionMap.put("count", count);
			if (!optionMap.containsKey("size")) {
				List<String> data = new ArrayList<>();

				for (int i = 0; i < packagesList.size(); i++) {
					data.add(String.valueOf(i));

					optionMap.put("size", data);
				}

			}
			out.print(gson.toJson(optionMap));

			out.flush();
//			RequestDispatcher successView = req.getRequestDispatcher("/front-end/package/homePage.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
//			successView.forward(req, resp);
		}

//		if("clearBtn".equals(action)) {
//			String url = req.getContextPath() + ("/front-end/package/homePage.jsp");
//			
//			resp.sendRedirect("http://localhost:8080/PackagesBackServlet?action=homePage");
//		}

		if ("listPackagesByCompositeQuery".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Map<String, String[]> map = req.getParameterMap();
			PackagesService packagesService = new PackagesServiceImpl();
			CruiseLineServiceImpl cruiseLineService = new CruiseLineServiceImpl();
			for (String i : map.keySet()) {
				System.out.println("我是KEY" + i + ":" + map.get(i));
				for (String j : map.get(i)) {
					System.out.println("我是Vaule:" + j);
				}
			}

			List<PackagesVO> packagesList = packagesService.getAll(map);
			List<String> packageNoList = packagesList.stream().map(vo -> vo.getPackageNo().toString())
					.collect(Collectors.toList());
			List<String> departureDistinct = packagesList.stream().map(vo -> vo.getDeparture()).distinct()
					.collect(Collectors.toList());
			List<String> destinationDistinct = packagesList.stream().map(vo -> vo.getDestination()).distinct()
					.collect(Collectors.toList());
			List<String> departureTimeDistinct = packagesList.stream()
					.map(vo -> vo.getDepartureTime().format(DateTimeFormatter.ofPattern("yyyy-MM"))).distinct()
					.collect(Collectors.toList());
			List<String> duration = packagesList.stream().map(vo -> vo.getDuration().toString()).distinct()
					.collect(Collectors.toList());
			List<String> cruiseLineNoList = packagesList.stream().map(vo -> vo.getCruiseLineNo().toString()).distinct()
					.collect(Collectors.toList());
			for (String cruiseLineNo : cruiseLineNoList) {
				System.out.println("我是航線編號阿:" + cruiseLineNo);
			}

			Map<Integer, String> portsOfCallListMap = new HashMap<>();

			PortsOfCallListService portsOfCallListService = new PortsOfCallListServiceImpl();
			Map<Integer, String> portNoAndNameMap = portsOfCallListService.getPortMap();
			for (PackagesVO vo : packagesList) {
				String allPort = "";
				String pad = "->";
				List<PortsOfCallListVO> portsOfCallListVOs = portsOfCallListService
						.getByCruiseLineNo(vo.getCruiseLineNo());
				for (PortsOfCallListVO portVO : portsOfCallListVOs) {
					allPort = allPort + portNoAndNameMap.get(portVO.getPortOfCallNo()) + pad;

				}

				portsOfCallListMap.put(vo.getPackageNo(), allPort.substring(0, allPort.length() - pad.length()));
			}

			Integer count = packagesList.toArray().length;

//			System.out.println("Servlet:listPackagesByCompositeQuery");
		
			req.getSession().setAttribute("portsOfCallListMap", portsOfCallListMap);
			req.getSession().setAttribute("departureDistinct", departureDistinct);
			req.getSession().setAttribute("destinationDistinct", destinationDistinct);
			req.getSession().setAttribute("departureTimeDistinct", departureTimeDistinct);
			req.getSession().setAttribute("packagesList", packagesList);
			req.getSession().setAttribute("Duration", duration);
			req.setAttribute("cruiseLineNoList", cruiseLineNoList);
			req.getSession().setAttribute("count", count);
//			req.setAttribute("listPackagesByCompositeQuery",packagesService);


			RequestDispatcher successView = req.getRequestDispatcher("/front-end/index/search.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
			successView.forward(req, resp);
		}

		if ("updateOption".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			resp.setContentType("application/json;charset=utf-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();

			Map<String, String[]> map = req.getParameterMap();

			PackagesService packagesService = new PackagesServiceImpl();
			List<PackagesVO> packagesList = packagesService.getAll(map);
			Map<String, List<String>> optionMap = new HashMap<>();
			if (packagesList.size() == 0) {
				List<String> data = new ArrayList<>();
				optionMap.put("size", data);
				packagesList = (List<PackagesVO>) req.getSession().getAttribute("lastQuery");
			} else {
				req.getSession().setAttribute("lastQuery", packagesList);
			}
			List<String> packageNoList = packagesList.stream().map(vo -> vo.getPackageNo().toString())
					.collect(Collectors.toList());
			List<String> departureDistinct = packagesList.stream().map(vo -> vo.getDeparture()).distinct()
					.collect(Collectors.toList());
			List<String> destinationDistinct = packagesList.stream().map(vo -> vo.getDestination()).distinct()
					.collect(Collectors.toList());
			List<String> departureTimeDistinct = packagesList.stream()
					.map(vo -> vo.getDepartureTime().format(DateTimeFormatter.ofPattern("yyyy-MM"))).distinct()
					.collect(Collectors.toList());
			List<String> duration = packagesList.stream().map(vo -> vo.getDuration().toString()).distinct()
					.collect(Collectors.toList());
//			System.out.println("天數:" + duration);

			optionMap.put("packageNoList", packageNoList);
			optionMap.put("departureDistinct", departureDistinct);
			optionMap.put("destinationDistinct", destinationDistinct);
			optionMap.put("departureTimeDistinct", departureTimeDistinct);

			optionMap.put("Duration", duration);

			if (!optionMap.containsKey("size")) {
				List<String> data = new ArrayList<>();

				for (int i = 0; i < packagesList.size(); i++) {
					data.add(String.valueOf(i));

					optionMap.put("size", data);
				}

			}

			out.print(gson.toJson(optionMap));
			out.flush();

//			out.print(gson.toJson(departureDistinct));
//			System.out.println(gson.toJson(departureDistinct));
//			out.flush();
		}
		
		if("getOnePackageDetail".equals(action)) {
			
			Integer packageNo = Integer.valueOf(req.getParameter("packageNo"));
			PackagesService packagesService = new PackagesServiceImpl();
			CruiseLineServiceImpl cruiseLineService = new CruiseLineServiceImpl();
			
			PackageDetailService packageDetailService = new PackageDetailServiceImpl();
			List<PackageDetailVO> packagesDetailList= packageDetailService.getOnePackageDetail(packageNo);
			PackagesVO packagesVO = packagesService.getOnePackage(packageNo);
			
			PortsOfCallDateService portsOfCallDateService = new PortsOfCallDateServiceImpl();
			List<PortsOfCallDateVO> portsOfCallDateVOList = portsOfCallDateService.getByPackageNo(packageNo);
			CruiseLineVO cruiseLineVO = cruiseLineService.selectCruiseNo(packagesVO.getCruiseLineNo());
			
		
			req.setAttribute("portsOfCallDateVOList", portsOfCallDateVOList);
			req.setAttribute("cruiseLineVO", cruiseLineVO);
			req.setAttribute("packagesService",packagesService);
			req.getSession().setAttribute("packagesVO", packagesVO);			
//			System.out.println(req.getSession().getAttribute("packagesVO"));
			req.setAttribute("packagesDetailList", packagesDetailList);					
			req.setAttribute("dateTimeFormat",DateTimeFormatter.ofPattern("yyyy年MM月dd日HH點mm分"));
			
			
			
			RequestDispatcher successView = req.getRequestDispatcher("/front-end/package/packageDetail.jsp"); 
			successView.forward(req, resp);	
			
		}
	}

}

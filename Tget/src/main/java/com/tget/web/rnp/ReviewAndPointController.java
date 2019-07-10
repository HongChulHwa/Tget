package com.tget.web.rnp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tget.service.rnp.RNPService;


@Controller
@RequestMapping("/rnp/*")
public class ReviewAndPointController {

		///Field
		@Autowired
		@Qualifier("rNPServiceImpl")
		private RNPService rNPService;
		
		///C
		public ReviewAndPointController(){
			System.out.println(this.getClass());
		}

		///M	
		@RequestMapping(value="getPointHistory")
		public String getPointHistory(HttpServletRequest request, Model model) throws Exception {
			System.out.println("===============getPointHistory===============");
			
			rNPService.getPointHistory(request.getParameter("userId"));
			
			return "forward:/purchase/getPointHistory.jsp";
			
		}
		
		@RequestMapping(value="getReviewList")
		public String getReviewList(HttpServletRequest request, Model model) throws Exception {
			
			System.out.println("===============getReviewList===============");
			
			rNPService.getReviewList(request.getParameter("buyerId"));
			
			return "forward:/purchase/listReview.jsp";
			
		}
		
		@RequestMapping(value="getSellerEstimationList")
		public String getSellerEstimationList(HttpServletRequest request, Model model) throws Exception {
			System.out.println("===============getSellerEstimationList===============");
			
			rNPService.getSellerEstimationList(request.getParameter("sellerId"));
			
			return "forward:/purchase/listSellerEstimation.jsp";
			
		}
}

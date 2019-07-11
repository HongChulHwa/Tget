package com.tget.web.rnp;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.tget.common.domain.Search;
import com.tget.service.event.domain.YoutubeVideoList;
import com.tget.service.rnp.RNPService;
import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.rnp.domain.Review;
import com.tget.service.event.EventService;
import com.tget.service.event.domain.StubhubEvent;


//==> ȸ������ Controller
@RestController
@RequestMapping("/rnp/*")
public class ReviewAndPointRestController {
	
	///Field
	@Autowired
	@Qualifier("rNPServiceImpl")
	private RNPService rNPService;
	
	///C
	public ReviewAndPointRestController(){
		System.out.println(this.getClass());
	}

	///M
	@RequestMapping(value="json/addReview", method=RequestMethod.POST)
	public Map<String,Object> addReview(@RequestBody Review review) throws Exception {
		System.out.println("===============addReview===============");
		
		rNPService.addReview(review);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		return map;
	}
	
	@RequestMapping(value="json/updateReview", method=RequestMethod.GET)
	public Map<String,Object> updateReview(@RequestBody int tranNo) throws Exception {
		System.out.println("===============updateReview(===============");
		
		Review review = rNPService.getReview(tranNo);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("review", review);
		
		return map;
	}
	
	@RequestMapping(value="json/updateReview", method=RequestMethod.POST )
	public Map<String,Object> updateReview(@RequestBody Review review) throws Exception {
		System.out.println("===============updateReview(===============");
		
		rNPService.updateReview(review);
		review = rNPService.getReview(review.getTranNo());
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("review", review);
		
		return map;
	}
	
	@RequestMapping(value="json/getReview" )
	public Map<String,Object> getReview(@RequestBody int tranNo) throws Exception {
		System.out.println("===============getReview(===============");
		
		Review review = rNPService.getReview(tranNo);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("review", review);
		
		return map;
	}
	
	@RequestMapping(value="json/getReviewList" )
	public Map<String,Object> getReviewList(@RequestBody String buyerId) throws Exception {
		System.out.println("===============getReviewList(===============");
		
		List<Review> list = rNPService.getReviewList(buyerId);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("reviewList", list);
		
		return map;
	}
	
	@RequestMapping(value="json/getSellerEstimationList")
	public Map<String,Object> getSellerEstimationList(@RequestBody String sellerId) throws Exception {
		System.out.println("===============getSellerEstimationList(===============");
		
		List<Review> list = rNPService.getSellerEstimationList(sellerId);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		return map;
	}
	
	@RequestMapping(value="json/getPointHistory")
	public Map<String,Object> getPointHistory(@RequestBody String userId) throws Exception {
		System.out.println("===============getPointHistory(===============");
		
		List<PointHistory> list = rNPService.getPointHistory(userId);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pointHistory", list);
		
		return map;
	}
	
}
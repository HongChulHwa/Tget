package com.tget.web.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tget.common.domain.Search;
import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Weather;
import com.tget.service.event.EventService;
import com.tget.service.transaction.TranService;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	//setter Method ���� ����
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	public CommunityRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="json/getContent/{contentNo}", method=RequestMethod.GET ) //GET����� {prodNo}ó�� ��ø� �����������
	public Map getContent( @PathVariable int contentNo ) throws Exception{//       POST����� ��� Body�� �ٷ� ���Ƿ� ��������ʰ� �ٷ� ������ ����
		
		System.out.println("/community/json/getContent : GET");
		
		Content content = communityService.getContent(contentNo);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("content", content);
		
		return map;
	}
	
	@RequestMapping(value="json/getReplyList/{replyNo}", method=RequestMethod.GET)
	public String getReplyList(@ModelAttribute("reply") Reply reply, @ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception{
	
		System.out.println("/community/getReplyList: GET/ POST");
	
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		// Business logic
		Map<String , Object> map=communityService.getReplyList(search);
	
		System.out.println( map.get("list"));
		// Model and View 
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("search", search);
	
		return "forward:/community/getContent";
	}

//	@RequestMapping(value="json/addReply/{replyNo}", method=RequestMethod.GET)
//	public Map<String,Object> addReply(@PathVariable int replyNo, Search search) throws Exception {
//
//		System.out.println("community/addReply: GET");
//		
//		Map<String,Object> map = new HashMap<String,Object>();
//		
//		map.put("list", communityService.getReply(replyNo));
//		
//		return map;
//	}
	
	@RequestMapping(value="json/addReply", method=RequestMethod.POST)
	public Map<String,Object> addReply( @RequestBody Reply reply) throws Exception {

		System.out.println("community/addReply: POST");
		
		communityService.addReply(reply);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list", communityService.getReply(reply.getReplyNo()));
		
		return map;
	}
	
	@RequestMapping(value="json/updateReply/{replyNo}", method=RequestMethod.GET)
	public String updateReply( @RequestParam("replyNo") int replyNo  , Model model) throws Exception{

		System.out.println("/community/updateReply: GET");
		//Business Logic
		
		model.addAttribute("reply", communityService.getReply(replyNo));
		
		return "forward:/content/getContent.jsp";
	}
	
	
	@RequestMapping(value="json/updateReply", method=RequestMethod.POST)
	public String updateReply( @ModelAttribute("reply") Reply reply  , Model model) throws Exception{

		System.out.println("/community/updateReply: POST");
		//Business Logic
		
		communityService.updateReply(reply);
		
		return "forward:/content/getContent";
	}

	@RequestMapping(value="json/deleteReply/{replyNo}", method=RequestMethod.GET)
	public String deleteReply( @PathVariable int replyNo) throws Exception{

		System.out.println("/community/deleteReply: GET");
		//Business Logic
		
		communityService.deleteReply(replyNo);
		
		return "forward:/content/getContent";
	}
	// �����ʿ�..
	@RequestMapping(value="rest/updateGoodCount/{contentNo}", method=RequestMethod.GET)
	public String updateGoodCount( @PathVariable("contentNo") int contentNo) throws Exception {

		System.out.println("community/updateGoodCount: GET");
		communityService.updateGoodCount(contentNo);
		
		return "good";
	}
	
	@RequestMapping(value="rest/updateBadCount/{contentNo}", method=RequestMethod.GET)
	public String updateBadCount( @PathVariable("contentNo") int contentNo) throws Exception {

		System.out.println("community/updateBadCount: GET");
		
		communityService.updateBadCount(contentNo);
		
		return "bad";
	}
	// ���� �ȳ�
	@RequestMapping( value="rest/getSearchWeather/") 
	public Weather getSearchWeather( @RequestBody Weather weather ) throws Exception{
		
		System.out.println("/community/rest/getSearchWeather : POST");
		
		weather = GetSearchWeather.getSearchweather(weather);
		
		return weather;
	}
}
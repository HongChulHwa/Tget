package com.tget.web.event;


import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.tget.common.domain.Search;
import com.tget.service.event.EventService;
import com.tget.service.event.domain.Category;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;
import com.tget.service.event.domain.StubhubEvent;
import com.tget.service.event.domain.YoutubeVideo;
import com.tget.service.event.domain.YoutubeVideoList;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.user.domain.User;


//==> ȸ������ Controller
@Controller
@RequestMapping("/event/*")
public class EventController {
	
	///Field
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	
	@Value("#{apiKeyProperties['youtubeKey']}")
	String youtubeKey;
	
	@Value("#{apiKeyProperties['stubhubKey']}")
	String stubhubKey;
	
	@Value("#{commonProperties['uploadPath']}")
	String uploadPath;
	
	@Value("#{commonProperties['videoPath']}")
	String videoPath;
	
	///Constructor
	public EventController(){
		System.out.println(this.getClass());
	}
	

	///Method
//	@RequestMapping(value="test")
//	public String test(Model model) throws Exception {
//		System.out.println("===============test===============");
//		
////		List<Category> categorylist = eventService.getCategoryList();
////		List<Category> tempList = new ArrayList<Category>();
////		for (int i = 0; i < 3; i++) {
////			for (Category category : categorylist) {			
////				if(category.getCategoryOneCode().equals(String.valueOf(i))) {
////					tempList.add(category);
////				}				
////			}
////			model.addAttribute("categorylist", categorylist);
////			model.addAttribute("categorylist"+i, tempList);
////			System.out.println("categorylist"+i+" : "+tempList);
////			tempList.clear();
////		}			
//		return "forward:/event/test.jsp";
//	}
	
	@RequestMapping(value="aaa")
	public String aaa() throws Exception {
		
		return "forward:/event/aaa.jsp";
	}
	
	@RequestMapping(value="getEventList")
	public String getEventList(@ModelAttribute("search") Search search,@RequestParam String requestPageToken,Model model) throws Exception {
		System.out.println("===============getEventList===============");
		System.out.println("search:"+search);
		
		if (search.getSearchCondition().equals("0")) {
			model.addAttribute("category", search.getSearchKeyword());
		}
		
		Map<String,Object> map = eventService.getEventList(search, requestPageToken, stubhubKey);

		model.addAttribute("search", search);
		model.addAttribute("requestPageToken",requestPageToken);
		model.addAttribute("eventList",(List<StubhubEvent>)map.get("eventList"));
		model.addAttribute("totalResults",(Integer)map.get("totalResults"));

		return "forward:/event/listEvent.jsp";
	}
	
	@RequestMapping(value="getEvent")
	public String getEvent(@RequestParam String category, @RequestParam String eventName, Model model) throws Exception {
		System.out.println("===============getEvent===============");
		int viewCount = 0;
//		int ticketLowestPrice = 0;
		Search search = new Search();
		
		List<Event> eventListByName = eventService.getEventByName(eventName);
		System.out.println(eventListByName);
		
		if (eventListByName.isEmpty()) {
			System.out.println("================eventListByName.isEmpty()================");
			search.setSearchCondition("2");
			search.setSearchKeyword(eventName);
//			Map<String,Object> map = eventService.getEventList(search, "0", stubhubKey);
			List<StubhubEvent> list = (List<StubhubEvent>)eventService.getEventList(search, "0", stubhubKey).get("eventList");
			for (StubhubEvent stubhubEvent : list) {
				stubhubEvent.setCategoryTwoEng(category.toLowerCase());
				eventService.addEvent(stubhubEvent);
			}
			eventListByName = eventService.getEventByName(eventName);
			model.addAttribute("totalResults", eventListByName.size());	
		}else {

			for (Event event : eventListByName) {
				category = event.getCategoryTwoEng();
				search.setSearchCondition("0");
				search.setSearchKeyword(event.getEventId());
//				ticketLowestPrice = ((SellProb)ticketService.getTicketList(search).get("sellProb")).getLowPrice();
//				event.setTicketLowestPrice(ticketLowestPrice);
				event.setTicketLowestPrice(((SellProb)ticketService.getTicketList(search).get("sellProb")).getLowPrice());
				event.setTotalTicketCount(((SellProb)ticketService.getTicketList(search).get("sellProb")).getTotalCount());
				viewCount = event.getViewCount();
			}						
			model.addAttribute("eventImage", eventListByName.get(0).getEventImage());
			model.addAttribute("totalResults", eventListByName.size());	
		}
		eventService.updateEventViewCount(viewCount+1, eventName);
		
//		System.out.println(eventListByName);

		model.addAttribute("eventListByName", eventListByName);
		model.addAttribute("eventName", eventName);
		model.addAttribute("category", category);
		model.addAttribute("viewCount", viewCount);
		
		return "forward:/event/getEvent.jsp";
	}
	
	@RequestMapping(value="getEventTicketList")
	public String getEventTicketList(@RequestParam String eventId,Model model) throws Exception {
		System.out.println("===============getEventTicketList===============");
		
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyword(eventId);
		
		Map<String, Object> map = ticketService.getTicketList(search);
		//eventId�� ���� Ƽ�� ����Ʈ
		
		List<Ticket> ticketList = (List<Ticket>)map.get("list");
		SellProb sellProb = (SellProb)map.get("sellProb");
		
		List<String> list = null;
		Event event = eventService.getEvent(eventId);
		if (event != null) {
			list = eventService.getYoutubeIdList(event.getEventName());
		}
		
		List<String> youtubeList = eventService.getYoutubeIdList(event.getEventName());
		if (youtubeList != null && youtubeList.size() != 0 ) {
			model.addAttribute("videoId", youtubeList.get(youtubeList.size()-1));
		}
		
//		model.addAttribute("videoId", "-iDOez7D1tY");
		model.addAttribute("event", event);
		model.addAttribute("ticketList", ticketList);
		model.addAttribute("lowPrice", sellProb.getLowPrice());
		model.addAttribute("totalTicketCount",sellProb.getTotalCount());		
		model.addAttribute("youtubeIdList",list);
		
		return "forward:/event/listEventTicket.jsp";		
	}
	
	@RequestMapping(value="getInterestedEventList")
	public String getInterestedEventList(HttpSession session, Model model) throws Exception {
		System.out.println("===============getInterestedEventList===============");
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		List<Event> list = eventService.getInterestedEventList(userId);
		
		for (Event event : list) {
			Search search = new Search();
			search.setSearchCondition("0");
			search.setSearchKeyword(event.getEventId());
			event.setTicketLowestPrice(((SellProb)ticketService.getTicketList(search).get("sellProb")).getLowPrice());
			event.setTotalTicketCount(((SellProb)ticketService.getTicketList(search).get("sellProb")).getTotalCount());
		}				
		
		model.addAttribute("interestedEventList", list);
		if (list != null) {
			model.addAttribute("interestedEventListCount", list.size());
		}		
		
		return "forward:/event/listInterestedEvent.jsp";
		
	}
	
	@RequestMapping(value="getEventManage")
	public String getEventManage(Model model) throws Exception {
		System.out.println("===============getEventManage===============");
		
		List<RecommEvent> recommEventlist = eventService.getRecommendedEventList();
		List<Category> categorylist = eventService.getCategoryList();
		
		model.addAttribute("recommEventlist", recommEventlist);
		model.addAttribute("recommEventlistSize", recommEventlist.size());
		model.addAttribute("categorylist", categorylist);
		return "forward:/event/getEventManage.jsp";
		
	}
	
	@RequestMapping(value="addYoutubeVideo", method=RequestMethod.GET)
	public String addYoutubeVideo(@RequestParam String eventName,Model model) throws Exception {
		System.out.println("===============addYoutubeVideo===============");
		//youtube ������ ã�� �˾�â ���� ��
		
		Map<String,Object> map = eventService.getYoutubeList(new Search(), null, youtubeKey);

		model.addAttribute("youtubeList", (List<YoutubeVideo>)map.get("youtubeList"));
		model.addAttribute("nextPageToken",  (String)map.get("nextPageToken"));
		model.addAttribute("prevPageToken",  (String)map.get("prevPageToken"));
		model.addAttribute("totalResults",  (Integer)map.get("totalResults"));
		model.addAttribute("eventName",  eventName);
		return "forward:/event/addYoutubeVideoGET.jsp";
	}
	
	@RequestMapping(value="addYoutubeVideo", method=RequestMethod.POST)
	public String addYoutubeVideo(@RequestParam String requestPageToken,@RequestParam String eventName,@ModelAttribute("search") Search search,Model model) throws Exception {
		System.out.println("===============addYoutubeVideo===============");
		//�˻��ϱ� �ϸ� ����� ��(�˻���� �ָ鼭 �˾�â �������̵�)
		
		Map<String,Object> map = eventService.getYoutubeList(search, requestPageToken, youtubeKey);

		model.addAttribute("youtubeList", (List<YoutubeVideo>)map.get("youtubeList"));
		model.addAttribute("nextPageToken",  (String)map.get("nextPageToken"));
		model.addAttribute("prevPageToken",  (String)map.get("prevPageToken"));
		model.addAttribute("totalResults",  (Integer)map.get("totalResults"));
		model.addAttribute("eventName",  eventName);
		model.addAttribute("requestPageToken",  requestPageToken);
		return "forward:/event/addYoutubeVideoGET.jsp";
	}
	
	@RequestMapping(value="getYoutubePlayer")
	public String getYoutubePlayer( @ModelAttribute("youtubeVideo") YoutubeVideo youtubeVideo,@RequestParam String requestPageToken,
			@RequestParam String eventName,@RequestParam String searchKeyword,Model model) throws Exception {
		System.out.println("===============getYoutubePlayer===============");
		//youtube�� search�ϰ� �� ����� �����ִ� ȭ�鿡��, Ư�� ������ ����� �� �� �ִ� ȭ������ �Ѿ ��
		//�˾�â ȭ�� ��ü�� ������ �̵���Ű�� ���̹Ƿ� �� Method�� RestController�� ���� ���� ��...(?)
		System.out.println(youtubeVideo);
		
		System.out.println("eventName ; "+eventName);
		model.addAttribute("youtubeVideo", youtubeVideo);
		model.addAttribute("requestPageToken", requestPageToken);
		model.addAttribute("eventName", eventName);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "forward:/event/getYoutubePlayer.jsp";
	}
	
	@RequestMapping(value="addEventImage", method=RequestMethod.GET)
	public String addEventImage(@RequestParam String eventName,@RequestParam String eventImage,Model model) throws Exception {
		System.out.println("===============addEventImage===============");
		
		model.addAttribute("eventName",eventName);
		model.addAttribute("eventImage",eventImage);
		
		return "forward:/event/addEventImageGET.jsp";
	}
	
	@RequestMapping(value="addEventImage", method=RequestMethod.POST)
	public String addEventImage(@RequestParam(value = "file", required = false) MultipartFile multipartFile,@ModelAttribute("event") Event event,Model model) throws Exception {
		System.out.println("===============addEventImage POST===============");
		System.out.println(event);
		System.out.println(multipartFile.getOriginalFilename( ));
		File file = null;
				
		if(!multipartFile.isEmpty()) {
			event.setEventImage(multipartFile.getOriginalFilename( ));
					
			file = new File(uploadPath,multipartFile.getOriginalFilename());
			FileCopyUtils.copy(multipartFile.getBytes(), file);
			
		}
		eventService.addEventImage(event.getEventImage(), event.getEventName());
		
		model.addAttribute("eventImage",event.getEventImage());
//		model.addAttribute("file",file);
		return "forward:/event/addEventImagePOST.jsp";
	}
	
	@RequestMapping(value="addRecommendedEvent", method=RequestMethod.GET)
	public String addRecommendedEvent(Model model) throws Exception {
		System.out.println("===============addRecommendedEvent GET===============");
		
		return "forward:/event/addRecommVideoGET.jsp";
	}
	
	@RequestMapping(value="addRecommendedEvent", method=RequestMethod.POST)
	public String addRecommendedEvent(@RequestParam(value = "file", required = false) MultipartFile multipartFile,@ModelAttribute("recommEvent") RecommEvent recommEvent,Model model) throws Exception {
		System.out.println("===============addRecommendedEvent POST===============");
		
		System.out.println(multipartFile.getOriginalFilename( ));
		File file = null;
				
		if(!multipartFile.isEmpty()) {
			recommEvent.setVideoName(multipartFile.getOriginalFilename( ));
					
			file = new File(videoPath,multipartFile.getOriginalFilename());
			FileCopyUtils.copy(multipartFile.getBytes(), file);
			
		}
		List<RecommEvent> list = eventService.getRecommendedEventList();
		for (int i=0; i<list.size(); i++) {
			if(list.get(i).getEventName().equals(recommEvent.getEventName())) {
				break;
			}else if( i == (list.size()-1) && ! list.get(i).getEventName().equals(recommEvent.getEventName())) {
				eventService.addRecommendedEvent(recommEvent);
			}
		}	
//		eventService.addRecommendedEvent(recommEvent);
		System.out.println(recommEvent);
		model.addAttribute("recommEvent",recommEvent);
		model.addAttribute("videoName",recommEvent.getVideoName());
//		model.addAttribute("file",file);
		return "forward:/event/addRecommVideoPOST.jsp";
	}
	
	@RequestMapping(value="updateRecommendedEvent", method=RequestMethod.GET)
	public String updateRecommendedEvent(@RequestParam int recommEventNo, Model model) throws Exception {
		System.out.println("===============updateRecommendedEvent GET===============");
		System.out.println(recommEventNo);
//		eventService.getRecommendedEvent(recommEventNo);
		model.addAttribute("recommEvent",eventService.getRecommendedEvent(recommEventNo));
		return "forward:/event/addRecommVideoGET.jsp";
	}	
	
	@RequestMapping(value="updateRecommendedEvent", method=RequestMethod.POST)
	public String updateRecommendedEvent(@RequestParam(value = "file", required = false) MultipartFile multipartFile,@ModelAttribute("recommEvent") RecommEvent recommEvent,Model model) throws Exception {
		System.out.println("===============rest/updateRecommendedEvent===============");
		
		System.out.println(multipartFile.getOriginalFilename( ));
		File file = null;
				
		if(!multipartFile.isEmpty()) {
			recommEvent.setVideoName(multipartFile.getOriginalFilename( ));
					
			file = new File(videoPath,multipartFile.getOriginalFilename());
			FileCopyUtils.copy(multipartFile.getBytes(), file);
			
		}
		eventService.updateRecommendedEvent(recommEvent);
		
		System.out.println(recommEvent);
		model.addAttribute("recommEvent", eventService.getRecommendedEvent(recommEvent.getRecommEventNo()));
		model.addAttribute("recommEventlist",eventService.getRecommendedEventList());
		model.addAttribute("videoName",recommEvent.getVideoName());
//		model.addAttribute("file",file);
		return "forward:/event/addRecommVideoPOST.jsp";
	}
}
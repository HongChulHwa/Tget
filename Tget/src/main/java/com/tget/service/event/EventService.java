package com.tget.service.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.event.domain.Category;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;
import com.tget.service.user.domain.User;


public interface EventService {
	
	public void addEvent(Event event) throws Exception;
	public Event getEvent(String eventId) throws Exception;//return event������; 
	public  List<Event> getEventByName(String eventName) throws Exception;//return event������ ����Ʈ; 
	public void updateEventViewCount(int viewCount,String eventName) throws Exception;
	public void addEventImage(String imageName,String eventName) throws Exception;
	public void updateEventImage(String imageName,String eventName) throws Exception;
	public void deleteEventImage(String eventName) throws Exception;
	public List<Event> getInterestedEventList(String userId) throws Exception;
	public void addInterestedEvent(String eventId, String userId) throws Exception;
	public void deleteInterestedEvent(String eventId, String userId) throws Exception;
	public List<String> getYoutubeIdList(String eventName) throws Exception;
	public void addYoutubeVideo(String youtubeId, String eventName) throws Exception;
	public List<Event> getPopularEventList() throws Exception;
	public List<RecommEvent> getRecommendedEventList() throws Exception;
	public RecommEvent getRecommendedEvent(int recommEventNo) throws Exception;
	public void addRecommendedEvent(RecommEvent recommEvent) throws Exception;
	public void updateRecommendedEvent(RecommEvent recommEvent) throws Exception;
	public void deleteRecommendedEvent(int recommEventNo) throws Exception;
	public List<Category> getCategoryList() throws Exception;
	public void addCategoryTwo(Category category) throws Exception;
	public void updateCategoryTwo(Category category) throws Exception;
	public Category getCategory(String categoryTwoEng) throws Exception;
	public void deleteCategoryTwo(String categoryTwoEng) throws Exception;
	public List<User> getInterestedByUser(Search search) throws Exception;
	public void addInterestedCategory(int categoryTwoNo, String userId) throws Exception;
	public Map<String,Object> getEventList(Search search, String requestPageToken, String apiKey) throws Exception;
	public Map<String,Object> getYoutubeList(Search search, String requestPageToken, String apiKey) throws Exception;
}
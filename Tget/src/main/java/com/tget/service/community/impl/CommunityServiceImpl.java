package com.tget.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


import com.tget.common.domain.Search;
import com.tget.service.community.CommunityDao;
import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;


@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
	
	
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
		// TODO Auto-generated constructor stub
	}
	
	

	@Override
	public void addContent(Content content) throws Exception {
		// TODO Auto-generated method stub
//		ObjectMapper om = new ObjectMapper();
//		HashMap<String,String> map = om.convertValue(content, HashMap.class);
		communityDao.InsertContent(content);
	}


	@Override
	public void addReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		
		communityDao.InsertReport(report);
	}
	
	@Override
	public void addReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		communityDao.InsertReply(reply);
	}
	
	


	@Override
	public Content getContent(int contentNo) throws Exception {
		// TODO Auto-generated method stub
		return communityDao.selectContent(contentNo);
	}
	
	@Override
	public Report getReport(int reportNo) throws Exception {
		// TODO Auto-generated method stub
		return communityDao.selectReport(reportNo);
	}
	
/*	@Override
	public List<Reply> getReply(int replyNo) throws Exception {
		// TODO Auto-generated method stub
		return communityDao.selectListReply(replyNo);
	}*/


	@Override
	public Map<String, Object> getContentList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Content> list= communityDao.selectListContent(search);
		int totalCount = communityDao.selectTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", totalCount);
		
		return map;
	}


	@Override
	public Map<String, Object> getReplyList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Reply> list= communityDao.selectListReply(search);
		int totalCount = communityDao.selectTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", totalCount);
		
		return map;
	}


	@Override
	public Map<String, Object> getReportList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Report> list= communityDao.selectListReport(search);
		int totalCount = communityDao.selectTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	


	@Override
	public void updateContent(Content content) throws Exception {
		// TODO Auto-generated method stub
		communityDao.updateContent(content);
	}
	
	@Override
	public void updateReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		communityDao.updateReply(reply);
	}
	
	@Override
	public void updateReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		communityDao.updateReport(report);
	}

	
	@Override
	public void deleteReply(int replyNo) throws Exception {
		// TODO Auto-generated method stub
		communityDao.deleteReply(replyNo);
	}
	
	@Override
	public void updateGoodCount(int contentNo) throws Exception {
		// TODO Auto-generated method stub
		communityDao.updateGoodCount(contentNo);
	}


	@Override
	public void updateBadCount(int contentNo) throws Exception {
		// TODO Auto-generated method stub
		communityDao.updateBadCount(contentNo);
	}

	@Override
	public void updateRefund(Content content) throws Exception {
		// TODO Auto-generated method stub
		communityDao.updateRefund(content);
	}


	@Override
	public Map<String, Object> getSearchLoad(String load) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("load", load );
		
		return map;
	}


	@Override
	public Map<String, Object> getSearchWeather(String weather) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("weather", weather );
		
		return map;
	}


	@Override
	public Reply getReply(int replyNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}	
}

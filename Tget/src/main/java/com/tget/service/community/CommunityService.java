package com.tget.service.community;

import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;

public interface CommunityService {
	
		// �Խñ� ��� ok
		public void addContent(Content content) throws Exception;
		
		// �Ű� ��� ok
		public void addReport(Report report) throws Exception;
		
		// ��� ��� ok
		public void addReply(Reply reply) throws Exception;
		
		// �Խñ� ��ȸ
		public Content getContent(int contentNo) throws Exception;
		
		// �Խñ� ����
		public void updateContent(Content content) throws Exception;
				
		// ��� ����
		public void updateReply(Reply reply) throws Exception;
		
		// ��� ����
		public void deleteReply(int replyNo) throws Exception;
		
		// �Խñ� ����Ʈ ��ȸ
		public Map<String,Object> getContentList(Search search) throws Exception;
		
		// ��� ����Ʈ ��ȸ
		public Map<String,Object> getReplyList(Search search) throws Exception;
		
		// �Ű� ����Ʈ ��ȸ
		public Map<String,Object> getReportList(Search search) throws Exception; //getTotalCount, getReportList 
		
		// ������
		public void updateGoodCount(Map<String,Object> goodCount)throws Exception;
		
		// �� ������
		public void updateBadCount(Map<String,Object> badCount)throws Exception;
		
		// ȯ�� �Խ��� ȯ�� ó��
		public void updateRefund(Content content) throws Exception;
		
		// �� ã��
		public Map<String,Object> getSearchLoad(String load) throws Exception;
		
		// ����
		public Map<String,Object> getSearchWeather(String weather) throws Exception;
		
		
}
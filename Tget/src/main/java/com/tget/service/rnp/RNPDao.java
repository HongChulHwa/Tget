package com.tget.service.rnp;

import java.util.List;
import java.util.Map;

import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.rnp.domain.Review;



//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface RNPDao {
	
	public void InsertReview(Review review) throws Exception;

	public Map<String,Object> selectPointHistory()  throws Exception;
	
	public Map<String,Object> selectReviewList()  throws Exception;
	
	public Map<String,Object> selectSellerEstimationList()  throws Exception;
	
	public void updateReview(Review review)  throws Exception;
	
	public void updatePoint(PointHistory pointHistory)  throws Exception;
	
	public PointHistory selectPoint()  throws Exception;
	
	public Review selectReview()  throws Exception;

	
}
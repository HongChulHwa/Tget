package com.tget.service.user;

import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.user.domain.User;


public interface UserService {
	//회원가입
	public void addUser(User user) throws Exception;
	//회원조회
	public User getUser(String userId) throws Exception;
	//회원목록 조회
	public Map<String , Object> getUserList(Search search) throws Exception;
	//회원 수정
	public void updateUser(User user) throws Exception;
	//아이디 유효성 체크
	public boolean checkDuplication(String userId) throws Exception;
	//블랙리스트 추가
	public void addBlacklist(User userId)throws Exception;
	//블랙리스트 조회
	public User getBlacklist(User userId)throws Exception;
	//판매자 추가
	public void addSeller(User user)throws Exception;
	//판매자 수정
	public void updateSeller(User user)throws Exception;
	//판매자 평가 조회
	public User getSellerEval(User user)throws Exception;
	//판매자 등급 조회
	public User getSalesGrade(String sellerCode)throws Exception;
	
	
	
	
	
}

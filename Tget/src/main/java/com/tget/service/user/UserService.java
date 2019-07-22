package com.tget.service.user;

import java.util.Date;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.user.domain.User;


public interface UserService {
	//ȸ������
	public void addUser(User user) throws Exception;
	//ȸ����ȸ
	public User getUser(String userId) throws Exception;
	//ȸ�������ȸ
	public Map<String , Object> getUserList(Search search) throws Exception;
	//ȸ�� ����
	public void updateUser(User user) throws Exception;
	//�ߺ��� üũ
	public boolean checkDuplication(String userId) throws Exception;
	//������Ʈ �߰�
	public void addBlacklist(User user)throws Exception;
	//������Ʈ ��ȸ
	public User getBlacklist(String userId)throws Exception;
	//�Ǹ��� ���
	public void addSeller(User user)throws Exception;
	//�Ǹ��� ����
	public void updateSeller(User user)throws Exception;
	//�Ǹ��� �� ��ȸ
	public User getSellerEval(String userId)throws Exception;
	//�Ǹŵ�� ��ȸ
	public User getSalesGrade(String userId)throws Exception;
/*	//�Ǹ��ڸ���Ʈ ��ȸ
	public Map<String , Object> getSellerList(Search search) throws Exception;*/
	public boolean  checknickNameDuplication(String nickName)throws Exception;
	
	public boolean  checkuserIdDuplication(String userId)throws Exception;
	
	public boolean checkcodeDuplication(String code)throws Exception;
	
	public User getCode(String code)throws Exception;
	
	public User finduserId(String phone)throws Exception;

	public User findPassword(String phone)throws Exception;
	
}

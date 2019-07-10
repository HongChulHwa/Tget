package com.tget.service.alarm.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tget.common.domain.Search;
import com.tget.service.alarm.AlarmDao;
import com.tget.service.alarm.AlarmService;
import com.tget.service.alarm.domain.Alarm;

@Service("alarmServiceImpl")
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	@Qualifier("alarmDaoImpl")
	private AlarmDao alarmDao;
	
	public void setAlarmDao(AlarmDao alarmDao) {
		this.alarmDao = alarmDao;
	}
	
	public AlarmServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}	
	
	//MetaDataȭ �ϱ�
	@Override
	public void addAlarm(Alarm alarm) throws Exception {
		// TODO Auto-generated method stub
		switch (alarm.getAlarmCode()) {
		case 0:
			alarm.setAlarmBody("Ƽ�ϰ����� �Ϸ�Ǿ����ϴ�.");
			break;
		case 1:
			alarm.setAlarmBody("�����̺�Ʈ�� �ű�Ƽ���� ��ϵǾ����ϴ�.");
			break;	
		case 2:
			alarm.setAlarmBody("�Ǹ�Ƽ���� ��ۿϷ� �Ǿ����ϴ�.");
			break;
		case 3:	
			alarm.setAlarmBody("����Ƽ���� ����� ���۵Ǿ����ϴ�.");
			break;
		case 4:
			alarm.setAlarmBody("������ �߱޵Ǿ����ϴ�.");
			break;
		case 5:
			alarm.setAlarmBody("�Ű�� ���� �ֽ��ϴ�. Ȯ�����ּ���.");
			break;
		case 6:
			alarm.setAlarmBody("�ۼ��ۿ� ����� ��ϵǾ����ϴ�.");
			break;
		case 7:
			alarm.setAlarmBody("ȯ���� ó���Ǿ����ϴ�.");
			break;
		case 8:
			alarm.setAlarmBody("�Ǹŵ���� �����Ǿ����ϴ�. Ȯ�����ּ���.");
			break;	
		default:
			break;
		}
		
		alarmDao.insertAlarm(alarm);
		
	}

	@Override
	public int getNoReadAlarmCount(String userId) throws Exception {
		// TODO Auto-generated method stub		
		return alarmDao.selectNoReadAlarmCount(userId);
	}

	@Override
	public Map<String, Object> getAlarmList(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		List<Alarm> list = alarmDao.selectListAlarm(search);
		int totalCount = alarmDao.selectTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void deleteAlarm(int alarmNo) throws Exception {
		// TODO Auto-generated method stub
		alarmDao.deleteAlarm(alarmNo);
	}

	@Override
	public void updateAlarmRead(int alarmNo) throws Exception {
		// TODO Auto-generated method stub
		alarmDao.updateAlarmRead(alarmNo);
	}

}

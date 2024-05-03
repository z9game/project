package kosmo.team.project.service;

import java.util.Map;

public interface LoginService {

	public int getmidpwdCnt(Map<String,String> midpwd);
	
	public String getNickname(String mid);
}
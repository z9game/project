package kosmo.team.project.service;

import java.util.Map;


import kosmo.team.project.dto.MemberDTO;

public interface MemberService {

	int insertMember(MemberDTO memberDTO);
	
	int getmid(Map<String,String> mid);
}

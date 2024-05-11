package kosmo.team.project.service;

import java.util.Map;


import kosmo.team.project.dto.MemberDTO;

public interface MemberService {

	int insertMember(MemberDTO memberDTO);
	
	int getmid(Map<String,String> mid);
	
	MemberDTO updateMem(String mid);
	
	//마이페이지에 있는 내 정보 가져오기
    MemberDTO getMyInfo(String mid);
    //마이페이지에 있는 내 기록 가져오기
    MemberDTO getMyStat(String mid);
}

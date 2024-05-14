package kosmo.team.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.bookingDTO;

@Mapper
public interface MemberDAO {

	int insertMember(MemberDTO memberDTO);
	int getmid(Map<String,String> mid);
	int insertDetail(MemberDTO memberDTO);
	int insertRecoed(MemberDTO memberDTO);
	MemberDTO updateMemForm(String mid);
	
	//마이페이지에 있는 내 정보 가져오기
	MemberDTO getMyInfo(String mid);
	//마이페이지에 있는 내 기록 가져오기
	MemberDTO getMyStat(String mid);
	
	int updateMem(MemberDTO memberDTO);
	
	List<bookingDTO> getBookedStadium(int m_no);
}

package kosmo.team.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kosmo.team.project.dao.MemberDAO;

import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.TeamDTO;
import kosmo.team.project.dto.bookingDTO;

@Service
@Transactional
public class MemberServiceImplements implements MemberService {
	
	
	@Autowired
	private MemberDAO memberDAO;

	public int insertMember(MemberDTO memberDTO)
	{

		int memberCnt = this.memberDAO.insertMember(memberDTO);
		
		int mem_detail = this.memberDAO.insertDetail(memberDTO);
		
		int mem_record = this.memberDAO.insertRecoed(memberDTO);
		
		return memberCnt;
	}
	
	public int getmid(Map<String,String> mid)
	{

		int memberCnt = this.memberDAO.getmid(mid);
		
		
		return memberCnt;
	}
	
	public MemberDTO updateMem(String mid)
	{
		MemberDTO updateMem = this.memberDAO.updateMemForm(mid);
		
		return updateMem;
	}
	
	//마이페이지에 있는 내 정보 가져오기
	public MemberDTO getMyInfo(int m_no)
	 {
		 MemberDTO getMyInfo = this.memberDAO.getMyInfo(m_no);
		 
		 return getMyInfo;
		 
	 }
	//마이페이지에 있는 내 기록 가져오기
	public MemberDTO getMyStat(String mid)
	{
		 MemberDTO getMyStat = this.memberDAO.getMyStat(mid);
		 
		 return getMyStat;
	}
	
	public int updateMem(MemberDTO memberDTO)
	{
		int updateMem = this.memberDAO.updateMem(memberDTO);
		
		return updateMem;
	}
	
	public List<bookingDTO> getBookedStadium(int m_no) {
		
		List<bookingDTO> getBookedStadium = this.memberDAO.getBookedStadium(m_no);
		
		return getBookedStadium;
	}
	//팀 생성
	public int registTeam(TeamDTO teamDTO){
		
		int registTeam = this.memberDAO.registTeam(teamDTO);
		
		int firstTeamMem = this.memberDAO.firstTeamMem(teamDTO);
		
		if(registTeam > 1) {
			return 2;
		}
		return registTeam;
	}

    //승낙테이블의 개수가 몇개인지 확인
    public int getWaitingCnt(int m_no) {
    	int getWaitingCnt = this.memberDAO.getWaitingCnt(m_no);
    	
    	return getWaitingCnt;
    }
    
    //승낙 대기인원 정보가져오기
    public List<TeamDTO> getWaitingList(int m_no){
  		List<TeamDTO> getWaitingList = this.memberDAO.getWaitingList(m_no);
  		 return getWaitingList;
  	 }
    

	//승낙 수락 할때
	 public int regTeamMem(TeamDTO teamDTO){
		 int regTeamMem = this.memberDAO.regTeamMem(teamDTO);
		 int delWaitingList = this.memberDAO.delWaitingList(teamDTO);
		 return regTeamMem;
	 }
}

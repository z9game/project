package kosmo.team.project.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kosmo.team.project.dao.MemberDAO;

import kosmo.team.project.dto.MemberDTO;

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
		MemberDTO updateMem = this.memberDAO.updateMem(mid);
		
		return updateMem;
	}
	
	//마이페이지에 있는 내 정보 가져오기
	public MemberDTO getMyInfo(String mid)
	 {
		 MemberDTO getMyInfo = this.memberDAO.getMyInfo(mid);
		 
		 return getMyInfo;
		 
	 }
	//마이페이지에 있는 내 기록 가져오기
	public MemberDTO getMyStat(String mid)
	{
		 MemberDTO getMyStat = this.memberDAO.getMyStat(mid);
		 
		 return getMyStat;
	}
}

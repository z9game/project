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
		
		return memberCnt;
	}
	
	public int getmid(Map<String,String> mid)
	{

		int memberCnt = this.memberDAO.getmid(mid);
		
		
		return memberCnt;
	}
}

package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosmo.team.project.dao.AdminDAO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.MemberSearchDTO;

@Service
public class AdminServiceImplements implements AdminService {

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public List<MemberDTO> getMemberList(MemberSearchDTO memberSearchDTO) {

		List<MemberDTO> memberList = this.adminDAO.getMemberList(memberSearchDTO);

		return memberList;

	}
    
    public int getMemberListCnt(MemberSearchDTO memberSearchDTO) {

		int memberListCnt = this.adminDAO.getMemberListCnt(memberSearchDTO);

		return memberListCnt;

	}
    
    
    
    public int getMemberListAllCnt() {
		// --------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		// --------------------------------------
		int memberListAllCnt = this.adminDAO.getMemberListAllCnt();
		// --------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		// --------------------------------------
		return memberListAllCnt;
	}
	
	
	
	public MemberDTO getMember(int b_no) {

		MemberDTO memberDTO = this.adminDAO.getMember(b_no);

		return memberDTO;

	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

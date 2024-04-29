package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosmo.team.project.dao.AdminDAO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.MemberSearchDTO;
import kosmo.team.project.dto.PlayerRecordDTO;

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

	public MemberDTO getMember(int m_no) {

		MemberDTO memberDTO = this.adminDAO.getMember(m_no);

		return memberDTO;

	}

	public MemberDTO getMemberForUpDel(int m_no) {

		MemberDTO MemberDTO = this.adminDAO.getMember(m_no);

		return MemberDTO;

	}

	public int updateMember(MemberDTO memberDTO) {

		// --------------------------------------
		// 수정할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int memberCnt = this.adminDAO.getMemberCnt(memberDTO.getM_no());
		if (memberCnt == 0) {
			return memberCnt;
		}
		int memberUpCnt = this.adminDAO.updateMember(memberDTO);

		// 수정 적용개수 리턴하기
		return memberUpCnt;
	}

	public int deleteMember(MemberDTO memberDTO) {

		// --------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int memberCnt = this.adminDAO.getMemberCnt(memberDTO.getM_no());
		if (memberCnt == 0) {
			return memberCnt;
		}
		
		
		int memberDelCnt = this.adminDAO.deleteMember(memberDTO);

		// 수정 적용개수 리턴하기
		return memberDelCnt;

	}

	public PlayerRecordDTO getPlayerRecord(int m_no) {

		PlayerRecordDTO playerRecordDTO = this.adminDAO.getPlayerRecord(m_no);

		return playerRecordDTO;

	}

	public PlayerRecordDTO getRecordUpDel(int m_no) {

		PlayerRecordDTO playerRecordDTO = this.adminDAO.getPlayerRecord(m_no);

		return playerRecordDTO;

	}

	public int updatePlayerRecord(PlayerRecordDTO playerRecordDTO) {

		// --------------------------------------
		// 수정할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int playerRecordCnt = this.adminDAO.getPlayerRecordCnt(playerRecordDTO.getPlayer());
		if (playerRecordCnt == 0) {
			return playerRecordCnt;
		}
		int playerRecordUpCnt = this.adminDAO.updatePlayerRecord(playerRecordDTO);

		// 수정 적용개수 리턴하기
		return playerRecordUpCnt;
	}
	
	public int deletePlayerRecord(PlayerRecordDTO playerRecordDTO) {

		// --------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int PlayerRecordCnt = this.adminDAO.getPlayerRecordCnt(playerRecordDTO.getPlayer());
		if (PlayerRecordCnt == 0) {
			return PlayerRecordCnt;
		}
		
		
		int PlayerRecordDelCnt = this.adminDAO.deletePlayerRecord(playerRecordDTO);

		// 수정 적용개수 리턴하기
		return PlayerRecordDelCnt;

	}
	
	
	

}

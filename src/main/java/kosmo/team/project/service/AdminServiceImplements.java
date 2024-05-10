package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosmo.team.project.dao.AdminDAO;
import kosmo.team.project.dto.AdminSearchDTO;
import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.PlayerRecordDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.Stadim2DTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

@Service
public class AdminServiceImplements implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<MemberDTO> getMemberList(AdminSearchDTO AdminSearchDTO) {

		List<MemberDTO> memberList = this.adminDAO.getMemberList(AdminSearchDTO);

		return memberList;

	}

	public int getMemberListCnt(AdminSearchDTO AdminSearchDTO) {

		int memberListCnt = this.adminDAO.getMemberListCnt(AdminSearchDTO);

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

	// --------------------------
	// 공지사항
	// --------------------------

	@Override
	public List<CommunityDTO> getNoticeBoardList(AdminSearchDTO adminSearchDTO) {

		List<CommunityDTO> noticeBoardList = this.adminDAO.getNoticeBoardList(adminSearchDTO);

		return noticeBoardList;

	}

	@Override
	public int getNoticeBoardListCnt(AdminSearchDTO adminSearchDTO) {

		int noticeBoardListCount = this.adminDAO.getNoticeBoardListCnt(adminSearchDTO);

		return noticeBoardListCount;

	}

	public int getNoticeBoardAllCnt() {
		// --------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		// --------------------------------------
		int noticeBoardListAllCnt = this.adminDAO.getNoticeBoardAllCnt();
		// --------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		// --------------------------------------
		return noticeBoardListAllCnt;
	}

	public CommunityDTO getNoticeBoard(int b_no) {

		int updateCnt = this.adminDAO.updateNoticeBoardReadCount(b_no);

		CommunityDTO communityDTO = this.adminDAO.getNoticeBoard(b_no);

		return communityDTO;

	}

	// 이아래쪽은 공지사항 수정,삭제

	public CommunityDTO getNoticeBoardForUpDel(int b_no) {

		CommunityDTO communityDTO = this.adminDAO.getNoticeBoard(b_no);

		return communityDTO;

	}

	public int updateNoticeBoard(CommunityDTO communityDTO) {

		// --------------------------------------
		// 수정할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int boardCnt = this.adminDAO.getNoticeBoardCnt(communityDTO.getB_no());
		if (boardCnt == 0) {
			return boardCnt;
		}
		int boardUpCnt = this.adminDAO.updateNoticeBoard(communityDTO);

		// 수정 적용개수 리턴하기
		return boardUpCnt;
	}

	public int deleteNoticeBoard(CommunityDTO communityDTO) {

		// --------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int boardCnt = this.adminDAO.getNoticeBoardCnt(communityDTO.getB_no());
		if (boardCnt == 0) {
			return boardCnt;
		}

		int boardDelCnt = this.adminDAO.deleteNoticeBoard(communityDTO);

		// 수정 적용개수 리턴하기
		return boardDelCnt;
	}

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 게시판 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	public int insertNoticeBoard(CommunityDTO communityDTO) {
		// ----------------------------------------------
		// BoardDAOImpl 객체의
		// insertBoard 메소드 호출하여
		// 게시판 글 입력 후 입력 적용 행의 개수 얻기
		// ----------------------------------------------
		int adminNoticeboardRegCnt = this.adminDAO.insertNoticeBoard(communityDTO);

		// ----------------------------------------------
		// 1개 게시판 글 입력 적용 행의 개수 리턴하기
		// ----------------------------------------------
		return adminNoticeboardRegCnt;
	}
	
	
	
	
	
	//------------------------------------------------------
	//경기장
	//------------------------------------------------------
	
	

	@Override
	public List<Stadim2DTO> getStadiumList(AdminSearchDTO adminSearchDTO) {

		List<Stadim2DTO> stadiumList = this.adminDAO.getStadiumList(adminSearchDTO);

		return stadiumList;

	}

	
	@Override
	public int getStadiumListCnt(AdminSearchDTO adminSearchDTO) {

		int StadiumListCnt = this.adminDAO.getStadiumListCnt(adminSearchDTO);

		return StadiumListCnt;

	}

	public int getStadiumListAllCnt() {
		// --------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		// --------------------------------------
		int StadiumListAllCnt = this.adminDAO.getStadiumListAllCnt();
		// --------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		// --------------------------------------
		return StadiumListAllCnt;
	}

	public Stadim2DTO getStadium(int stadium_no) {

	
		Stadim2DTO stadim2DTO = this.adminDAO.getStadium(stadium_no);

		return stadim2DTO;

	}
	
	public Stadim2DTO getStadiumForUpDel(int stadium_no) {

		Stadim2DTO stadim2DTO = this.adminDAO.getStadium(stadium_no);

		return stadim2DTO;

	}
	
	
	
	

	public int updateStadium(Stadim2DTO stadim2DTO) {

		// --------------------------------------
		// 수정할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int stadiumCnt = this.adminDAO.getStadiumCnt(stadim2DTO.getStadium_no());
		if (stadiumCnt == 0) {
			return stadiumCnt;
		}
		int stadiumUpCnt = this.adminDAO.updateStadium(stadim2DTO);

		// 수정 적용개수 리턴하기
		return stadiumUpCnt;
	}

	
	
	
	public int deleteStadium(Stadim2DTO  stadim2DTO) {

		// --------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int stadiumCnt = this.adminDAO.getStadiumCnt(stadim2DTO.getStadium_no());
		if (stadiumCnt == 0) {
			return stadiumCnt;
		}

		int stadiumDelCnt = this.adminDAO.deleteStadium(stadim2DTO);

		// 수정 적용개수 리턴하기
		return stadiumDelCnt;
	}
	
	
	public int insertStadium(Stadim2DTO stadim2DTO) {
		// ----------------------------------------------
		// BoardDAOImpl 객체의
		// insertBoard 메소드 호출하여
		// 게시판 글 입력 후 입력 적용 행의 개수 얻기
		// ----------------------------------------------
		int adminStadiumRegCnt = this.adminDAO.insertStadium(stadim2DTO);

		// ----------------------------------------------
		// 1개 게시판 글 입력 적용 행의 개수 리턴하기
		// ----------------------------------------------
		return adminStadiumRegCnt;
	}
	
	
	public List<TournamentDTO> getTournamentList(TournamentSearchDTO tournamentSearchDTO) {

		List<TournamentDTO> tournamentList = this.adminDAO.getTournamentList(tournamentSearchDTO);

		return tournamentList;

	}
	
	public int getTournamentListCnt(TournamentSearchDTO tournamentSearchDTO) {
		
		int getTournamentListCnt = this.adminDAO.getTournamentListCnt(tournamentSearchDTO);

		return getTournamentListCnt;
	}
	
	
	
	
	
	

}

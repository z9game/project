package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.AdminSearchDTO;
import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.PlayerRecordDTO;
import kosmo.team.project.dto.Stadim2DTO;

@Mapper
public interface AdminDAO {
	// 모든 회원 목록을 가져오는 메서드
	public List<MemberDTO> getMemberList(AdminSearchDTO adminSearchDTO);

	public int getMemberListCnt(AdminSearchDTO adminSearchDTO);

	public int getMemberListAllCnt();

	MemberDTO getMember(int m_no);
	
	int getMemberCnt(int m_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateMember(MemberDTO memberDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteMember(MemberDTO memberDTO);

	PlayerRecordDTO getPlayerRecord(int m_no);
	
	int getPlayerRecordCnt(int m_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updatePlayerRecord(PlayerRecordDTO playerRecordDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deletePlayerRecord(PlayerRecordDTO playerRecordDTO);

	
	//---------------------------------------
	// 공지사항
	//--------------------------------------
	
	public List<CommunityDTO> getNoticeBoardList(AdminSearchDTO adminSearchDTO);

	public int getNoticeBoardListCnt(AdminSearchDTO adminSearchDTO);

	public int getNoticeBoardAllCnt();

	CommunityDTO getNoticeBoard(int b_no);

	int updateNoticeBoardReadCount(int b_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateNoticeBoard(CommunityDTO communityDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteNoticeBoard(CommunityDTO communityDTO);

	int getNoticeBoardCnt(int b_no);
	
	
	int insertNoticeBoard(CommunityDTO communityDTO);
	
	
	
	
	
	// ----------------------------------------
	// 경기장
	// ----------------------------------------
	public List<Stadim2DTO> getStadiumList(AdminSearchDTO adminSearchDTO);

	public int getStadiumListCnt(AdminSearchDTO adminSearchDTO);

	public int getStadiumListAllCnt();

	Stadim2DTO getStadium(int stadium_no);

	
	int getStadiumCnt(int stadium_no);
	
	
	

	
	
	
	
	
	
	
	
	
	
}

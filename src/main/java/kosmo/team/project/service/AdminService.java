package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.AdminSearchDTO;
import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.PlayerRecordDTO;

public interface AdminService {
	// 모든 회원 목록을 불러오는 메서드
	public List<MemberDTO> getMemberList(AdminSearchDTO adminSearchDTO);

	public int getMemberListCnt(AdminSearchDTO adminSearchDTO);

	public int getMemberListAllCnt();

	MemberDTO getMember(int m_no);

	MemberDTO getMemberForUpDel(int m_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateMember(MemberDTO memberDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteMember(MemberDTO memberDTO);

	PlayerRecordDTO getPlayerRecord(int m_no);

	PlayerRecordDTO getRecordUpDel(int m_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updatePlayerRecord(PlayerRecordDTO playerRecordDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deletePlayerRecord(PlayerRecordDTO playerRecordDTO);

	// ----------------------------------------
	// 공지사항
	// ----------------------------------------
	public List<CommunityDTO> getNoticeBoardList(AdminSearchDTO adminSearchDTO);

	public int getNoticeBoardListCnt(AdminSearchDTO adminSearchDTO);

	public int getNoticeBoardAllCnt();

	CommunityDTO getNoticeBoard(int b_no);

	CommunityDTO getNoticeBoardForUpDel(int b_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateNoticeBoard(CommunityDTO communityDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteNoticeBoard(CommunityDTO communityDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int insertNoticeBoard(CommunityDTO communityDTO);

}

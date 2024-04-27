package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunitySearchDTO;

public interface CommunityService {

	public List<CommunityDTO> getNoticeBoardList(CommunitySearchDTO communitySearchDTO);

	public int getNoticeBoardListCnt(CommunitySearchDTO communitySearchDTO);

	public int getNoticeBoardAllCnt();

	CommunityDTO getNoticeBoard(int b_no);

	
	CommunityDTO getNoticeBoardForUpDel(int b_no);
	
	
	
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 게시판] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateNoticeBoard(CommunityDTO communityDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 게시판] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteNoticeBoard(CommunityDTO communityDTO);
	
	
	

	
	
	
	// 자유게시판

	public int getFreeBoardListCnt(CommunityDTO communityDTO);

	public List<CommunityDTO> getFreeBoardList(CommunityDTO communityDTO);

	public int getImageBoardListCnt(CommunityDTO communityDTO);

	public List<CommunityDTO> getImageBoardList(CommunityDTO communityDTO);
}

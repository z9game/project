package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunityFreeBoardDetailDTO;
import kosmo.team.project.dto.CommunitySearchDTO;

public interface CommunityService {

	//----------------------------------------
	//공지사항
	//----------------------------------------
	public List<CommunityDTO> getNoticeBoardList(CommunitySearchDTO communitySearchDTO);

	public int getNoticeBoardListCnt(CommunitySearchDTO communitySearchDTO);

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
	
	
	

	
	
	//----------------------------------------
	// 자유게시판
	//----------------------------------------
	public List<CommunityDTO> getFreeBoardList(CommunitySearchDTO communitySearchDTO);

	public int getFreeBoardListCnt(CommunitySearchDTO communitySearchDTO);

	public int getFreeBoardAllCnt();

	CommunityDTO getFreeBoard(int b_no);
	
	public CommunityFreeBoardDetailDTO getFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO);
	
	public int getFreeBoardDetailCommentPageListCount(CommunityFreeBoardDetailDTO detailDTO);
	
	public List<CommunityFreeBoardDetailDTO> getFreeBoardDetailCommentPageList(CommunityFreeBoardDetailDTO detailDTO);
	
	public int insertFreeBoardDetailComment(CommunityFreeBoardDetailDTO detailDTO);
	
	public int insertFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO);
	
	public int updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO);
	
	
	
	

	
	
	
	
	
	
	//----------------------------------------
	//갤러리
	//----------------------------------------
	/*public int getImageBoardListCnt(CommunityDTO communityDTO);

	public List<CommunityDTO> getImageBoardList(CommunityDTO communityDTO);
	*/
	public int insertGallaryCommunity(CommunityDTO communityDTO);
	
	public int getImageGallaryBoardListCnt(CommunityDTO communityDTO);
	
	public List<CommunityDTO> getImageGallaryBoardList(CommunityDTO communityDTO);
	
	
	
	
	
	
	
	
	
	
	
	
	
	//----------------------------------------
	//장터
	//----------------------------------------
	public int insertCommunity(CommunityDTO communityDTO);
	
	public int getImageBoardListCnt(CommunityDTO communityDTO);
	
	public List<CommunityDTO> getImageBoardList(CommunityDTO communityDTO);
	
	
}

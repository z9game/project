package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunityFreeBoardDetailDTO;
import kosmo.team.project.dto.CommunitySearchDTO;

public interface CommunityService {

	//----------------------------------------
	//공지사항
	//----------------------------------------
	
	/*** 공지사항 리스트 가져오기 ***/
	public List<CommunityDTO> getNoticeBoardList(CommunitySearchDTO communitySearchDTO);

	/*** 공지사항 리스트 개수 가져오기 ***/
	public int getNoticeBoardListCnt(CommunitySearchDTO communitySearchDTO);

	/*** 공지사항 모든 리스트 가져오기 ***/
	public int getNoticeBoardAllCnt();

	/*** 공지사항 상세보기 1개 가져오기 ***/
	CommunityDTO getNoticeBoard(int b_no);
	
	/*** 공지사항 수정삭제 페이지에서 상세보기 ***/
	CommunityDTO getNoticeBoardForUpDel(int b_no);
	
	/*** [1개 공지사항] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언 ***/
	int updateNoticeBoard(CommunityDTO communityDTO);

	/*** [1개 공지사항] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언 ***/
	int deleteNoticeBoard(CommunityDTO communityDTO);
	
	
	

	
	
	//----------------------------------------
	// 자유게시판
	//----------------------------------------
	
	/*** 자유게시판 리스트가져오기 ***/
	public List<CommunityDTO> getFreeBoardList(CommunitySearchDTO communitySearchDTO);

	/*** 자유게시판 리스트 개수 ***/
	public int getFreeBoardListCnt(CommunitySearchDTO communitySearchDTO);

	/*** 자유게시판 모든 리스트 개수 가져오기 ***/
	public int getFreeBoardAllCnt();

	/*** 자유게시판 상세페이지 1개 가져오기 ***/
	CommunityDTO getFreeBoard(int b_no);
	
	/*** 자유게시판 상세  ***/	
	public CommunityFreeBoardDetailDTO getFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO);
	
	/*** 자유게시판 댓글의 전체 갯수  ***/	
	public int getFreeBoardDetailCommentPageListCount(CommunityFreeBoardDetailDTO detailDTO);
	
	/*** 자유게시판 댓글의 페이지  ***/
	public List<CommunityFreeBoardDetailDTO> getFreeBoardDetailCommentPageList(CommunityFreeBoardDetailDTO detailDTO);
	
	/*** 자유게시판 댓글  ***/
	public int insertFreeBoardDetailComment(CommunityFreeBoardDetailDTO detailDTO);
	
	/*** 자유게시판 댓글의 댓글  ***/
	public int insertFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO);
	
	/*** 자유게시판 조회수 1증가  ***/
	public int updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO);
	
	/*** 자유게시판 상세 업데이트  ***/
	public int updateCommunityFreeBoard(CommunityDTO communityDTO);
	
	/*** 자유게시판 상세 삭제  ***/
	public int deleteCommunityFreeBoard(CommunityDTO communityDTO);
	
	/*** 자유게시판 입력  ***/
	public int insertCommunityFreeBoard(CommunityDTO communityDTO);
	
	
	
	
		
	//----------------------------------------
	//갤러리
	//----------------------------------------
	
	/*** 갤러리 등록  ***/
	public int insertGallaryCommunity(CommunityDTO communityDTO);
	
	/*** 갤러리 리스트 개수 가져오기  ***/
	public int getImageGallaryBoardListCnt(CommunityDTO communityDTO);
	
	/*** 갤러리 리스트 가져오기  ***/
	public List<CommunityDTO> getImageGallaryBoardList(CommunityDTO communityDTO);
	
	
	
	
		
	//----------------------------------------
	//장터
	//----------------------------------------
	
	/*** 장터 등록  ***/
	public int insertCommunity(CommunityDTO communityDTO);
	
	/*** 장터 리스트 개수 가져오기  ***/
	public int getImageBoardListCnt(CommunityDTO communityDTO);
	
	/*** 장터 리스트 가져오기  ***/
	public List<CommunityDTO> getImageMarketBoardList(CommunityDTO communityDTO);
	
	/*** 장터 sale, free_sharing 테이블 리스트 총 개수 가져오기  ***/
	public int getTabAllMarketplaceBoardListAllCnt();
	
	/*** 장터 sale, free_sharing 테이블 리스트 개수 가져오기 ***/
	public int getTabAllMarketplaceBoardListCnt(CommunitySearchDTO communitySearchDTO);
	
	/*** 장터 sale, free_sharing 테이블 리스트 가져오기 ***/
	public List<CommunityDTO> getTabAllMarketplaceBoardList(CommunitySearchDTO communitySearchDTO);
	
	/*** 장터 sale 테이블 리스트 총 개수 가져오기  ***/
	public int getTabSaleMarketplaceBoardListAllCnt();
	
	/*** 장터 sale 테이블 리스트 개수 가져오기  ***/
	public int getTabSaleMarketplaceBoardListCnt(CommunitySearchDTO communitySearchDTO);
	
	/*** 장터 sale 테이블 리스트 가져오기 ***/
	public List<CommunityDTO> getTabSaleMarketplaceBoardList(CommunitySearchDTO communitySearchDTO); 
	
	/*** 장터 Free_Sharing 테이블 리스트 총 개수 가져오기  ***/
	public int getTabFreeSharingMarketplaceBoardListAllCnt(); 
	
	/*** 장터 Free_Sharing 테이블 리스트 개수 가져오기  ***/
	public int getTabFreeSharingMarketplaceBoardListCnt(CommunitySearchDTO communitySearchDTO);
	
	/*** 장터 Free_Sharing 테이블 리스트 가져오기 ***/
	public List<CommunityDTO> getTabFreeSharingMarketplaceBoardList(CommunitySearchDTO communitySearchDTO);

	
	public CommunityDTO getCommunityMarketplaceSaleDetailForm(int b_no);
	
	public CommunityDTO getCommunityMarketplaceFreeSharingDetailForm(int b_no);
	
	public int updateMarketplaceSaleBoard(CommunityDTO communityDTO);
	
	public int updateMarketplaceFreeSharingBoard(CommunityDTO communityDTO);
	
	public int deleteMarketplaceSaleBoard(CommunityDTO communityDTO);
	
	public int deleteMarketplaceFreeSharingBoard(CommunityDTO communityDTO);
}

package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.CommunityDAO;
import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunityFreeBoardDetailDTO;
import kosmo.team.project.dto.CommunitySearchDTO;

@Service
@Transactional
public class CommunityServiceImplements implements CommunityService {

	@Autowired
	private CommunityDAO communityDAO;

	// --------------------------
	// 공지사항
	// --------------------------

	@Override
	public List<CommunityDTO> getNoticeBoardList(CommunitySearchDTO communitySearchDTO) {

		List<CommunityDTO> noticeBoardList = this.communityDAO.getNoticeBoardList(communitySearchDTO);

		return noticeBoardList;

	}

	@Override
	public int getNoticeBoardListCnt(CommunitySearchDTO communitySearchDTO) {

		int noticeBoardListCount = this.communityDAO.getNoticeBoardListCnt(communitySearchDTO);

		return noticeBoardListCount;

	}

	public int getNoticeBoardAllCnt() {
		// --------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		// --------------------------------------
		int noticeBoardListAllCnt = this.communityDAO.getNoticeBoardAllCnt();
		// --------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		// --------------------------------------
		return noticeBoardListAllCnt;
	}

	public CommunityDTO getNoticeBoard(int b_no) {

		int updateCnt = this.communityDAO.updateNoticeBoardReadCount(b_no);

		CommunityDTO communityDTO = this.communityDAO.getNoticeBoard(b_no);

		return communityDTO;

	}

	// 이아래쪽은 공지사항 수정,삭제
	public CommunityDTO getNoticeBoardForUpDel(int b_no) {

		CommunityDTO communityDTO = this.communityDAO.getNoticeBoard(b_no);

		return communityDTO;

	}

	public int updateNoticeBoard(CommunityDTO communityDTO) {

		// --------------------------------------
		// 수정할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int boardCnt = this.communityDAO.getNoticeBoardCnt(communityDTO.getB_no());
		if (boardCnt == 0) {
			return boardCnt;
		}
		int boardUpCnt = this.communityDAO.updateNoticeBoard(communityDTO);

		// 수정 적용개수 리턴하기
		return boardUpCnt;
	}

	public int deleteNoticeBoard(CommunityDTO communityDTO) {

		// --------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int boardCnt = this.communityDAO.getNoticeBoardCnt(communityDTO.getB_no());
		if (boardCnt == 0) {
			return boardCnt;
		}

		int boardDelCnt = this.communityDAO.deleteNoticeBoard(communityDTO);

		// 수정 적용개수 리턴하기
		return boardDelCnt;
	}
	
	
	
	
	
	// ---------------------------------
	// 자유게시판
	// ---------------------------------

	@Override
	public List<CommunityDTO> getFreeBoardList(CommunitySearchDTO communitySearchDTO) {

		List<CommunityDTO> freeBoardList = this.communityDAO.getFreeBoardList(communitySearchDTO);

		return freeBoardList;

	}

	@Override
	public int getFreeBoardListCnt(CommunitySearchDTO communitySearchDTO) {

		int freeBoardListCount = this.communityDAO.getFreeBoardListCnt(communitySearchDTO);

		return freeBoardListCount;

	}

	public int getFreeBoardAllCnt() {
		// --------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		// --------------------------------------
		int freeBoardListAllCnt = this.communityDAO.getFreeBoardAllCnt();
		// --------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		// --------------------------------------
		return freeBoardListAllCnt;
	}

	public CommunityDTO getFreeBoard(int b_no) {

		CommunityDTO communityDTO = this.communityDAO.getFreeBoard(b_no);

		return communityDTO;

	}
	
	public int updateCommunityFreeBoard(CommunityDTO communityDTO) {
		
		int boardCount = communityDAO.getCommunityFreeBoardCount(communityDTO.getB_no());
		
		if (boardCount == 0) {
			return boardCount;
		}
		
		int boardUpdateCount = communityDAO.updateCommunityFreeBoard(communityDTO);

		return boardUpdateCount;
	}
	
	@Override
	public int deleteCommunityFreeBoard(CommunityDTO communityDTO) {

		int b_no = communityDTO.getB_no();
		int boardCount = communityDAO.getCommunityFreeBoardCount(b_no);
		
		if (boardCount == 0) {
			return boardCount;
		}
		
		int commentCount = communityDAO.getFreeBoardCommentCount(b_no);
		
		if (commentCount > 0) {
			return -1;
		}

		int boardDeleteCount = communityDAO.deleteCommunityFreeBoard(communityDTO);

		return boardDeleteCount;
		
	}
	
	@Override
	public int insertCommunityFreeBoard(CommunityDTO communityDTO) {
		
		int boardRegCount = communityDAO.insertCommunityFreeBoard(communityDTO);
		
		return boardRegCount;
		
	}
	
	@Override
	public CommunityFreeBoardDetailDTO getFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO) {
	
		CommunityFreeBoardDetailDTO freeBoardDetail = communityDAO.getFreeBoardDetail(detailDTO);
		
		return freeBoardDetail;
		
	}
	
	@Override
	public int updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO) {
		
		return communityDAO.updateFreeBoardDetailReadCountPlusOne(detailDTO);
		
	}
	
	@Override
	public int insertFreeBoardDetailComment(CommunityFreeBoardDetailDTO detailDTO) {

		int insertFreeBoardDetailCommentCount = communityDAO.insertFreeBoardDetailComment(detailDTO);

		return insertFreeBoardDetailCommentCount;

	}
	
	@Override
	public int insertFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO) {

		communityDAO.updateFreeBoardDetailCommentToComment(detailDTO);
		
		int insertFreeBoardDetailCommentToCommentCount = communityDAO.insertFreeBoardDetailCommentToComment(detailDTO);

		return insertFreeBoardDetailCommentToCommentCount;

	}
	
	@Override
	public int getFreeBoardDetailCommentPageListCount(CommunityFreeBoardDetailDTO detailDTO) {

		int freeBoardDetailCommentPageListCount = communityDAO.getFreeBoardDetailCommentPageListCount(detailDTO);

		return freeBoardDetailCommentPageListCount;

	}
	
	
	@Override
	public List<CommunityFreeBoardDetailDTO> getFreeBoardDetailCommentPageList(CommunityFreeBoardDetailDTO detailDTO) {
		
		List<CommunityFreeBoardDetailDTO> freeBoardDetailCommentPageList = communityDAO.getFreeBoardDetailCommentPageList(detailDTO);

		return freeBoardDetailCommentPageList;
		
	}
	
	
	
	
	// -----------------------------------
	// 갤러리
	// -----------------------------------
	@Override
	public int insertGallaryCommunity(CommunityDTO communityDTO) {
		int boardGallaryRegCnt = this.communityDAO.insertGallaryCommunity(communityDTO);
		return boardGallaryRegCnt;
	}
	

	@Override
	public int getImageGallaryBoardListCnt(CommunityDTO communityDTO) {
		int imageBoardGallaryListCnt = communityDAO.getImageGallaryBoardListCnt(communityDTO);
		return imageBoardGallaryListCnt;
	}

	@Override
	public List<CommunityDTO> getImageGallaryBoardList(CommunityDTO communityDTO) {
		List<CommunityDTO> listGallaryBoard = communityDAO.getImageGallaryBoardList(communityDTO);
		return listGallaryBoard;
	}

	
	
	
	

	// -----------------------------------
	// 장터
	// -----------------------------------
	/*** 장터 등록  ***/
	@Override
	public int insertCommunity(CommunityDTO communityDTO) {
		int boardRegCnt = this.communityDAO.insertCommunity(communityDTO);
		return boardRegCnt;
	}
	
	/*** 장터 리스트 개수 가져오기  ***/
	@Override
	public int getImageBoardListCnt(CommunityDTO communityDTO) {

		int imageBoardListCnt = communityDAO.getImageBoardListCnt(communityDTO);

		return imageBoardListCnt;
	}
	//Image-----------------------------------------------------------------------------------------------
	/*** 장터 리스트 가져오기  ***/
	@Override
	public List<CommunityDTO> getImageMarketBoardList(CommunityDTO communityDTO) {
		List<CommunityDTO> imageBoardList = communityDAO.getImageMarketBoardList(communityDTO);
		return imageBoardList;
	}
	
	//-All----------------------------------------------------------------------------------------------
	/*** 장터 sale, free_sharing 테이블 리스트 총 개수 가져오기  ***/
	@Override
	public int getTabAllMarketplaceBoardListAllCnt() {
		return communityDAO.getTabAllMarketplaceBoardListAllCnt();
	}
	
	/*** 장터 sale, free_sharing 테이블 리스트 개수 가져오기 ***/
	@Override
	public int getTabAllMarketplaceBoardListCnt(CommunitySearchDTO communitySearchDTO) {
		return communityDAO.getTabAllMarketplaceBoardListCnt(communitySearchDTO);
	}
	
	/*** 장터 sale, free_sharing 테이블 리스트 가져오기 ***/
	@Override
	public List<CommunityDTO> getTabAllMarketplaceBoardList(CommunitySearchDTO communitySearchDTO) {
		return communityDAO.getTabAllMarketplaceBoardList(communitySearchDTO);
	}
	
	//-Sale----------------------------------------------------------------------------------------------
	/*** 장터 sale 테이블 리스트 총 개수 가져오기  ***/
	@Override
	public int getTabSaleMarketplaceBoardListAllCnt() {
		return communityDAO.getTabSaleMarketplaceBoardListAllCnt();
	}
	
	/*** 장터 sale 테이블 리스트 개수 가져오기  ***/
	@Override
	public int getTabSaleMarketplaceBoardListCnt(CommunitySearchDTO communitySearchDTO) {
		return communityDAO.getTabSaleMarketplaceBoardListCnt(communitySearchDTO);
	}
	
	/*** 장터 sale 테이블 리스트 가져오기 ***/
	@Override
	public List<CommunityDTO> getTabSaleMarketplaceBoardList(CommunitySearchDTO communitySearchDTO) {
		return communityDAO.getTabSaleMarketplaceBoardList(communitySearchDTO);
	}
	
	//FreeSharing-----------------------------------------------------------------------------------------------
	/*** 장터 Free_Sharing 테이블 리스트 총 개수 가져오기  ***/
	@Override
	public int getTabFreeSharingMarketplaceBoardListAllCnt() {
		return communityDAO.getTabFreeSharingMarketplaceBoardListAllCnt();
	}
	
	/*** 장터 Free_Sharing 테이블 리스트 개수 가져오기  ***/
	@Override
	public int getTabFreeSharingMarketplaceBoardListCnt(CommunitySearchDTO communitySearchDTO) {
		return communityDAO.getTabFreeSharingMarketplaceBoardListCnt(communitySearchDTO);
	}
	
	/*** 장터 Free_Sharing 테이블 리스트 가져오기 ***/
	@Override
	public List<CommunityDTO> getTabFreeSharingMarketplaceBoardList(CommunitySearchDTO communitySearchDTO) {
		return communityDAO.getTabFreeSharingMarketplaceBoardList(communitySearchDTO);
	}

}

package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.CommunityDAO;
import kosmo.team.project.dto.CommunityDTO;
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

	// -------------------------------------------------

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
	@Override
	public int insertCommunity(CommunityDTO communityDTO) {
		int boardRegCnt = this.communityDAO.insertCommunity(communityDTO);
		return boardRegCnt;
	}

	@Override
	public int getImageBoardListCnt(CommunityDTO communityDTO) {

		int imageBoardListCnt = communityDAO.getImageBoardListCnt(communityDTO);

		return imageBoardListCnt;

	}

	@Override
	public List<CommunityDTO> getImageBoardList(CommunityDTO communityDTO) {

		List<CommunityDTO> imageBoardList = communityDAO.getImageBoardList(communityDTO);

		return imageBoardList;

	}

}

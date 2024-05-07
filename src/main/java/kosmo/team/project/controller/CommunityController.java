package kosmo.team.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunityFreeBoardDetailDTO;
import kosmo.team.project.dto.CommunitySearchDTO;
import kosmo.team.project.service.CommunityService;
import kosmo.team.project.utility.Page;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	// ----------------------------------------------------------------
	// 공지사항
	// ----------------------------------------------------------------
	/***공지사항 페이지 ***/
	@RequestMapping(value = "/communityNoticeBoardForm.do")

	public ModelAndView communityNoticeBoard(CommunitySearchDTO communitySearchDTO) {

		int noticeBoardListAllCnt = this.communityService.getNoticeBoardAllCnt();

		int noticeBoardListCnt = this.communityService.getNoticeBoardListCnt(communitySearchDTO);

		Map<String, Integer> noticeBoardMap = Page.getPagingMap(

				communitySearchDTO.getSelectPageNo()// 선택한 페이지 번호
				, communitySearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
				, noticeBoardListCnt // 검색 결과물 개수

		);

		communitySearchDTO.setSelectPageNo((int) noticeBoardMap.get("selectPageNo"));
		communitySearchDTO.setRowCntPerPage((int) noticeBoardMap.get("rowCntPerPage"));
		communitySearchDTO.setBegin_rowNo((int) noticeBoardMap.get("begin_rowNo"));
		communitySearchDTO.setEnd_rowNo((int) noticeBoardMap.get("end_rowNo"));

		List<CommunityDTO> noticeBoardList = this.communityService.getNoticeBoardList(communitySearchDTO);

		ModelAndView mav = new ModelAndView();

		mav.addObject("noticeBoardList", noticeBoardList);

		mav.addObject("noticeBoardListCnt", noticeBoardListCnt);

		mav.addObject("noticeBoardListAllCnt", noticeBoardListAllCnt);

		mav.addObject("noticeBoardMap", noticeBoardMap);

		mav.setViewName("/community/communityNoticeBoardForm.jsp");

		return mav;
	}

	/*** 공지사항 상세보기 ***/
	@RequestMapping(value = "/noticeboardDetailForm.do")
	public ModelAndView noticeboardDetailForm(@RequestParam(value = "b_no") int b_no) {

		CommunityDTO communityDTO = this.communityService.getNoticeBoard(b_no);

		ModelAndView mav = new ModelAndView();

		mav.addObject("communityDTO", communityDTO);

		mav.setViewName("/community/noticeboardDetailForm.jsp");

		return mav;
	}

	/*** 공지사항 수정, 삭제 페이지 ***/
	@RequestMapping(value = "/noticeboardUpDelForm.do")
	public ModelAndView noticeboardUpDelForm(@RequestParam(value = "b_no") int b_no) {

		CommunityDTO communityDTO = this.communityService.getNoticeBoardForUpDel(b_no);

		ModelAndView mav = new ModelAndView();

		mav.addObject("communityDTO", communityDTO);

		mav.setViewName("/community/noticeboardUpDelForm.jsp");

		return mav;
	}
	
	/*** 공지사항 업데이트 ***/
	@ResponseBody
	@RequestMapping(value = "/noticeboardUpProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")	
	public Map<String, String> noticeboardUpProc(CommunityDTO communityDTO) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();

		// -------------------------------------------
		// [BoardServiceImpl 객체]의 updateBoard 메소드 호출로
		// 게시판 글 수정하고 [수정 적용행의 개수] 얻기
		// -------------------------------------------
		int noticeboardUpCnt = this.communityService.updateNoticeBoard(communityDTO);

		// -------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기
		// -------------------------------------------
		resultMap.put("result", noticeboardUpCnt + "");

		// -------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		// -------------------------------------------
		return resultMap;
	}
	
	/*** 공지사항 삭제 ***/
	@ResponseBody
	@RequestMapping(value = "/noticeboardDelProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")	
	public Map<String, String> noticeboardDelProc(CommunityDTO communityDTO) {
		
		Map<String, String> resultMap = new HashMap<String, String>();

		int boardDelCnt = this.communityService.deleteNoticeBoard(communityDTO);

		resultMap.put("result", boardDelCnt + "");

		return resultMap;
	}
	
	
	
	
	
	// ----------------------------------------------------------------
	// 자유게시판
	// ----------------------------------------------------------------
	/*** 자유게시판 페이지 ***/
	@RequestMapping(value = "/communityFreeBoardForm.do")
	public ModelAndView communityFreeBoard(CommunitySearchDTO communitySearchDTO) {

		int freeBoardListAllCnt = this.communityService.getFreeBoardAllCnt();

		int freeBoardListCnt = this.communityService.getFreeBoardListCnt(communitySearchDTO);

		Map<String, Integer> freeBoardMap = Page.getPagingMap(

				communitySearchDTO.getSelectPageNo()// 선택한 페이지 번호
				, communitySearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
				, freeBoardListCnt // 검색 결과물 개수

		);

		communitySearchDTO.setSelectPageNo((int) freeBoardMap.get("selectPageNo"));
		communitySearchDTO.setRowCntPerPage((int) freeBoardMap.get("rowCntPerPage"));
		communitySearchDTO.setBegin_rowNo((int) freeBoardMap.get("begin_rowNo"));
		communitySearchDTO.setEnd_rowNo((int) freeBoardMap.get("end_rowNo"));

		List<CommunityDTO> freeBoardList = this.communityService.getFreeBoardList(communitySearchDTO);

		ModelAndView mav = new ModelAndView();

		mav.addObject("freeBoardList", freeBoardList);

		mav.addObject("freeBoardListCnt", freeBoardListCnt);

		mav.addObject("freeBoardListAllCnt", freeBoardListAllCnt);

		mav.addObject("freeBoardMap", freeBoardMap);

		mav.setViewName("/community/communityFreeBoardForm.jsp");

		return mav;
	}
	
	/*** 자유게시판 조회수 올리는것 ***/
	@RequestMapping(value = "/updateFreeBoardDetailReadCountPlusOne.do")
	public ModelAndView updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO) {
		
		communityService.updateFreeBoardDetailReadCountPlusOne(detailDTO);		
	
		return communityFreeBoardDetail(detailDTO);
	}
	
	/*** 자유게시판 새글쓰기 ***/
	@RequestMapping(value = "/newCommunityFreeBoardForm.do")
	public ModelAndView newCommunityFreeBoardForm(CommunityDTO communityDTO) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/community/newCommunityFreeBoardForm.jsp");

		return mav;
	}
	
	/*** 자유게시판 상세보기 ***/
	@RequestMapping(value = "/communityFreeBoardDetail.do")
	public ModelAndView communityFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO) {
		
		CommunityFreeBoardDetailDTO freeBoardDetail = communityService.getFreeBoardDetail(detailDTO);
		
		int commentListCount = communityService.getFreeBoardDetailCommentPageListCount(detailDTO);
		
		Map<String, Integer> pageMap = Page.getPagingMap(
					detailDTO.getSelectPageNo()
				,	detailDTO.getRowCntPerPage()
				,	commentListCount
		);

		detailDTO.setSelectPageNo((int) pageMap.get("selectPageNo"));
		detailDTO.setRowCntPerPage((int) pageMap.get("rowCntPerPage"));
		detailDTO.setBegin_rowNo((int) pageMap.get("begin_rowNo"));
		detailDTO.setEnd_rowNo((int) pageMap.get("end_rowNo"));
		
		List<CommunityFreeBoardDetailDTO> freeBoardDetailCommentPageList = communityService.getFreeBoardDetailCommentPageList(detailDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("commentListCount", commentListCount);
		mav.addObject("pageMap", pageMap);
		mav.addObject("detailDTO", detailDTO);
		mav.addObject("freeBoardDetail", freeBoardDetail);
		mav.addObject("freeBoardDetailCommentList", freeBoardDetailCommentPageList);
		mav.addObject("freeBoardDetailCommentListSize", freeBoardDetailCommentPageList.size());

		mav.setViewName("/community/communityFreeBoardDetailForm.jsp");		
		
		return mav;
	}
	
	/*** 자유게시판 댓글 추가, 자유게시판 상세보기 ***/
	@RequestMapping(value = "/communityFreeBoardDetailCommentList.do")
	public ModelAndView communityFreeBoardDetailCommentList(CommunityFreeBoardDetailDTO detailDTO) {
		
		communityService.insertFreeBoardDetailComment(detailDTO);
		
		return communityFreeBoardDetail(detailDTO);
	}
	
	/*** 자유게시판 대댓글, 자유게시판 상세보기 ***/
	@RequestMapping(value = "/communityFreeBoardDetailCommentOfCommentList.do")
	public ModelAndView freeBoardDetailCommentOfCommentList(CommunityFreeBoardDetailDTO detailDTO) {
		
		communityService.insertFreeBoardDetailCommentToComment(detailDTO);

		return communityFreeBoardDetail(detailDTO);
	}
	
	/*** 자유게시판 수정 삭제 페이지 ***/
	@RequestMapping(value = "/communityFreeBoardUpDelForm.do")
	public ModelAndView communityFreeBoardUpDelForm(CommunityFreeBoardDetailDTO detailDTO) {

		CommunityDTO communityDTO = communityService.getFreeBoard(detailDTO.getB_no());

		ModelAndView mav = new ModelAndView();
		mav.addObject("communityDTO", communityDTO);
		mav.setViewName("/community/communityFreeBoardUpDelForm.jsp");

		return mav;		
	}
	
	/*** 자유게시판 상세보기, 없데이트 ***/
	@ResponseBody
	@RequestMapping(value = "/communityFreeBoardUpdateProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")	
	public Map<String, String> communityFreeBoardUpdateProc(CommunityDTO communityDTO) {

		int updateCount = communityService.updateCommunityFreeBoard(communityDTO);

		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("result", updateCount + "");

		return resultMap;		
	}
	
	/*** 자유게시판 상세보기, 삭제 ***/
	@ResponseBody
	@RequestMapping(value = "/communityFreeBoardDelProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")	
	public Map<String, String> communityFreeBoardDelProc(CommunityDTO communityDTO) {
		
		int boardDeleteCount = communityService.deleteCommunityFreeBoard(communityDTO);

		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("result", boardDeleteCount + "");

		return resultMap;		
	}
	
	/*** 자유게시판 글 등록 ***/
	@ResponseBody
	@RequestMapping(value = "/communityFreeBoardRegProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Map<String, String> communityFreeBoardRegProc(CommunityDTO communityDTO) {
		
		int result = communityService.insertCommunityFreeBoard(communityDTO);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("result", result + "");
		
		return resultMap;
	}
	
	
	
	
	
	// ----------------------------------------------------------------
	// 갤러리 리스트
	// ----------------------------------------------------------------
	/*** 갤러리 페이지 ***/
	@RequestMapping(value = "/communityGallaryForm.do")
	public ModelAndView communityGallaryForm(CommunityDTO communityDTO) {

		int imageGallaryBoardListCnt = this.communityService.getImageGallaryBoardListCnt(communityDTO);

		List<CommunityDTO> imageGallaryBoardList = this.communityService.getImageGallaryBoardList(communityDTO);

		ModelAndView mav = new ModelAndView();

		mav.addObject("imageGallaryBoardList", imageGallaryBoardList);

		mav.setViewName("/community/communityGallaryForm.jsp");

		return mav;
	}

	/*** 갤러리 등록 페이지 ***/
	@RequestMapping(value = "/newCommunityGallaryForm.do")
	public ModelAndView newCommunityGallaryForm(CommunityDTO communityDTO) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/community/newCommunityGallaryForm.jsp");

		return mav;
	}
	
	/*** 갤러리 새글쓰기 ***/
	@ResponseBody
	@RequestMapping(value = "/CommunityGallaryProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Map<String, String> CommunityGallaryProc(CommunityDTO communityDTO) {
		
		int result = communityService.insertCommunity(communityDTO);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("result", result + "");
		
		return resultMap;
	}
	
	
	
	
	// ----------------------------------------------------------------
	// 장터
	// ----------------------------------------------------------------
	/*** 장터 페이지 ***/
	@RequestMapping(value = "/communityMarketplaceBoardForm.do")
	public ModelAndView communityMarketplaceBoardForm(CommunitySearchDTO communitySearchDTO) {
		
		String tabType = communitySearchDTO.getTabType();
		
		// tabType 은 처음 접속시 null 이고 검색, 페이지 선택시 null 이 아닌 값으로 전달한다.
		if (tabType == null) {
			// 여기부터 작업해야 함.
		}

		// 판매, 무료나눔 2개 테이블 Union All 하여 총 개수 
		int saleUnionFreeSharingListAllCnt = communityService.getSaleUnionFreeSharingListAllCnt();
		
		// 판매, 무료나눔 2개 테이블 Union All 하여 검색한 개수
		int saleUnionFreeSharingListSearchCnt = communityService.getSaleUnionFreeSharingListSearchCnt(communitySearchDTO);
		
		int rowCntPerPage = communitySearchDTO.getRowCntPerPage();
		if (rowCntPerPage == 0) {
			rowCntPerPage = 8;
		}
				
		Map<String, Integer> pageMap = Page.getPagingMap(
				  communitySearchDTO.getSelectPageNo()	// 선택한 페이지 번호
				, rowCntPerPage 						// 페이지 당 보여줄 검색 행의 개수
				, saleUnionFreeSharingListSearchCnt 	// 검색 결과물 개수
		);
		
		communitySearchDTO.setSelectPageNo((int) pageMap.get("selectPageNo"));
		communitySearchDTO.setRowCntPerPage((int) pageMap.get("rowCntPerPage"));
		communitySearchDTO.setBegin_rowNo((int) pageMap.get("begin_rowNo"));
		communitySearchDTO.setEnd_rowNo((int) pageMap.get("end_rowNo"));
		
		List<CommunityDTO> saleUnionFreeSharingList = communityService.getSaleUnionFreeSharingList(communitySearchDTO);
		
		/*
		int imageMarketBoardListCnt = this.communityService.getImageBoardListCnt(communityDTO);
		List<CommunityDTO> imageMarketBoardList = this.communityService.getImageMarketBoardList(communityDTO);
		mav.addObject("imageMarketBoardList", imageMarketBoardList);
		*/
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("boardList", saleUnionFreeSharingList);
		
		mav.addObject("boardListSize", saleUnionFreeSharingList.size());

		mav.addObject("boardListCnt", saleUnionFreeSharingListSearchCnt);

		mav.addObject("boardListAllCnt", saleUnionFreeSharingListAllCnt);

		mav.addObject("pageMap", pageMap);

		mav.setViewName("/community/communityMarketplaceBoardForm.jsp");

		return mav;
	}

	/*** 장터 등록 페이지 ***/
	@RequestMapping(value = "/newCommunityMarketplaceForm.do")
	public ModelAndView newCommunityMarketplaceForm(CommunityDTO communityDTO) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/community/newCommunityMarketplaceForm.jsp");

		return mav;
	}
	
	/*** 갤러리 새글쓰기 ***/
	@ResponseBody
	@RequestMapping(value = "/MarketplaceRegProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Map<String, String> MarketplaceRegProc(CommunityDTO communityDTO) {
		
		int result = communityService.insertCommunity(communityDTO);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("result", result + "");
		
		return resultMap;
	}

}

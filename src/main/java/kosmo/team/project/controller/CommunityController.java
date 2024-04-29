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
	@RequestMapping(value = "/communityNoticeBoardForm.do"

	)

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

		mav.setViewName("communityNoticeBoardForm.jsp");

		return mav;
	}

	// 공지사항상세보기 < 여기 작업
	@RequestMapping(value = "/noticeboardDetailForm.do")
	public ModelAndView noticeboardDetailForm(
			// --------------------------------------
			// "b_no" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 b_no 에 저장하고 들어온다.
			// 즉 게시판 고유 번호가 매개변수 b_no 로 들어온다.
			// 저런식으러 선언하면 파라미터는 필수로 들어와야한다 아니면 예외가 터짐
			// 사실 숫자 문자지만 정수로 바꿔서 들어오는거다.
			// --------------------------------------
			@RequestParam(value = "b_no") int b_no

	) {

		// BoardDTO boardDTO = this.boardService.getBoard(b_no, true);
		CommunityDTO communityDTO = this.communityService.getNoticeBoard(b_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("communityDTO", communityDTO);

		mav.setViewName("noticeboardDetailForm.jsp");

		return mav;

	}

	@RequestMapping(value = "/noticeboardUpDelForm.do")

	public ModelAndView noticeboardUpDelForm(
			// --------------------------------------
			// "b_no" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 b_no 에 저장하고 들어온다.
			// 즉 게시판 고유 번호가 매개변수 b_no 로 들어온다.
			// 저런식으러 선언하면 파라미터는 필수로 들어와야한다 아니면 예외가 터짐
			// 사실 숫자 문자지만 정수로 바꿔서 들어오는거다.
			// --------------------------------------
			@RequestParam(value = "b_no") int b_no

	) {

		// BoardDTO boardDTO = this.boardService.getBoard(b_no,false);
		CommunityDTO communityDTO = this.communityService.getNoticeBoardForUpDel(b_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("communityDTO", communityDTO);

		mav.setViewName("noticeboardUpDelForm.jsp");

		return mav;

	}
	
	
	
	@RequestMapping(value = "/noticeboardUpProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> noticeboardUpProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			CommunityDTO communityDTO

	) {

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

	@RequestMapping(value = "/noticeboardDelProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> noticeboardDelProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			CommunityDTO communityDTO

	) {
		Map<String, String> resultMap = new HashMap<String, String>();

		int boardDelCnt = this.communityService.deleteNoticeBoard(communityDTO);

		resultMap.put("result", boardDelCnt + "");

		return resultMap;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ----------------------------------------------------------------

	// ----------------------------------------------------------------
	// 자유게시판
	// ----------------------------------------------------------------
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

		mav.setViewName("communityFreeBoardForm.jsp");

		return mav;
	}
	// ----------------------------------------------------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ----------------------------------------------------------------
	// 갤러리
	// ----------------------------------------------------------------
	@RequestMapping(value = "/communityGallaryForm.do")
	public ModelAndView communityGallaryForm(CommunityDTO communityDTO) {

		int imageBoardListCnt = this.communityService.getImageBoardListCnt(communityDTO);

		List<CommunityDTO> imageBoardList = this.communityService.getImageBoardList(communityDTO);

		ModelAndView mav = new ModelAndView();

		mav.addObject("imageBoardList", imageBoardList);

		mav.setViewName("communityGallaryForm.jsp");

		return mav;
	}

	// ----------------------------------------------------------------

	// ----------------------------------------------------------------
	// 갤러리
	// ----------------------------------------------------------------

	@RequestMapping(value = "/communityMarketplaceBoardForm.do")
	public ModelAndView communityMarketplaceBoardForm(CommunityDTO communityDTO) {

		int imageBoardListCnt = this.communityService.getImageBoardListCnt(communityDTO);

		List<CommunityDTO> imageBoardList = this.communityService.getImageBoardList(communityDTO);

		ModelAndView mav = new ModelAndView();

		mav.addObject("imageBoardList", imageBoardList);

		mav.setViewName("communityMarketplaceBoardForm.jsp");

		return mav;
	}

	@RequestMapping(value = "/newCommunityFreeBoardForm.do")
	public ModelAndView newCommunityFreeBoardForm(CommunityDTO communityDTO) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("newCommunityFreeBoardForm.jsp");

		return mav;
	}
	
	 @RequestMapping(value = "/newCommunityGallaryForm.do")
	    public ModelAndView newCommunityGallaryForm(CommunityDTO communityDTO) {
	    	
	    	ModelAndView mav = new ModelAndView();
	    	
	        mav.setViewName("newCommunityGallaryForm.jsp");
	        
	        return mav;
	    }
	}
	
	
	
	
	
	

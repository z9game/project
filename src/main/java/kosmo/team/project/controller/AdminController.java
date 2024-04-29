package kosmo.team.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.MemberSearchDTO;
import kosmo.team.project.dto.PlayerRecordDTO;
import kosmo.team.project.service.AdminService;
import kosmo.team.project.utility.Page;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("/adminForm.do")
	public ModelAndView adminForm(MemberSearchDTO memberSearchDTO, HttpSession session) {
		// 세션에서 사용자 아이디를 가져옴
		String userId = (String) session.getAttribute("mid");
		// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
		if (userId == null || !userId.equals("admin")) {
			return new ModelAndView("redirect:/loginForm.do");
		}
		// admin인 경우에만 회원 목록 조회 수행
		int memberListAllCnt = this.adminService.getMemberListAllCnt();

		int memberListCnt = this.adminService.getMemberListCnt(memberSearchDTO);

		Map<String, Integer> memberMap = Page.getPagingMap(

				memberSearchDTO.getSelectPageNo()// 선택한 페이지 번호
				, memberSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
				, memberListCnt // 검색 결과물 개수

		);

		memberSearchDTO.setSelectPageNo((int) memberMap.get("selectPageNo"));
		memberSearchDTO.setRowCntPerPage((int) memberMap.get("rowCntPerPage"));
		memberSearchDTO.setBegin_rowNo((int) memberMap.get("begin_rowNo"));
		memberSearchDTO.setEnd_rowNo((int) memberMap.get("end_rowNo"));

		List<MemberDTO> memberList = this.adminService.getMemberList(memberSearchDTO);

		ModelAndView mav = new ModelAndView();

		mav.addObject("memberList", memberList);
		mav.addObject("memberListCnt", memberListCnt);
		mav.addObject("memberListAllCnt", memberListAllCnt);
		mav.addObject("memberMap", memberMap);
		mav.setViewName("adminForm.jsp");

		return mav;
	}

	@RequestMapping(value = "/adminMemberDetailForm.do")
	public ModelAndView adminMemberDetailForm(
			// --------------------------------------
			// "b_no" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 b_no 에 저장하고 들어온다.
			// 즉 게시판 고유 번호가 매개변수 b_no 로 들어온다.
			// 저런식으러 선언하면 파라미터는 필수로 들어와야한다 아니면 예외가 터짐
			// 사실 숫자 문자지만 정수로 바꿔서 들어오는거다.
			// --------------------------------------
			@RequestParam(value = "m_no") int m_no

			, HttpSession session

	) {

		// 세션에서 사용자 아이디를 가져옴
		String userId = (String) session.getAttribute("mid");
		// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
		if (userId == null || !userId.equals("admin")) {
			return new ModelAndView("redirect:/loginForm.do");
		}

		// BoardDTO boardDTO = this.boardService.getBoard(b_no, true);
		MemberDTO memberDTO = this.adminService.getMember(m_no);

		PlayerRecordDTO playerRecordDTO = this.adminService.getPlayerRecord(m_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("memberDTO", memberDTO);

		mav.addObject("playerRecordDTO", playerRecordDTO);


		// System.out.println(memberDTO.getGender());
		mav.setViewName("adminMemberDetailForm.jsp");

		return mav;

	}

	@RequestMapping(value = "/adminDetailUpDelForm.do")

	public ModelAndView adminDetailUpDelForm(
			// --------------------------------------
			// "b_no" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 b_no 에 저장하고 들어온다.
			// 즉 게시판 고유 번호가 매개변수 b_no 로 들어온다.
			// 저런식으러 선언하면 파라미터는 필수로 들어와야한다 아니면 예외가 터짐
			// 사실 숫자 문자지만 정수로 바꿔서 들어오는거다.
			// --------------------------------------
			@RequestParam(value = "m_no") int m_no

			,HttpSession session

	) {
		String userId = (String) session.getAttribute("mid");
		// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
		if (userId == null || !userId.equals("admin")) {
			return new ModelAndView("redirect:/loginForm.do");
		}
		
	
		
		
		MemberDTO memberDTO = this.adminService.getMemberForUpDel(m_no);

		PlayerRecordDTO playerRecordDTO = this.adminService.getRecordUpDel(m_no);


		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("memberDTO", memberDTO);

		mav.addObject("playerRecordDTO", playerRecordDTO);


		mav.setViewName("adminDetailUpDelForm.jsp");

		return mav;

	}
	
	@RequestMapping(value = "/adminMemberUpProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8"
			)
	@ResponseBody
	public Map<String, String> adminMemberUpProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			MemberDTO memberDTO
			,PlayerRecordDTO playerRecordDTO

	) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();

		// -------------------------------------------
		// [BoardServiceImpl 객체]의 updateBoard 메소드 호출로
		// 게시판 글 수정하고 [수정 적용행의 개수] 얻기
		// -------------------------------------------
		int memberUpCnt = this.adminService.updateMember(memberDTO);
		int playerRecordUpCnt = this.adminService.updatePlayerRecord(playerRecordDTO);
		System.out.println(memberDTO.getNickname());
		// -------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기기
		// -------------------------------------------
		resultMap.put("result", memberUpCnt + "");
		resultMap.put("result2", playerRecordUpCnt + "");

		// -------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		// -------------------------------------------
		return resultMap;
	}

	@RequestMapping(value = "/adminMemberDelProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> adminMemberDelProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			MemberDTO memberDTO
			,PlayerRecordDTO playerRecordDTO

	) {
		Map<String, String> resultMap = new HashMap<String, String>();

		int memberDelCnt = this.adminService.deleteMember(memberDTO);
		int PlayerRecordDelCnt = this.adminService.deletePlayerRecord(playerRecordDTO);

		resultMap.put("result", memberDelCnt + "");
		resultMap.put("result2", PlayerRecordDelCnt + "");

		return resultMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

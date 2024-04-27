package kosmo.team.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.MemberSearchDTO;
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
}

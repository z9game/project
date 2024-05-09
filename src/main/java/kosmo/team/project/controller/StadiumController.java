package kosmo.team.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;
import kosmo.team.project.service.StadiumService;
import kosmo.team.project.utility.Page;

@Controller
public class StadiumController {

	private final String stadiumFolder = "/stadium/";

	@Autowired
	private StadiumService stadiumService;

	@RequestMapping(value = "/stadiumRentForm.do")
	public ModelAndView stadiumRentForm(StadiumSearchDTO stadiumSearchDTO) {

		int StadiumListAllCnt = this.stadiumService.getStadiumListAllCnt();

		int StadiumListCnt = this.stadiumService.getStadiumListCnt(stadiumSearchDTO);

		Map<String, Integer> StadiumMap = Page.getPagingMap(

				stadiumSearchDTO.getSelectPageNo()// 선택한 페이지 번호
				, stadiumSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
				, StadiumListCnt // 검색 결과물 개수

		);
		stadiumSearchDTO.setSelectPageNo((int) StadiumMap.get("selectPageNo"));
		stadiumSearchDTO.setRowCntPerPage((int) StadiumMap.get("rowCntPerPage"));
		stadiumSearchDTO.setBegin_rowNo((int) StadiumMap.get("begin_rowNo"));
		stadiumSearchDTO.setEnd_rowNo((int) StadiumMap.get("end_rowNo"));
		
		
		List<StadiumDTO> stadiumList = this.stadiumService.getStadiumList(stadiumSearchDTO);

		
		

		ModelAndView mav = new ModelAndView();

		mav.addObject("stadiumList", stadiumList);
		mav.addObject("StadiumListCnt", StadiumListCnt);
		mav.addObject("StadiumListAllCnt", StadiumListAllCnt);
		mav.addObject("StadiumMap", StadiumMap);

		mav.setViewName(stadiumFolder + "stadiumRentForm.jsp");

		return mav;
	}

	
	@RequestMapping(value = "/stadiumDetailForm.do")
	public ModelAndView stadiumDetailForm(
			// --------------------------------------
			// "b_no" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 b_no 에 저장하고 들어온다.
			// 즉 게시판 고유 번호가 매개변수 b_no 로 들어온다.
			// 저런식으러 선언하면 파라미터는 필수로 들어와야한다 아니면 예외가 터짐
			// 사실 숫자 문자지만 정수로 바꿔서 들어오는거다.
			// --------------------------------------
			@RequestParam(value = "stadium_no") int stadium_no

	) {

		// BoardDTO boardDTO = this.boardService.getBoard(b_no, true);
		StadiumDTO stadiumDTO = this.stadiumService.getStadium(stadium_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("stadiumDTO", stadiumDTO);

		mav.setViewName(stadiumFolder + "stadiumDetailForm.jsp");

		return mav;

	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/stadiumTransferForm.do")
	public ModelAndView StadiumTransferForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(stadiumFolder + "stadiumTransferForm.jsp");

		return mav;
	}

	@RequestMapping(value = "/newStadiumTransferForm.do")
	public ModelAndView NewStadiumTransferForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(stadiumFolder + "newStadiumTransferForm.jsp");

		return mav;
	}
}
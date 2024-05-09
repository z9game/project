package kosmo.team.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
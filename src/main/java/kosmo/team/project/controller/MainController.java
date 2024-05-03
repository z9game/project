package kosmo.team.project.controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.CustomerServiceDetailDTO;
import kosmo.team.project.dto.MainDTO;
import kosmo.team.project.dto.MainSearchDTO;
import kosmo.team.project.service.MainService;
import kosmo.team.project.utility.Page;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;

	@RequestMapping(value = "/main/mainForm.do")
	public ModelAndView mainForm(MainDTO mainDTO, MainSearchDTO mainSearchDTO) {

	    ModelAndView mav = new ModelAndView();

	    // 갤러리 section
	    int imageBoardListCnt = this.mainService.getImageBoardListCnt(mainDTO);
	    List<MainDTO> imageBoardList = this.mainService.getImageBoardList(mainDTO);
	    mav.addObject("imageBoardList", imageBoardList);

	    // 대회 일정 section
	    List<MainDTO> mainTournamentList = this.mainService.getMainTournamentList(mainDTO);
	    mav.addObject("mainTournamentList", mainTournamentList);

	    mav.setViewName("/main/mainForm.jsp");

	    return mav;
	}


	@RequestMapping(value = "/main/loginForm.do")
	public ModelAndView loginForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/loginForm.jsp");

		return mav;
	}

	@RequestMapping(value = "/main/customerServiceForm.do")
	public ModelAndView customerServiceForm(MainDTO mainDTO, MainSearchDTO mainSearchDTO) {

		int customerServiceQnABoardListAllCnt = this.mainService.getCustomerServiceQnABoardListAllCnt();
		
		int customerServiceQnABoardListCnt = this.mainService.getCustomerServiceQnABoardListCnt(mainSearchDTO);
		
		ModelAndView mav = new ModelAndView();
		
		// FAQ 페이지
		
		List<MainDTO> customerServiceList = this.mainService.getCustomerServiceList(mainDTO);
		
		mav.addObject("customerServiceList", customerServiceList);
		
		List<MainDTO> customerServiceCategoryList = this.mainService.getCustomerServiceCategoryList(mainDTO);
		
		mav.addObject("customerServiceCategoryList", customerServiceCategoryList);
		
		// QnA 페이지
		Map<String, Integer> customerServiceQnABoardMap = Page.getPagingMap(
				mainSearchDTO.getSelectPageNo(),
				mainSearchDTO.getRowCntPerPage(),
				customerServiceQnABoardListCnt
		);
		
		mainSearchDTO.setSelectPageNo((int) customerServiceQnABoardMap.get("selectPageNo"));
		mainSearchDTO.setRowCntPerPage((int) customerServiceQnABoardMap.get("rowCntPerPage"));
		mainSearchDTO.setBegin_rowNo((int) customerServiceQnABoardMap.get("begin_rowNo"));
		mainSearchDTO.setEnd_rowNo((int) customerServiceQnABoardMap.get("end_rowNo"));
		
		List<MainDTO> customerServiceQnABoardList = this.mainService.getCustomerServiceQnABoardList(mainSearchDTO);
		
		mav.addObject("customerServiceQnABoardList", customerServiceQnABoardList);
		
		mav.addObject("customerServiceQnABoardListCnt", customerServiceQnABoardListCnt);
		
		mav.addObject("customerServiceQnABoardListAllCnt", customerServiceQnABoardListAllCnt);
		
		mav.addObject("customerServiceQnABoardMap", customerServiceQnABoardMap);
		
		mav.setViewName("/main/customerServiceForm.jsp");

		return mav;
	}

	// QnA 글쓰기 페이지
	
	@RequestMapping(value = "/main/newCustomerServiceQnAForm.do")
    public ModelAndView newCustomerServiceQnAForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("/main/newCustomerServiceQnAForm.jsp");
    	
        return mav;
    }
	
	// QnA 조회수 증가
	
	@RequestMapping(value = "/updateCustomerServiceDetailFormReadCountPlusOne.do")
    public ModelAndView updateCustomerServiceDetailFormReadCountPlusOne(CustomerServiceDetailDTO customerServiceDetailDTO) {
    	
		mainService.updateCustomerServiceDetailFormReadCountPlusOne(customerServiceDetailDTO);
		
        return customerServiceDetail(customerServiceDetailDTO);
    }
	
	// QnA Detail 페이지
	
	@RequestMapping(value = "/main/customerServiceQnADetailForm.do")
    public ModelAndView customerServiceDetail(CustomerServiceDetailDTO customerServiceDetailDTO) {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	CustomerServiceDetailDTO customerServiceQnADetail = mainService.getCustomerServiceQnADetail(customerServiceDetailDTO);
    	
    	mav.addObject("customerServiceQnADetail", customerServiceQnADetail);
    	
    	mav.setViewName("/main/customerServiceQnADetailForm.jsp");
    	
        return mav;
    }
}
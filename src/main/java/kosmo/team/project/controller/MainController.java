package kosmo.team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.MainDTO;
import kosmo.team.project.service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;

	@RequestMapping(value = "/mainForm.do")
	public ModelAndView mainForm(MainDTO mainDTO) {

		ModelAndView mav = new ModelAndView();

		// 갤러리 section
		int imageBoardListCnt = this.mainService.getImageBoardListCnt(mainDTO);

		List<MainDTO> imageBoardList = this.mainService.getImageBoardList(mainDTO);

		mav.addObject("imageBoardList", imageBoardList);

		mav.setViewName("mainForm.jsp");

		return mav;
	}

	@RequestMapping(value = "/loginForm.do")
	public ModelAndView loginForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginForm.jsp");

		return mav;
	}

	@RequestMapping(value = "/customerServiceForm.do")
	public ModelAndView customerServiceForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("customerServiceForm.jsp");

		return mav;
	}
}
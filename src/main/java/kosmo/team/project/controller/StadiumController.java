package kosmo.team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.service.StadiumService;


@Controller
public class StadiumController {
	
	@Autowired
    private StadiumService stadiumService;
	
    @RequestMapping(value = "/stadiumRentForm.do")
    public ModelAndView stadiumRentForm(StadiumDTO stadiumDTO) {
    	
        int imageBoardListCnt = this.stadiumService.getImageBoardListCnt(stadiumDTO);
        
        List<StadiumDTO> imageBoardList = this.stadiumService.getImageBoardList(stadiumDTO);
        
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("imageBoardList", imageBoardList);
        
        mav.setViewName("stadiumRentForm.jsp");
        
        return mav;
    }
    
    @RequestMapping(value = "/stadiumTransferForm.do")
    public ModelAndView StadiumTransferForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("stadiumTransferForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/newStadiumTransferForm.do")
    public ModelAndView NewStadiumTransferForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("newStadiumTransferForm.jsp");
    	
        return mav;
    }
}
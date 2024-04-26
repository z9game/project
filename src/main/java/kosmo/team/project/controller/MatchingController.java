package kosmo.team.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class MatchingController {
	
    @RequestMapping(value = "/matchingForm.do")
    public ModelAndView matchingForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("matchingForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/newMatchingBoardForm.do")
    public ModelAndView newMatchingBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("newMatchingBoardForm.jsp");
    	
        return mav;
    }
}
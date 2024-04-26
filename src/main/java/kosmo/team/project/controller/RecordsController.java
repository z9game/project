package kosmo.team.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecordsController {
	
    @RequestMapping(value = "/recordsRankingForm.do")
    public ModelAndView recordsRankingForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("recordsRankingForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recordsStatisticsForm.do")
    public ModelAndView recordsStatisticsForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("recordsStatisticsForm.jsp");
    	
        return mav;
    }
}
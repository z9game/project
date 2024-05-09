package kosmo.team.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecordsController {
	
    @RequestMapping(value = "/records/recordsRankingForm.do")
    public ModelAndView recordsRankingForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/records/recordsRankingForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/records/recordsStatisticsForm.do")
    public ModelAndView recordsStatisticsForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/records/recordsStatisticsForm.jsp");
    	
        return mav;
    }
}
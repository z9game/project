package kosmo.team.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
    @RequestMapping(value = "/mainForm.do")
    public ModelAndView mainForm() {
    	
    	ModelAndView mav = new ModelAndView();
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
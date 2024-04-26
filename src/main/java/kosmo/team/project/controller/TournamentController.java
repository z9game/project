package kosmo.team.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class TournamentController {
	
    @RequestMapping(value = "/tournamentBoardForm.do")
    public ModelAndView tournamentBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("tournamentBoardForm.jsp");
    	
        return mav;
    }
}
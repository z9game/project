package kosmo.team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;
import kosmo.team.project.service.TournamentService;

@Controller
public class TournamentController {
    
    @Autowired
    private TournamentService tournamentService;

    
    @RequestMapping(value = "/tournamentBoardForm.do")
    public ModelAndView tournamentBoardForm(TournamentSearchDTO tournamentSearchDTO) {
    	
    	List<TournamentDTO> tournamentList = this.tournamentService.getTournamentList(tournamentSearchDTO);
        ModelAndView mav = new ModelAndView();
        mav.addObject("tournamentList", tournamentList);
        System.out.println(tournamentList);
        mav.setViewName("tournamentBoardForm.jsp");
        
        return mav;
    }
    

    
    
}
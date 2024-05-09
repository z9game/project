package kosmo.team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.RecruitTeamMemDTO;
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
        mav.setViewName("/tournament/tournamentBoardForm.jsp");
        
        
        return mav;
    }
    
    
    
    @RequestMapping(value = "/tournamentBoardDetail.do")
    public ModelAndView recruitTeamBoardDetailForm(@RequestParam(value="list_no") int list_no) {
 
    	TournamentDTO tournamentDTO = this.tournamentService.recruitTeamBoardDetailForm(list_no);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list", tournamentDTO);

    	mav.setViewName("/tournament/tournamentBoardDetail.jsp");
    	
        return mav;
    }
    
    
    
}
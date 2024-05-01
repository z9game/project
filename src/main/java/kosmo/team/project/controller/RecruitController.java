package kosmo.team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitMemDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamDTO;
import kosmo.team.project.service.RecruitService;

@Controller
public class RecruitController {
	
	@Autowired
    private RecruitService recruitService;
	
	
    @RequestMapping(value = "/recruitTeamBoardForm.do")
    public ModelAndView recruitTeamBoardForm(RecruitSearchDTO recruitSearchDTO) {
    	
    	
    	List<RecruitTeamDTO> recruitTeam = this.recruitService.getRecruit_TeamBoardList(recruitSearchDTO);
    	List<RecruitMemDTO> recruitMem = this.recruitService.getRecruit_MemBoardList(recruitSearchDTO);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("teamList", recruitTeam);
    	mav.addObject("memList", recruitMem);
    	mav.setViewName("recruitTeamBoardForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recruitHiredBoardForm.do")
    public ModelAndView recruitHiredBoardForm() {
    	
    	List<RecruitHiredDTO> recruitHired = this.recruitService.getRecruit_HiredBoardList();
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("boardList", recruitHired);
    	mav.setViewName("recruitHiredBoardForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recruitLessonBoardForm.do")
    public ModelAndView recruitLessonBoardForm() {
    	
    	List<RecruitLessonDTO> recruitLesson = this.recruitService.getRecruit_LessonBoardList();
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("boardList", recruitLesson);
    	mav.setViewName("recruitLessonBoardForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/newRecruitTeamBoardForm.do")
    public ModelAndView newRecruitTeamBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("newRecruitTeamBoardForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/newRecruitHiredBoardForm.do")
    public ModelAndView newRecruitHiredBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("newRecruitHiredBoardForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/newRecruitLessonBoardForm.do")
    public ModelAndView newRecruitLessonBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("newRecruitLessonBoardForm.jsp");
    	
        return mav;
    }
}
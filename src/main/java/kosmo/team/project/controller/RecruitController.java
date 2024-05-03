package kosmo.team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    
    @RequestMapping(value = "/recruitTeamBoardDetailForm.do")
    public ModelAndView recruitTeamBoardDetailForm(@RequestParam(value="recruitment_no") int recruitment_no) {
    	
    	RecruitTeamDTO recruitTeamDTO = this.recruitService.getRecruit_TeamDetail(recruitment_no);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("teamdetailList", recruitTeamDTO);
    	mav.setViewName("recruitTeamBoardDetailForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recruitHiredBoardDetailForm.do")
    public ModelAndView recruitHiredBoardDetailForm(@RequestParam(value="recruitment_no") int recruitment_no) {
    	
    	RecruitHiredDTO recruitHiredDTO = this.recruitService.getRecruit_HiredDetail(recruitment_no);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("hireddetailList", recruitHiredDTO);
    	mav.setViewName("recruitHiredBoardDetailForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recruitLessonBoardDetailForm.do")
    public ModelAndView recruitLessonBoardDetailForm(@RequestParam(value="recruitment_no") int recruitment_no) {
    	
    	RecruitLessonDTO recruitLessonDTO = this.recruitService.getRecruit_LessonDetail(recruitment_no);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("lessondetailList", recruitLessonDTO);
    	mav.setViewName("recruitLessonBoardDetailForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recruitMemBoardDetailForm.do")
    public ModelAndView recruitMemBoardDetailForm(@RequestParam(value="recruitment_no") int recruitment_no) {
    	
    	RecruitMemDTO recruitMemDTO = this.recruitService.getRecruit_MemDetail(recruitment_no);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("memdetailList", recruitMemDTO);
    	mav.setViewName("recruitMemBoardDetailForm.jsp");
    	
        return mav;
    }
}
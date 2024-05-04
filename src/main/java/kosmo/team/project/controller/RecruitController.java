package kosmo.team.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;
import kosmo.team.project.service.RecruitService;

@Controller
public class RecruitController {
	
	@Autowired
    private RecruitService recruitService;
	
    @RequestMapping(value = "/recruitTeamMemBoardForm.do")
    public ModelAndView recruitTeamBoardForm(RecruitSearchDTO recruitSearchDTO) {
    	List<RecruitTeamMemDTO> recruitTeamMem = this.recruitService.getTeam_MemList(recruitSearchDTO);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("boardList", recruitTeamMem);
    	mav.setViewName("/recruit/test.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recruitHiredBoardForm.do")
    public ModelAndView recruitHiredBoardForm() {
    	
    	List<RecruitHiredDTO> recruitHired = this.recruitService.getRecruit_HiredBoardList();
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("boardList", recruitHired);
    	mav.setViewName("/recruit/recruitHiredBoardForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recruitLessonBoardForm.do")
    public ModelAndView recruitLessonBoardForm() {
    	
    	List<RecruitLessonDTO> recruitLesson = this.recruitService.getRecruit_LessonBoardList();
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("boardList", recruitLesson);
    	mav.setViewName("/recruit/recruitLessonBoardForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/newRecruitTeamBoardForm.do")
    public ModelAndView newRecruitTeamBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/recruit/newRecruitTeamBoardForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/newRecruitHiredBoardForm.do")
    public ModelAndView newRecruitHiredBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/recruit/newRecruitHiredBoardForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/newRecruitLessonBoardForm.do")
    public ModelAndView newRecruitLessonBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/recruit/newRecruitLessonBoardForm.jsp");
    	
        return mav;
    }
    
    
    @RequestMapping(value = "/recruitHiredBoardDetailForm.do")
    public ModelAndView recruitHiredBoardDetailForm(@RequestParam(value="recruitment_no") int recruitment_no) {
    	
    	RecruitHiredDTO recruitHiredDTO = this.recruitService.getRecruit_HiredDetail(recruitment_no);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("hireddetailList", recruitHiredDTO);
    	mav.setViewName("/recruit/recruitHiredBoardDetailForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recruitLessonBoardDetailForm.do")
    public ModelAndView recruitLessonBoardDetailForm(@RequestParam(value="recruitment_no") int recruitment_no) {
    	
    	RecruitLessonDTO recruitLessonDTO = this.recruitService.getRecruit_LessonDetail(recruitment_no);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("lessondetailList", recruitLessonDTO);
    	mav.setViewName("/recruit/recruitLessonBoardDetailForm.jsp");
    	
        return mav;
    }

 
}
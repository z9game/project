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
import kosmo.team.project.utility.Page;

@Controller
public class RecruitController {
	
	@Autowired
    private RecruitService recruitService;
	
    @RequestMapping(value = "/recruitTeamMemBoardForm.do")
    public ModelAndView recruitTeamMemBoardForm(RecruitSearchDTO recruitSearchDTO) {
    	
    	int boardListCnt = this.recruitService.getBoardListCnt(recruitSearchDTO);
    	
    	Map<String, Integer> recruitMap = Page.getPagingMap(
    		recruitSearchDTO.getSelectPageNo()// 선택한 페이지 번호
			, recruitSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
			, boardListCnt // 검색 결과물 개수
		);
    	
    	recruitSearchDTO.setSelectPageNo((int) recruitMap.get("selectPageNo"));
    	recruitSearchDTO.setRowCntPerPage((int) recruitMap.get("rowCntPerPage"));
    	recruitSearchDTO.setBegin_rowNo((int) recruitMap.get("begin_rowNo"));
    	recruitSearchDTO.setEnd_rowNo((int) recruitMap.get("end_rowNo"));
    	
    	List<RecruitTeamMemDTO> recruitTeamMem = this.recruitService.getRecruit_TeamMemList(recruitSearchDTO);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("boardList", recruitTeamMem);
    	mav.addObject("recruitMap", recruitMap);
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
    
    
    
    
    
    
    
    
    
    
    @RequestMapping(value = "/newRecruitTeamMemBoardForm.do")
    public ModelAndView newRecruitTeamMemBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/recruit/newRecruitTeamMemBoardForm.jsp");
    	
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
    
    
    @RequestMapping(value = "/recruitTeamMemBoardDetailForm.do")
    public ModelAndView recruitTeamBoardDetailForm(@RequestParam(value="b_no") int b_no) {
 
    	RecruitTeamMemDTO recruitTeamMemDTO = this.recruitService.getRecruit_TeamMemDetail(b_no);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list", recruitTeamMemDTO);
    	mav.setViewName("/recruit/recruitTeamMemBoardDetailForm.jsp");
    	
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
    
	@RequestMapping( value = "/recruitTeamMemRegProc.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
					)
	@ResponseBody
	public Map<String, String> recruitTeamMemRegProc(RecruitTeamMemDTO recruitTeamMemDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int recruitTeamMemRegCnt = this.recruitService.regTeamMemRecruit(recruitTeamMemDTO);
	resultMap.put("result", recruitTeamMemRegCnt+"");
	
	
	return resultMap;
	}

    
}
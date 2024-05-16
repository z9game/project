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
    	
    	List<String> day = this.recruitService.getRecruit_day(b_no);
    	List<String> time = this.recruitService.getRecruit_time(b_no);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list", recruitTeamMemDTO);
    	mav.addObject("day", day);
    	mav.addObject("time", time);
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	
    
    @RequestMapping(value = "/recruitTeamMemBoardUpDelForm.do")
    public ModelAndView recruitTeamMemBoardUpDelForm(@RequestParam(value="b_no") int b_no) {
    	// getRecruit_TeamMemUpDel 는 수정/삭제를 위해 데이터를 가져오는 메소드명
    	RecruitTeamMemDTO recruitTeamMemDTO = this.recruitService.getRecruit_TeamMemUpDel(b_no);
    	List<String> recruitTeamMemDTO_day = this.recruitService.getRecruit_TeamMemUpDel_day(b_no);
    	List<String> recruitTeamMemDTO_time = this.recruitService.getRecruit_TeamMemUpDel_time(b_no);
    	RecruitTeamMemDTO recruitTeamMemDTO_sidosigungu = this.recruitService.getRecruit_TeamMemUpDel_sidosigungu(b_no);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("detail", recruitTeamMemDTO);
    	mav.addObject("updel_day", recruitTeamMemDTO_day);
    	mav.addObject("updel_time", recruitTeamMemDTO_time);
    	mav.addObject("updel_sidosigungu", recruitTeamMemDTO_sidosigungu);
    	mav.addObject("updel_time", recruitTeamMemDTO_time);
    	mav.setViewName("/recruit/recruitTeamMemBoardUpDelForm.jsp");
    	
        return mav;
    }  
    
    
    //팀/팀원 게시물 수정
    @RequestMapping( value = "/recruitTeamMemBoardUpProc.do"
			,method = RequestMethod.POST
			, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	// map을 사용한 이유? -> JSON 형식을 사용하기 위해
	public Map<String, String> recruitTeamMemBoardUpProc(RecruitTeamMemDTO recruitTeamMemDTO)
	{
    //resultMap 이라는 변수 선언(자료형은 map) 
	Map<String, String> resultMap = new HashMap<String, String>();
	//recruitTeamMemUpCnt 이라는 변수 선언 (자료형은 int)
	//업데이트가 성공했는지 안했는지의 결과가 변수에 저장될것임 -> 성공했으면 '1'이 들어오고 실패하면 '0'이 들어올것임.
	int recruitTeamMemUpCnt = this.recruitService.recruitUpdateTeamMem(recruitTeamMemDTO);
	//recruitTeamMemUpCnt에 저장된 결과를 map 형식으로 만들어준 변수 resultMap에 저장
	//어떻게? -> map 사용법은 키값명을 호출하면 그 키값명에 저장한 데이터가 나옴
	//여기서는 "result"라는 키값명에 recruitTeamMemUpCnt를 저장.
	//즉, "result"를 호출하면 recruitTeamMemUpCnt가 나오는 것임.
	resultMap.put("result", recruitTeamMemUpCnt+"");
	
	
	return resultMap;
	}
    
    
    //팀/팀원 게시물 삭제
    @RequestMapping( value = "/recruitTeamMemBoardDelProc.do"
			,method = RequestMethod.POST
			, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	public Map<String, String> recruitTeamMemBoardDelProc(RecruitTeamMemDTO recruitTeamMemDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int recruitTeamMemDelCnt = this.recruitService.recruitDeleteTeamMem(recruitTeamMemDTO);
	resultMap.put("result", recruitTeamMemDelCnt+"");
	
	
	return resultMap;
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
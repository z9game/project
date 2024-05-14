package kosmo.team.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.RecordsDTO;
import kosmo.team.project.service.RecordsService;
import kosmo.team.project.utility.Page;

@Controller
public class RecordsController {
	@Autowired
	private RecordsService recordsService;
	
    @RequestMapping(value = "/recordsRankingForm.do")
    public ModelAndView recordsRankingForm(RecordsDTO recordsDTO) {
    	
    	ModelAndView mav = new ModelAndView();

    	// 전체 순위
    	
    	List<RecordsDTO> recordsRankingTabAll = this.recordsService.getRecordsRankingTabAll(recordsDTO);
		
		mav.addObject("recordsRankingTabAll", recordsRankingTabAll);
		
		int recordsRankingTabAllListCnt = this.recordsService.getRecordsRankingTabAllListCnt(recordsDTO);
		
		mav.addObject("recordsRankingTabAllListCnt", recordsRankingTabAllListCnt);
		
		List<RecordsDTO> recordsGoalRatingTabAll = this.recordsService.getRecordsGoalRatingTabAll(recordsDTO);
		
		mav.addObject("recordsGoalRatingTabAll", recordsGoalRatingTabAll);

		List<RecordsDTO> recordsWinRatingTabAll = this.recordsService.getRecordsWinRatingTabAll(recordsDTO);
		
		mav.addObject("recordsWinRatingTabAll", recordsWinRatingTabAll);
		
		List<RecordsDTO> recordsAssistRatingTabAll = this.recordsService.getRecordsAssistRatingTabAll(recordsDTO);
		
		mav.addObject("recordsAssistRatingTabAll", recordsAssistRatingTabAll);
		
		// 지역별 순위
		
		List<RecordsDTO> recordsRankingTabRegion = this.recordsService.getRecordsRankingTabRegion(recordsDTO);
		
		mav.addObject("recordsRankingTabRegion", recordsRankingTabRegion);
		
		int recordsRankingTabRegionListCnt = this.recordsService.getRecordsRankingTabRegionListCnt(recordsDTO);
		
		mav.addObject("recordsRankingTabRegionListCnt", recordsRankingTabRegionListCnt);
		
		List<RecordsDTO> recordsGoalRatingTabRegion = this.recordsService.getRecordsGoalRatingTabRegion(recordsDTO);
		
		mav.addObject("recordsGoalRatingTabRegion", recordsGoalRatingTabRegion);

		List<RecordsDTO> recordsWinRatingTabRegion = this.recordsService.getRecordsWinRatingTabRegion(recordsDTO);
		
		mav.addObject("recordsWinRatingTabRegion", recordsWinRatingTabRegion);
		
		List<RecordsDTO> recordsAssistRatingTabRegion = this.recordsService.getRecordsAssistRatingTabRegion(recordsDTO);
		
		mav.addObject("recordsAssistRatingTabRegion", recordsAssistRatingTabRegion);
		
		// 성별 순위
		
    	mav.setViewName("/records/recordsRankingForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recordsStatisticsForm.do")
    public ModelAndView recordsStatisticsForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("/records/recordsStatisticsForm.jsp");
    	
        return mav;
    }
}
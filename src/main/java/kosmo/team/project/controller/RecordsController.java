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
	
    @RequestMapping(value = "/records/recordsRankingForm.do")
    public ModelAndView recordsRankingForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/records/recordsRankingForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/records/recordsStatisticsForm.do")
    public ModelAndView recordsStatisticsForm(RecordsDTO recordsDTO) {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	List<RecordsDTO> recordsStatistics = this.recordsService.getRecordsStatistics(recordsDTO);
		
		mav.addObject("recordsStatistics", recordsStatistics);
		
		int recordsStatisticsListCnt = this.recordsService.getRecordsStatisticsListCnt(recordsDTO);
		
		mav.addObject("recordsStatisticsListCnt", recordsStatisticsListCnt);
		
    	mav.setViewName("/records/recordsStatisticsForm.jsp");
    	
        return mav;
    }
}
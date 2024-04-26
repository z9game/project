package kosmo.team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.service.CommunityService;

@Controller
public class CommunityController {
    
    @Autowired
    private CommunityService communityService;
    
    @RequestMapping(value = "/communityNoticeBoardForm.do")
    public ModelAndView communityNoticeBoard(CommunityDTO communityDTO) {
    
        int noticeBoardListCnt = this.communityService.getNoticeBoardListCnt(communityDTO);
        
        List<CommunityDTO> noticeBoardList = this.communityService.getNoticeBoardList(communityDTO);
        
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("noticeBoardList", noticeBoardList);
        
        mav.setViewName("communityNoticeBoardForm.jsp");
        
        return mav;
    }
    
    @RequestMapping(value = "/communityFreeBoardForm.do")
    public ModelAndView communityFreeBoard(CommunityDTO communityDTO) {
    
        int freeBoardListCnt = this.communityService.getFreeBoardListCnt(communityDTO);
        
        List<CommunityDTO> freeBoardList = this.communityService.getFreeBoardList(communityDTO);
        
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("freeBoardList", freeBoardList);
        
        mav.setViewName("communityFreeBoardForm.jsp");
        
        return mav;
    }
    
    @RequestMapping(value = "/communityGallaryForm.do")
    public ModelAndView communityGallaryForm(CommunityDTO communityDTO) {
    	
    	int imageBoardListCnt = this.communityService.getImageBoardListCnt(communityDTO);
        
        List<CommunityDTO> imageBoardList = this.communityService.getImageBoardList(communityDTO);
        
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("imageBoardList", imageBoardList);
        
        mav.setViewName("communityGallaryForm.jsp");
        
        return mav;
    }
    
    @RequestMapping(value = "/communityMarketplaceBoardForm.do")
    public ModelAndView communityMarketplaceBoardForm(CommunityDTO communityDTO) {
    	
    	int imageBoardListCnt = this.communityService.getImageBoardListCnt(communityDTO);
        
        List<CommunityDTO> imageBoardList = this.communityService.getImageBoardList(communityDTO);
    	
    	ModelAndView mav = new ModelAndView();
        
    	mav.addObject("imageBoardList", imageBoardList);
    	
        mav.setViewName("communityMarketplaceBoardForm.jsp");
        
        return mav;
    }
    
    @RequestMapping(value = "/newCommunityFreeBoardForm.do")
    public ModelAndView newCommunityFreeBoardForm(CommunityDTO communityDTO) {
    	
    	ModelAndView mav = new ModelAndView();
    	
        mav.setViewName("newCommunityFreeBoardForm.jsp");
        
        return mav;
    }
}

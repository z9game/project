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

import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.bookingDTO;
import kosmo.team.project.service.MemberService;

@Controller
public class MemberController {
	

    @Autowired
    private MemberService memberService;
	
		@RequestMapping(value = "/memberRegForm.do")
	    public ModelAndView memberRegForm() {
	    	
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("memberRegForm.jsp");
	    	
	        return mav;
	    }
		
		@RequestMapping( value="/memberRegProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		
		public Map<String,String> memberRegProc(MemberDTO memberDTO)
		{
		    
			Map<String,String> resultMap = new HashMap<String,String>();
			
			int memberCnt = this.memberService.insertMember(memberDTO);
		
			resultMap.put("result", memberCnt+"");
		
			return resultMap;
		}
		
		
		@RequestMapping( value="/midFindProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int midFindProc(@RequestParam(value="mid")String mid)
		{
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("mid", mid);
		
		int memberCnt = this.memberService.getmid(map);
	
		return memberCnt;
		}
		
		
		@RequestMapping(value = "/memUpdateForm.do")
		  public ModelAndView memUpdateForm(@RequestParam(value="mid")String mid ) {

			 MemberDTO memberDTO = this.memberService.updateMem(mid);
		     ModelAndView mav = new ModelAndView();

		     mav.setViewName("/myPage/memUpdateForm.jsp");
		     mav.addObject("memberDTO", memberDTO);

		     return mav;
		  }
		
		//마이페이지 관련 컨트롤러
		@RequestMapping(value = "/myPageForm.do")
		  public ModelAndView myPageForm(@RequestParam(value="mid")String mid, @RequestParam(value="m_no")int m_no) {
			
			//마이페이지에 있는 내 정보 가져오기, 오라클 실행결과물을 myInfo라는 변수에 저장
			 MemberDTO myInfo = this.memberService.getMyInfo(mid);
			//마이페이지에 있는 내 기록 가져오기, 오라클 실행결과물을 myStat라는 변수에 저장
			 MemberDTO myStat = this.memberService.getMyStat(mid);
			 
			 List<bookingDTO> bookedStadium = this.memberService.getBookedStadium(m_no);
			 
		     ModelAndView mav = new ModelAndView();

		     mav.setViewName("/myPage/myPageForm.jsp");
		     //myInfo에 저장한 결과물을 페이지에서 requestScope를 사용해 얻어낼수 있게 설정
		     mav.addObject("myInfo", myInfo);
		     //myStat에 저장한 결과물을 페이지에서 requestScope를 사용해 얻어낼수 있게 설정
		     mav.addObject("myStat", myStat);
		     //bookedStadium에 저장한 결과물을 페이지에서 requestScope를 사용해 얻어낼수 있게 설정
		     mav.addObject("bookedStadium", bookedStadium);
		     

		     return mav;
		  }
		
		@RequestMapping( value="/memUpdateProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		
		public Map<String,String> memUpdateProc(MemberDTO memberDTO)
		{
		    
			Map<String,String> resultMap = new HashMap<String,String>();
			
			int memberCnt = this.memberService.updateMem(memberDTO);
		
			resultMap.put("result", memberCnt+"");
		
			return resultMap;
		}
		
		
		
		
	
		
}
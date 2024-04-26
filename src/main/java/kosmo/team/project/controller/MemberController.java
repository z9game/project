package kosmo.team.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.MemberDTO;
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
}
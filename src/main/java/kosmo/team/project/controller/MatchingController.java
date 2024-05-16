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

import kosmo.team.project.dto.MatchingDTO;
import kosmo.team.project.dto.MatchingSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;
import kosmo.team.project.service.AdminService;
import kosmo.team.project.service.MatchingService;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService matchingservice;

	//===============================================================================================================================================================================
	
	
	//매칭 게시물 가져오기
	//@RequestMapping(value = "/matchingForm.do")??
	//내가 URL 주소창에 이 주소를 검색해서 들어오면 밑에 메소드가 실행이 된다.
    @RequestMapping(value = "/matchingForm.do")
    								//바로 밑의 매개변수는 JSP페이지에서 넘어오는 값을 저장하기위해 이렇게 선언. 무엇이 넘어오나? -> **검색조건**
    								//넘어오는 값들이 전부 DTO에 담을수 있는 값이기 때문
    public ModelAndView matchingForm(MatchingSearchDTO matchingSearchDTO) {
    	
    	//매칭찾기 페이지에서 게시물들 오라클에서 가져오기
    	//List<MatchingDTO>?? => (n행 m열)을 가져오기 위해 사용, (1행 m열)일 경우에는 Map 또는 DTO를 사용 , (n행 1열)일 경우에는 List 사용
    																//Map보다 DTO를 사용하는 이유는 자료형을 살릴수 있기때문에 DTO를 주로 사용
    	//matchingservice라는 인터페이스 안에 있는 getMatchingList 라는 메소드 호출. 그리고 그 결과값을 matchingList 라는 변수에 저장
    	List<MatchingDTO> matchingList = this.matchingservice.getMatchingList(matchingSearchDTO);
    	ModelAndView mav = new ModelAndView();
    	
    	//URL 주소로 들어오면 보여줄 JSP 페이지의 위치.
    	mav.setViewName("/matching/matchingForm.jsp");
    	
    	//오라클의 실행구문 결과물이 저장된 변수 matchingList를 JSP쪽에서 ${requestScope.boardList.DTO안에있는멤버변수명} 이런식으로 불러 사용하기 위해 addObject라는 것을 사용
    	//즉, JSP페이지에서 boardList라는 키값을 부르면 그 키값에 해당하는 데이터(matchingList)를 사용할수 있는 것임.
    	mav.addObject("boardList", matchingList);
    	
        return mav;
    }
    
    //===============================================================================================================================================================================
    
    //매칭상세보기 관련 메소드
    @RequestMapping(value = "/matchingDetailForm.do")
    									//matchingForm에서 matchingDetailForm으로 올때 form태그 안에 name='match_no' 인 태그의 값이 들어온다. 
    									//그리고 그값을 match_no라는 변수를 선언하고 그 안에 넣었음.
    public ModelAndView matchingDetailForm(@RequestParam(value="match_no")int match_no) {
    	
    	//matchingDetail 이라는 변수를 선언하고 그 안에 getMatchingDetail 메소드의 실행결과를 저장한다.
    	//MatchingDTO 자료형? -> 받을 결과물의 틀을 미리 만들어둔거나 마찬가지. 즉, 해당하는 값 외의 값이 들어오면 오류를 발생시킴.
    	// 오류예시 -> DTO에는 b_no라고 틀을 만들고 오라클 결과물의 컬럼명은 m_no일때 두 이름이 다르니 저장이 절대절대절대절대 불가능
    	MatchingDTO matchingDetail = this.matchingservice.getMatchingDetail(match_no);
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/matching/matchingDetailForm.jsp");
    	
    	//오라클에서 가져온 결과물을 저장한 matchingDetail을 JSP쪽에서 ${requestScope.~}를 이용해 사용할 수 있게 addObject라는 것을 사용 
    	mav.addObject("detail", matchingDetail);
    	
        return mav;
    }
    
  //===============================================================================================================================================================================
    
    //새글쓰기 페이지
    @RequestMapping(value = "/newMatchingBoardForm.do")
    public ModelAndView newMatchingBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/matching/newMatchingBoardForm.jsp");
    	
        return mav;
    }
    
  //===============================================================================================================================================================================
    
    //새글쓰기 페이지에서 등록을 누르면 발생하는 메소드
    @RequestMapping( value = "/newMatchingBoardProc.do"
			,method = RequestMethod.POST
			, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	public Map<String, String> newMatchingBoardProc(MatchingDTO matchingDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int newMatchingBoardCnt = this.matchingservice.regMatchingBoard(matchingDTO);
	resultMap.put("result", newMatchingBoardCnt+"");
	
	
	return resultMap;
	}
    
  //===============================================================================================================================================================================
    
    
}
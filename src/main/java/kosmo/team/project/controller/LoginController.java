package kosmo.team.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kosmo.team.project.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/loginProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int loginProc(
			// --------------------------------------
			// "mid" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 mid 에 저장하고 들어온다.
			// 즉, 아이디가 매개변수 mid 로 들어온다.
			// --------------------------------------
			@RequestParam(value = "mid") String mid
			// --------------------------------------
			// "pwd" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 pwd 에 저장하고 들어온다.
			// 즉, 암호가 매개변수 pwd 로 들어온다.
			// --------------------------------------
			, @RequestParam(value = "password") String password

			// --------------------------------------------------
			// HttpSession 객체의 메위주를 저장하는 매개변수 session 선언하기
			// <주의> 이 HttpSession 객체는 이전에 loginForm.do 로 접속 시 생성된 놈이다.
			// 이놈이 매개변수로 들어온다는 말은 뭔가 맡기겠다는 의미이다.
			// 로그인이 성공하면 아이디를 맡길 예정이다.
			// --------------------------------------------------
			, HttpSession session

	) {
		

		
		
		
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mid", mid);
		map.put("password", password);

		int midpwdCnt = this.loginService.getmidpwdCnt(map);
		
		// 로그인이 성공했다면 (즉, midpwdCnt가 1 이상이면)
        if (midpwdCnt > 0) {
            // 세션에 사용자 아이디를 저장합니다.
            session.setAttribute("mid", mid);
        }

		return midpwdCnt;
	}
	
	
	
	@RequestMapping(value = "/logoutProc.do")
    public String logoutProc(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/loginForm.do"; // 로그인 페이지로 리다이렉트
    }
	
	
	
	
	
	

}

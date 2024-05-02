package kosmo.team.project.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.LoginDAO;
import kosmo.team.project.dao.MemberDAO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
	
	@Autowired
	private LoginDAO loginDAO;
	
	public int getmidpwdCnt(Map<String,String> midpwd) {
			
			//----------------------------------------------------
			// [로그인 아이디]와 [암호]의 DB 존재 개수를 저장할 변수 midPwdCnt 선언하고
			// LoginDAOImpl 객체의 getmidpwdCnt 메소드를 호출하여 얻은 데이터 저장하기
			// 즉, 로그인 [아이디]와 [암호]의 DB 존재 개수를 구해서 변수 midPwdCnt 에 저장한다.
			//----------------------------------------------------
			int midpwdCnt = this.loginDAO.getmidpwdCnt(midpwd);
			
			//[로그인 아이디]와 [암호]의 DB 존재 개수를 리턴하기.
			return midpwdCnt;
		}

	@Override
	public String getNickname(String mid) {
		return loginDAO.getNickname(mid);
	}
}
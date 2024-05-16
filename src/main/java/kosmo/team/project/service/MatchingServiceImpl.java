package kosmo.team.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.MatchingDAO;
import kosmo.team.project.dto.MatchingDTO;
import kosmo.team.project.dto.MatchingSearchDTO;



@Service
@Transactional
public class MatchingServiceImpl implements MatchingService {
	
	@Autowired
	private MatchingDAO matchingDAO;
	
	//매칭 게시물 가져오기
	//MatchingService 라는 인터페이스에 있는 메소드의 기능을 이곳에서 설정
	public List<MatchingDTO> getMatchingList(MatchingSearchDTO matchingSearchDTO){
		
		//getMatchingList 라는 변수에 matchingDAO쪽에 있는 getMatchingList 메소드의 실행결과를 저장
		List<MatchingDTO> getMatchingList = this.matchingDAO.getMatchingList(matchingSearchDTO);
		
		//변수에 저장된 값을 나를 호출한 놈에게 돌려준다. 즉, controller쪽에서 날 부른놈이 getMatchingList에 저장된 값을 받게 된다.
		return getMatchingList;
	}
	
	//매칭 상세보기
	public MatchingDTO getMatchingDetail(int match_no) {
		
		//getMatchingDetail 라는 변수에 matchingDAO쪽에 있는 getMatchingDetail 메소드의 실행결과를 저장
		MatchingDTO getMatchingDetail = this.matchingDAO.getMatchingDetail(match_no);
		//변수에 저장된 값을 나를 호출한 놈에게 돌려준다.
		return getMatchingDetail;
	}
	
	public int regMatchingBoard(MatchingDTO matchingDTO) {
		int regMatchingBoard = this.matchingDAO.regMatchingBoard(matchingDTO);
		return regMatchingBoard;
	}
	
}

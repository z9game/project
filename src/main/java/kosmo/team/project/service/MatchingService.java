package kosmo.team.project.service;

import java.util.List;
import java.util.Map;

import kosmo.team.project.dto.MatchingDTO;
import kosmo.team.project.dto.MatchingSearchDTO;



public interface MatchingService {

	//이곳은 인터페이스. 메소드의 이름만 정의해주고 이 메소드의 기능은 MatchingServiceImpl 쪽에서 만들어줄거임.
	List<MatchingDTO> getMatchingList(MatchingSearchDTO matchingSearchDTO);
}

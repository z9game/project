package kosmo.team.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.MatchingDTO;
import kosmo.team.project.dto.MatchingSearchDTO;


//밑에 있는 이 @Mapper이 없으면 DAOImpl을 만들어서 인터페이스 메소드의 기능을 설정해줘야한다.
//하지만 @Mapper를 사용하면 메소드의 기능을 설정할 필요없이 여기서 바로 mapper 쪽의 구문이 실행되게 된다.
//쉽게 말하자면 이 인터페이스 안의 메소드명과 같은 id명 (mapper쪽에 있는)이 있는 구문이 실행되게 된다.
@Mapper
public interface MatchingDAO {

	//매칭 게시물 가져오기
	List<MatchingDTO> getMatchingList(MatchingSearchDTO matchingSearchDTO);
	
	//매칭 상세보기
	MatchingDTO getMatchingDetail(int match_no);
	
	//새글쓰기
	int regMatchingBoard(MatchingDTO matchingDTO);
	
	//수정,삭제를 위한 게시물 가져오기
	MatchingDTO getUpdelBoard(int match_no);
	
	//게시물 수정
	int updateMatching(MatchingDTO matchingDTO);
	
	//게시물 삭제
	int deleteMatching(MatchingDTO matchingDTO);
}

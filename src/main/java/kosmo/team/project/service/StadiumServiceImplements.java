package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.StadiumDAO;
import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;


@Service
@Transactional
public class StadiumServiceImplements implements StadiumService {

	@Autowired
	private StadiumDAO stadiumDAO;

	@Override
	public int getStadiumListCnt(StadiumSearchDTO stadiumSearchDTO) {

		int stadiumListCnt = stadiumDAO.getStadiumListCnt(stadiumSearchDTO);

		return stadiumListCnt;

	}

	@Override
	public List<StadiumDTO> getStadiumList(StadiumSearchDTO stadiumSearchDTO) {

		List<StadiumDTO> stadiumList = stadiumDAO.getStadiumList(stadiumSearchDTO);

		return stadiumList;

	}
	
	public int getStadiumListAllCnt() {
		// --------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		// --------------------------------------
		int StadiumListAllCnt = this.stadiumDAO.getStadiumListAllCnt();
		// --------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		// --------------------------------------
		return StadiumListAllCnt;
	}
	
	
	public StadiumDTO getStadium(int stadium_no) {

		
		StadiumDTO stadiumDTO = this.stadiumDAO.getStadium(stadium_no);

		return stadiumDTO;

	}

	
	
	
}

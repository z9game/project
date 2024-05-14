package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.StadiumDAO;
import kosmo.team.project.dto.MyRentStaidumTimeDTO;
import kosmo.team.project.dto.RentStadiumDTO;
import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;
import kosmo.team.project.dto.TimeDTO;
import kosmo.team.project.dto.myRentStadiumDTO;

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

	@Override
	public List<TimeDTO> getTime(int stadium_no) {

		List<TimeDTO> timeDTO = stadiumDAO.getTime(stadium_no);

		return timeDTO;

	}

	@Override
	public int insertStadiumRent(RentStadiumDTO rentStadiumDTO) {

		
		
		int m_noCnt = this.stadiumDAO.getM_no(rentStadiumDTO);
		
		//System.out.print(m_noCnt);
		
		if(m_noCnt >= 3) {
			
			
			return 4;
		}
		
		
		int rentCnt = this.stadiumDAO.getRentTimeCnt(rentStadiumDTO);

		if (rentCnt > 0) {

			return 3;
		}

		int StadiumRentCnt = this.stadiumDAO.insertStadiumRent(rentStadiumDTO);

		// ----------------------------------------------
		// 1개 게시판 글 입력 적용 행의 개수 리턴하기
		// ----------------------------------------------
		return StadiumRentCnt;
	}

	
	
	
	@Override
	public List<String> getFullRent(int stadium_no) {
		

		List<String> fullRent = this.stadiumDAO.getFullRent(stadium_no);


		return fullRent;
	}


	@Override
	public List<myRentStadiumDTO> getMyStadiumList(int m_no) {
		List<myRentStadiumDTO> getMyStadiumList = stadiumDAO.getMyStadiumList(m_no);

		return getMyStadiumList;
	}

	
	
	
	@Override
	public List<MyRentStaidumTimeDTO> getTimeRanges(MyRentStaidumTimeDTO myRentStaidumTimeDTO) {
		
		List<MyRentStaidumTimeDTO> timeRanges = stadiumDAO.getTimeRanges(myRentStaidumTimeDTO);
		
		return timeRanges;
	}

	@Override
	public List<MyRentStaidumTimeDTO> getDate(MyRentStaidumTimeDTO myRentStaidumTimeDTO) {
		List<MyRentStaidumTimeDTO> RentDate = stadiumDAO.getDate(myRentStaidumTimeDTO);
				
		return RentDate;
	}

}

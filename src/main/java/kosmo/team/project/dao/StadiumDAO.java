package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.MyRentStaidumTimeDTO;
import kosmo.team.project.dto.RentStadiumDTO;
import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;
import kosmo.team.project.dto.TimeDTO;
import kosmo.team.project.dto.YangdoDTO;
import kosmo.team.project.dto.YangdoSearchDTO;
import kosmo.team.project.dto.myRentStadiumDTO;

@Mapper
public interface StadiumDAO {

	
	
	public List<StadiumDTO> getStadiumList(StadiumSearchDTO stadiumSearchDTO);
	
	public int getStadiumListCnt(StadiumSearchDTO stadiumSearchDTO);
	
	public int getStadiumListAllCnt();
	
	StadiumDTO getStadium(int stadium_no);

	public List<TimeDTO> getTime(int stadium_no);

	public int insertStadiumRent(RentStadiumDTO rentStadiumDTO);

	public int getRentTimeCnt(RentStadiumDTO rentStadiumDTO);

	
	/*
	 * public int getRentTimeSlotCnt(int stadium_no);
	 */
	public List<String> getFullRent(int stadium_no);

	public int getM_no(RentStadiumDTO rentStadiumDTO);



	public List<myRentStadiumDTO> getMyStadiumList(int m_no);

	public List<MyRentStaidumTimeDTO> getTimeRanges(MyRentStaidumTimeDTO myRentStaidumTimeDTO);

	public List<MyRentStaidumTimeDTO> getDate(MyRentStaidumTimeDTO myRentStaidumTimeDTO);

	public int insertStadiumYangdo(YangdoDTO yangdoDTO);

	public int getYangdoCnt(YangdoDTO yangdoDTO);

	public int getMemberListAllCnt();

	public int getStadiumYangdoListCnt(YangdoSearchDTO yangdoSearchDTO);

	public List<YangdoDTO> getStadiumYangdoList(YangdoSearchDTO yangdoSearchDTO);
	

	
	
	
	
}

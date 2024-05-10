package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.RentStadiumDTO;
import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;
import kosmo.team.project.dto.TimeDTO;

@Mapper
public interface StadiumDAO {

	
	
	public List<StadiumDTO> getStadiumList(StadiumSearchDTO stadiumSearchDTO);
	
	public int getStadiumListCnt(StadiumSearchDTO stadiumSearchDTO);
	
	public int getStadiumListAllCnt();
	
	StadiumDTO getStadium(int stadium_no);

	public List<TimeDTO> getTime(int stadium_no);

	public int insertStadiumRent(RentStadiumDTO rentStadiumDTO);

	public int getRentTimeCnt(RentStadiumDTO rentStadiumDTO);

	

	
	
	
	
}

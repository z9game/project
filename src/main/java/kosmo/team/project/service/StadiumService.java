package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.RentStadiumDTO;
import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;
import kosmo.team.project.dto.TimeDTO;

public interface StadiumService {

	public int getStadiumListCnt(StadiumSearchDTO stadiumSearchDTO);

	public List<StadiumDTO> getStadiumList(StadiumSearchDTO stadiumSearchDTO);
	
	public int getStadiumListAllCnt();
	
	StadiumDTO getStadium(int stadium_no);

	List<TimeDTO> getTime(int stadium_no);

	public int insertStadiumRent(RentStadiumDTO rentStadiumDTO);

}

package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;

@Mapper
public interface StadiumDAO {

	
	
	public List<StadiumDTO> getStadiumList(StadiumSearchDTO stadiumSearchDTO);
	
	public int getStadiumListCnt(StadiumSearchDTO stadiumSearchDTO);
	
	public int getStadiumListAllCnt();
	
	StadiumDTO getStadium(int stadium_no);
	
	
	
	
}

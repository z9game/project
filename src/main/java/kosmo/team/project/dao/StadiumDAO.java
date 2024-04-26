package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.StadiumDTO;

@Mapper
public interface StadiumDAO {

	public int getImageBoardListCnt(StadiumDTO stadiumDTO);
	
	public List<StadiumDTO> getImageBoardList(StadiumDTO stadiumDTO);
}

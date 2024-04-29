package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.MainDTO;

@Mapper
public interface MainDAO {

	public int getImageBoardListCnt(MainDTO mainDTO);
	
	public List<MainDTO> getImageBoardList(MainDTO mainDTO);
}

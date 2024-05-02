package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.MainDTO;
import kosmo.team.project.dto.MainSearchDTO;

@Mapper
public interface MainDAO {

	public int getImageBoardListCnt(MainDTO mainDTO);
	
	public List<MainDTO> getImageBoardList(MainDTO mainDTO);
	
	public List<MainDTO> getMainTournamentList(MainDTO mainDTO);
	
	public List<MainDTO> getCustomerServiceList(MainDTO mainDTO);
	
	public List<MainDTO> getCustomerServiceCategoryList(MainDTO mainDTO);
	
	public int getCustomerServiceQnABoardListAllCnt();
	
	public int getCustomerServiceQnABoardListCnt(MainSearchDTO mainSearchDTO);
	
	public List<MainDTO> getCustomerServiceQnABoardList(MainSearchDTO mainSearchDTO);
}

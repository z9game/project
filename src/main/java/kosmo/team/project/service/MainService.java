package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.CustomerServiceDetailDTO;
import kosmo.team.project.dto.MainDTO;
import kosmo.team.project.dto.MainSearchDTO;

public interface MainService {
	public int getImageBoardListCnt(MainDTO mainDTO);

	public List<MainDTO> getImageBoardList(MainDTO mainDTO);
	
	public List<MainDTO> getMainTournamentList(MainDTO mainDTO);
	
	public List<MainDTO> getCustomerServiceList(MainDTO mainDTO);
	
	public List<MainDTO> getCustomerServiceCategoryList(MainDTO mainDTO);
	
	public int getCustomerServiceQnABoardListAllCnt();
	
	public int getCustomerServiceQnABoardListCnt(MainSearchDTO mainSearchDTO);
	
	public List<MainDTO> getCustomerServiceQnABoardList(MainSearchDTO mainSearchDTO);
	
	public CustomerServiceDetailDTO getCustomerServiceDetail(int b_no);
	
	public int insertQnABoard(MainDTO mainDTO);
}

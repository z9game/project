package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.CustomerServiceDetailDTO;
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
	
	public int updateCustomerServiceDetailFormReadCountPlusOne(int b_no);
	
	public CustomerServiceDetailDTO getCustomerServiceDetail(int b_no);
	
	public int insertQnABoard(MainDTO mainDTO);
	
	public CustomerServiceDetailDTO getSubject(int b_no);
	
	public int insertQnAComment(MainDTO mainDTO);
	
	public List<CustomerServiceDetailDTO> getCustomerServiceQnADetailComment(CustomerServiceDetailDTO customerServiceDetailDTO);
	
	public CustomerServiceDetailDTO customerServiceQnAUpdateForm(int b_no);
	
	public int customerServiceQnAUpdate(CustomerServiceDetailDTO customerServiceDetailDTO);
	
	public int customerServiceQnADelete(CustomerServiceDetailDTO customerServiceDetailDTO);
	
	public int customerServiceQnACommentDelete(CustomerServiceDetailDTO customerServiceDetailDTO);
}

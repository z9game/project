package kosmo.team.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.MainDAO;
import kosmo.team.project.dto.MainDTO;
import kosmo.team.project.dto.MainSearchDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

@Service
@Transactional
public class MainServiceImplements implements MainService {

	@Autowired
	private MainDAO mainDAO;

	@Override
	public int getImageBoardListCnt(MainDTO mainDTO) {

		int imageBoardListCnt = mainDAO.getImageBoardListCnt(mainDTO);

		return imageBoardListCnt;

	}

	@Override
	public List<MainDTO> getImageBoardList(MainDTO mainDTO) {

		List<MainDTO> imageBoardList = mainDAO.getImageBoardList(mainDTO);

		return imageBoardList;

	}
	
	@Override
	public List<MainDTO> getMainTournamentList(MainDTO mainDTO) {

		List<MainDTO> tournamentList = this.mainDAO.getMainTournamentList(mainDTO);

		return tournamentList;

	}
	
	@Override
	public List<MainDTO> getCustomerServiceList(MainDTO mainDTO) {

		List<MainDTO> customerServiceList = this.mainDAO.getCustomerServiceList(mainDTO);

		return customerServiceList;

	}
	
	@Override
	public List<MainDTO> getCustomerServiceCategoryList(MainDTO mainDTO) {

		List<MainDTO> customerServiceCategoryList = this.mainDAO.getCustomerServiceCategoryList(mainDTO);

		return customerServiceCategoryList;

	}
	
	@Override
	public int getCustomerServiceQnABoardListAllCnt() {
		
		int customerServiceQnABoardListAllCnt = this.mainDAO.getCustomerServiceQnABoardListAllCnt();
		
		return customerServiceQnABoardListAllCnt;
	}
	
	@Override
	public int getCustomerServiceQnABoardListCnt(MainSearchDTO mainSearchDTO) {
		
		int customerServiceQnABoardListCnt = this.mainDAO.getCustomerServiceQnABoardListCnt(mainSearchDTO);
		
		return customerServiceQnABoardListCnt;
	}
	
	@Override
	public List<MainDTO> getCustomerServiceQnABoardList(MainSearchDTO mainSearchDTO) {
		
		List<MainDTO> customerServiceQnABoardList = this.mainDAO.getCustomerServiceQnABoardList(mainSearchDTO);
		
		return customerServiceQnABoardList;
	}
}

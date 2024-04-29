package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.MainDAO;
import kosmo.team.project.dto.MainDTO;

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
}

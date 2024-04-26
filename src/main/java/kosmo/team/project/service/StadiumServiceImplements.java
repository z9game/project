package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.StadiumDAO;
import kosmo.team.project.dto.StadiumDTO;


@Service
@Transactional
public class StadiumServiceImplements implements StadiumService {

	@Autowired
	private StadiumDAO stadiumDAO;

	@Override
	public int getImageBoardListCnt(StadiumDTO stadiumDTO) {

		int imageBoardListCnt = stadiumDAO.getImageBoardListCnt(stadiumDTO);

		return imageBoardListCnt;

	}

	@Override
	public List<StadiumDTO> getImageBoardList(StadiumDTO stadiumDTO) {

		List<StadiumDTO> imageBoardList = stadiumDAO.getImageBoardList(stadiumDTO);

		return imageBoardList;

	}
}

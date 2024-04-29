package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.MainDTO;

public interface MainService {
	public int getImageBoardListCnt(MainDTO mainDTO);

	public List<MainDTO> getImageBoardList(MainDTO mainDTO);
}

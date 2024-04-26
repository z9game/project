package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.StadiumDTO;

public interface StadiumService {

	public int getImageBoardListCnt(StadiumDTO stadiumDTO);

	public List<StadiumDTO> getImageBoardList(StadiumDTO stadiumDTO);
}

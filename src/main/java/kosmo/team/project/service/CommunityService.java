package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.CommunityDTO;

public interface CommunityService {

	public int getNoticeBoardListCnt(CommunityDTO communityDTO);

	public List<CommunityDTO> getNoticeBoardList(CommunityDTO communityDTO);
	
	public int getFreeBoardListCnt(CommunityDTO communityDTO);

	public List<CommunityDTO> getFreeBoardList(CommunityDTO communityDTO);
	
	public int getImageBoardListCnt(CommunityDTO communityDTO);

	public List<CommunityDTO> getImageBoardList(CommunityDTO communityDTO);
}

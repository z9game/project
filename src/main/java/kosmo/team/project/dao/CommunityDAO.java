package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.CommunityDTO;

@Mapper
public interface CommunityDAO {

	public int getNoticeBoardListCnt(CommunityDTO communityDTO);
	
	public List<CommunityDTO> getNoticeBoardList(CommunityDTO communityDTO);
	
	public int getFreeBoardListCnt(CommunityDTO communityDTO);
	
	public List<CommunityDTO> getFreeBoardList(CommunityDTO communityDTO);
	
	public int getImageBoardListCnt(CommunityDTO communityDTO);
	
	public List<CommunityDTO> getImageBoardList(CommunityDTO communityDTO);
}

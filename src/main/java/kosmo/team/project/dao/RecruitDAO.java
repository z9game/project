package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.RecruitTeamDTO;
import kosmo.team.project.dto.TeamMemDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

@Mapper
public interface RecruitDAO {


	public List<RecruitTeamDTO> getRecruit_TeamBoardList();

	public List<RecruitTeamDTO> getRecruit_MemBoardList();
	
	
}

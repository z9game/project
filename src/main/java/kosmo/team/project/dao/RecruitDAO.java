package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitMemDTO;
import kosmo.team.project.dto.RecruitTeamDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

@Mapper
public interface RecruitDAO {


	public List<RecruitTeamDTO> getRecruit_TeamBoardList();
	
	public List<RecruitMemDTO> getRecruit_MemBoardList();
	
	public List<RecruitHiredDTO> getRecruit_HiredBoardList();
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList();

}

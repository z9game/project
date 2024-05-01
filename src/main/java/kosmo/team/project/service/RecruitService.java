package kosmo.team.project.service;

import java.util.List;


import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitMemDTO;
import kosmo.team.project.dto.RecruitTeamDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

public interface RecruitService {
	
	public List<RecruitTeamDTO> getRecruit_TeamBoardList();
	
	public List<RecruitMemDTO> getRecruit_MemBoardList();
	
	public List<RecruitHiredDTO> getRecruit_HiredBoardList();
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList();

}

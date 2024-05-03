package kosmo.team.project.service;

import java.util.List;


import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;

public interface RecruitService {
	
	public List<RecruitTeamMemDTO> getTeam_MemList(RecruitSearchDTO recruitSearchDTO);
	
	public List<RecruitHiredDTO> getRecruit_HiredBoardList();
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList();

	RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no);

	RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no);



}


package kosmo.team.project.service;

import java.util.List;


import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitMemDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamDTO;

public interface RecruitService {
	
	public List<RecruitTeamDTO> getRecruit_TeamBoardList(RecruitSearchDTO recruitSearchDTO);
	
	public List<RecruitMemDTO> getRecruit_MemBoardList(RecruitSearchDTO recruitSearchDTO);
	
	public List<RecruitHiredDTO> getRecruit_HiredBoardList();
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList();
	
	RecruitTeamDTO getRecruit_TeamDetail(int recruitment_no);

	RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no);

	RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no);

	RecruitMemDTO getRecruit_MemDetail(int recruitment_no);



}


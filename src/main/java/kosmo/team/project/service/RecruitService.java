package kosmo.team.project.service;

import java.util.List;


import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;

public interface RecruitService {
	
	public List<RecruitTeamMemDTO> getRecruit_TeamMemList(RecruitSearchDTO recruitSearchDTO);
	
	public List<RecruitHiredDTO> getRecruit_HiredBoardList();
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList();
	
	RecruitTeamMemDTO getRecruit_TeamMemDetail(int b_no);

	RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no);

	RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no);
	
	public int regTeamMemRecruit(RecruitTeamMemDTO recruitTeamMemDTO);
	
	public int getBoardListCnt(RecruitSearchDTO recruitSearchDTO);
	
	public List<String> getRecruit_day(int b_no);
	
	public List<String> getRecruit_time(int b_no);

	

}


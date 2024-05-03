package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;
@Mapper
public interface RecruitDAO {

	public List<RecruitTeamMemDTO> getTeam_MemList(RecruitSearchDTO recruitSearchDTO);
	
	public List<RecruitHiredDTO> getRecruit_HiredBoardList();
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList();
	
	public RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no);
	
	public RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no);

}

package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;

@Mapper
public interface RecruitDAO {

	public List<RecruitTeamMemDTO> getRecruit_TeamMemList(RecruitSearchDTO recruitSearchDTO);
	
	public List<RecruitHiredDTO> getRecruit_HiredBoardList();
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList();
	
	public RecruitTeamMemDTO getRecruit_TeamMemDetail(int b_no);
	
	public RecruitHiredDTO getRecruit_HiredDetail(int b_no);
	
	public RecruitLessonDTO getRecruit_LessonDetail(int b_no);
	
	public int regTeamMemRecruit(RecruitTeamMemDTO recruitTeamMemDTO);
	
	public int updateTeamMemReadCnt(int b_no);

	public int getBoardListCnt(RecruitSearchDTO recruitSearchDTO);	
	
	public int insertDay(RecruitTeamMemDTO recruitTeamMemDTO);	
	
	public int insertTime(RecruitTeamMemDTO recruitTeamMemDTO);	
	
	public List<String> getRecruit_day(int b_no);
	
	public List<String> getRecruit_time(int b_no);
	
	
}

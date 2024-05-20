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
	
	public int newInsertDay(RecruitTeamMemDTO recruitTeamMemDTO);	
	
	public int newInsertTime(RecruitTeamMemDTO recruitTeamMemDTO);
	
	public List<String> getRecruit_day(int b_no);
	
	public List<String> getRecruit_time(int b_no);
	
	public RecruitTeamMemDTO getRecruit_TeamMemUpDel(int b_no);
	
	public List<String> getRecruit_TeamMemUpDel_day(int b_no);
	
	public List<String> getRecruit_TeamMemUpDel_time(int b_no);
	
	public RecruitTeamMemDTO getRecruit_TeamMemUpDel_sidosigungu(int b_no);
	
	public int recruitUpdateTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	
	public int deleteDay(RecruitTeamMemDTO recruitTeamMemDTO);
	
	public int deleteTime(RecruitTeamMemDTO recruitTeamMemDTO);
	
	public int recruitDeleteTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	
	 //신청버튼을 누르면 내 정보가 승낙대기 테이블로 넘어감.
	int regWaitingList(RecruitTeamMemDTO recruitTeamMemDTO);
	
	int findMyTeam(RecruitTeamMemDTO recruitTeamMemDTO); 
	
	
	//팀이 없을때, 새 글쓰기에서 팀원구하지 못하게
	int getTeamCnt(int m_no);
}

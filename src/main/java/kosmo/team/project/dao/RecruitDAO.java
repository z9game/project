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
	
	public RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no);
	
	public RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no);
	
	
	
	
	public int regTeamMemRecruit(RecruitTeamMemDTO recruitTeamMemDTO);
	
	//용병모집 새글쓰기 저장 
	public int regHiredRecruit(RecruitHiredDTO recruitHiredDTO);
	
	
	
	public int updateTeamMemReadCnt(int b_no);
	
	

	public int getBoardListCnt(RecruitSearchDTO recruitSearchDTO);	
	
	
	
	
	public int insertDay(RecruitTeamMemDTO recruitTeamMemDTO);	
	
	public int insertTime(RecruitTeamMemDTO recruitTeamMemDTO);	
	
	
	
	//팀원모집 새글쓰기 요일 삽입
	public int newInsertDay(RecruitTeamMemDTO recruitTeamMemDTO);	
	
	//팀원모집 새글쓰기 시간 삽입
	public int newInsertTime(RecruitTeamMemDTO recruitTeamMemDTO);
	
	//팀원모집 새글쓰기 요일 삽입
	public int newInsertDay_hired(RecruitHiredDTO recruitHiredDTO);	
	
	//팀원모집 새글쓰기 시간 삽입
	public int newInsertTime_hired(RecruitHiredDTO recruitHiredDTO);
	
	
	
	
	public List<String> getRecruit_day(int b_no);
	
	public List<String> getRecruit_time(int b_no);
	
	//용병모집상세페이지에서 요일 가져오기
	public List<String> getRecruit_hired_day(int recruitment_no);

	//용병모집상세페이지에서 시간 가져오기
	public List<String> getRecruit_hired_time(int recruitment_no);
	
	
	
	
	public RecruitTeamMemDTO getRecruit_TeamMemUpDel(int b_no);
	
	public List<String> getRecruit_TeamMemUpDel_day(int b_no);
	
	public List<String> getRecruit_TeamMemUpDel_time(int b_no);
	
	public RecruitTeamMemDTO getRecruit_TeamMemUpDel_sidosigungu(int b_no);
	
	
	
	public int recruitUpdateTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	
	public int deleteDay(RecruitTeamMemDTO recruitTeamMemDTO);
	
	public int deleteTime(RecruitTeamMemDTO recruitTeamMemDTO);
	
	public int recruitDeleteTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	
	
//---------------------------------------------------------------------------
	
	//용병모집수정삭제페이지
	public RecruitHiredDTO getRecruit_HiredUpDel(int recruitment_no);
	
	public List<String> getRecruit_HiredUpDel_day(int recruitment_no);
	
	public List<String> getRecruit_HiredUpDel_time(int b_recruitment_nono);
	
	public RecruitHiredDTO getRecruit_HiredUpDel_sidosigungu(int recruitment_no);
	
	
	//용병 게시물 수정
	public int recruitUpdateHired(RecruitHiredDTO recruitHiredDTO);
	
	public int deleteDay_hired(RecruitHiredDTO recruitHiredDTO);
	
	public int deleteTime_hired(RecruitHiredDTO recruitHiredDTO);
	
	

	public int insertDay_hired(RecruitHiredDTO recruitHiredDTO);	
	
	public int insertTime_hired(RecruitHiredDTO recruitHiredDTO);
	
	public int recruitDeleteHired(RecruitHiredDTO recruitHiredDTO);
}

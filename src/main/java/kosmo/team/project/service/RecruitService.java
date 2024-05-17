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

	//용병모집 새글쓰기 저장 
	public int regHiredRecruit(RecruitHiredDTO recruitHiredDTO);
	
	public int getBoardListCnt(RecruitSearchDTO recruitSearchDTO);
	
	
	
	
	public List<String> getRecruit_day(int b_no);
	
	public List<String> getRecruit_time(int b_no);
	
	//용병모집상세페이지에서 요일 가져오기
	public List<String> getRecruit_hired_day(int recruitment_no);
	
	//용병모집상세페이지에서 시간 가져오기
	public List<String> getRecruit_hired_time(int recruitment_no);
	
	
	
	
	RecruitTeamMemDTO getRecruit_TeamMemUpDel(int b_no);
	
	public List<String> getRecruit_TeamMemUpDel_day(int b_no);
	
	public List<String> getRecruit_TeamMemUpDel_time(int b_no);
	
	RecruitTeamMemDTO getRecruit_TeamMemUpDel_sidosigungu(int b_no);
	
	

	//팀/팀원 게시물 수정을 위한 메소드 이름만 정의
	public int recruitUpdateTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	//팀/팀원 게시물 삭제를 위한 메소드 이름만 정의
	public int recruitDeleteTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	
//==================================================================================================================================

	//용병모집수정삭제페이지
	RecruitHiredDTO getRecruit_HiredUpDel(int recruitment_no);
	
	public List<String> getRecruit_HiredUpDel_day(int recruitment_no);
	
	public List<String> getRecruit_HiredUpDel_time(int recruitment_no);
	
	RecruitHiredDTO getRecruit_HiredUpDel_sidosigungu(int recruitment_no);

	
	//용병 게시물 수정을 위한 메소드 이름만 정의
	public int recruitUpdateHired(RecruitHiredDTO recruitHiredDTO);
	//용병 게시물 삭제를 위한 메소드 이름만 정의
	public int recruitDeleteHired(RecruitHiredDTO recruitHiredDTO);
	
}


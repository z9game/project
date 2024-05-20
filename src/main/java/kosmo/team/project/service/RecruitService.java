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
	
	RecruitTeamMemDTO getRecruit_TeamMemUpDel(int b_no);
	
	public List<String> getRecruit_TeamMemUpDel_day(int b_no);
	
	public List<String> getRecruit_TeamMemUpDel_time(int b_no);
	
	RecruitTeamMemDTO getRecruit_TeamMemUpDel_sidosigungu(int b_no);

	//팀/팀원 게시물 수정을 위한 메소드 이름만 정의
	public int recruitUpdateTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	//팀/팀원 게시물 삭제를 위한 메소드 이름만 정의
	public int recruitDeleteTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	 //신청버튼을 누르면 내 정보가 승낙대기 테이블로 넘어감.
	int regWaitingList(RecruitTeamMemDTO recruitTeamMemDTO);
	//팀이 없을때, 새 글쓰기에서 팀원구하지 못하게
	int getTeamCnt(int m_no);

}


package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.CommunityDAO;
import kosmo.team.project.dao.RecruitDAO;
import kosmo.team.project.dao.SampleDAO;
import kosmo.team.project.dao.TournamentDAO;
import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;

@Service
@Transactional
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitDAO recruitDAO;
	
	public List<RecruitTeamMemDTO> getRecruit_TeamMemList(RecruitSearchDTO recruitSearchDTO) {

		List<RecruitTeamMemDTO> getRecruit_TeamMemList = this.recruitDAO.getRecruit_TeamMemList(recruitSearchDTO);

		return getRecruit_TeamMemList;

	}

	public List<RecruitHiredDTO> getRecruit_HiredBoardList() {

		List<RecruitHiredDTO> getRecruit_HiredBoardList = this.recruitDAO.getRecruit_HiredBoardList();

		return getRecruit_HiredBoardList;

	}
	
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList() {

		List<RecruitLessonDTO> getRecruit_LessonBoardList = this.recruitDAO.getRecruit_LessonBoardList();

		return getRecruit_LessonBoardList;

	}
	
	public int getBoardListCnt(RecruitSearchDTO recruitSearchDTO) {
		
		int boardListCnt = this.recruitDAO.getBoardListCnt(recruitSearchDTO);

		return boardListCnt;
	}
	
	public RecruitTeamMemDTO getRecruit_TeamMemDetail(int b_no) {

		int updateReadCnt = this.recruitDAO.updateTeamMemReadCnt(b_no);
		
		RecruitTeamMemDTO getRecruit_TeamMemDetail = this.recruitDAO.getRecruit_TeamMemDetail(b_no);

		return getRecruit_TeamMemDetail;

	}
	
	
	public RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no) {

		RecruitHiredDTO getRecruit_HiredDetail = this.recruitDAO.getRecruit_HiredDetail(recruitment_no);

		return getRecruit_HiredDetail;

	}
	

	public RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no) {

		RecruitLessonDTO getRecruit_LessonDetail = this.recruitDAO.getRecruit_LessonDetail(recruitment_no);

		return getRecruit_LessonDetail;

	}
	

	
	public int regTeamMemRecruit(RecruitTeamMemDTO recruitTeamMemDTO) {
		int regTeamMemRecruit = this.recruitDAO.regTeamMemRecruit(recruitTeamMemDTO);
		
		if(recruitTeamMemDTO.getDay() != null)
		{
			int newInsertDay = this.recruitDAO.newInsertDay(recruitTeamMemDTO);
		}
		
		if(recruitTeamMemDTO.getTime() != null)
		{
			int newInsertTime = this.recruitDAO.newInsertTime(recruitTeamMemDTO); 
		}
		return regTeamMemRecruit; 		
		
	}
	
	public List<String> getRecruit_day(int b_no){
		List<String> getRecruit_day = this.recruitDAO.getRecruit_day(b_no); 
		return getRecruit_day; 	
	}
	
	public List<String> getRecruit_time(int b_no){
		List<String> getRecruit_time = this.recruitDAO.getRecruit_time(b_no);
		return getRecruit_time; 
	}
	

	
	public RecruitTeamMemDTO getRecruit_TeamMemUpDel(int b_no) {
		RecruitTeamMemDTO recruitTeamMemDTO = this.recruitDAO.getRecruit_TeamMemUpDel(b_no);
		return recruitTeamMemDTO;
	}
	
	public List<String> getRecruit_TeamMemUpDel_day(int b_no) {
		List<String> recruitTeamMemDTO_day = this.recruitDAO.getRecruit_TeamMemUpDel_day(b_no);
		return recruitTeamMemDTO_day;
	}
	
	public List<String> getRecruit_TeamMemUpDel_time(int b_no) {
		List<String> recruitTeamMemDTO_time = this.recruitDAO.getRecruit_TeamMemUpDel_time(b_no);
		return recruitTeamMemDTO_time;
	}
	
	
	 public RecruitTeamMemDTO getRecruit_TeamMemUpDel_sidosigungu(int b_no) {
		 RecruitTeamMemDTO recruitTeamMemDTO_sidosigungu = this.recruitDAO.getRecruit_TeamMemUpDel_sidosigungu(b_no);
		 return recruitTeamMemDTO_sidosigungu;
	 }
	 
	 //service(인터페이스 공간)에 이름만 정의해준 메소드의 기능을 이 안에서 정의, 게시물 수정
	 public int recruitUpdateTeamMem(RecruitTeamMemDTO recruitTeamMemDTO){
		 int deleteDay = this.recruitDAO.deleteDay(recruitTeamMemDTO);
		 int deleteTime = this.recruitDAO.deleteTime(recruitTeamMemDTO);
		 if(recruitTeamMemDTO.getDay() != null)
		 {
			int insertDay = this.recruitDAO.insertDay(recruitTeamMemDTO);
		 }
		
		 if(recruitTeamMemDTO.getTime() != null)
		 {
			int insertTime = this.recruitDAO.insertTime(recruitTeamMemDTO); 
		 }
		 int recruitUpdateTeamMem = this.recruitDAO.recruitUpdateTeamMem(recruitTeamMemDTO);
		 
		 return recruitUpdateTeamMem;
	 }
	 
	 
	//service(인터페이스 공간)에 이름만 정의해준 메소드의 기능을 이 안에서 정의, 게시물 삭제
	 public int recruitDeleteTeamMem(RecruitTeamMemDTO recruitTeamMemDTO) {
		 int recruitDeleteTeamMem = this.recruitDAO.recruitDeleteTeamMem(recruitTeamMemDTO);
		 return recruitDeleteTeamMem;
	 }
	 //신청버튼을 누르면 내 정보가 승낙대기 테이블로 넘어감.
	 public int regWaitingList(RecruitTeamMemDTO recruitTeamMemDTO) {
		 //내가 팀에 속해있는지 확인
		 int findMyTeam = this.recruitDAO.findMyTeam(recruitTeamMemDTO); 
		 if(findMyTeam > 0)
		 {
			 return 2;
		 }
		 int regWaitingList = this.recruitDAO.regWaitingList(recruitTeamMemDTO);
		 if(regWaitingList > 0) 
		 {
			 return 1;
		 }
		 return 0;
	 }
	 

	//팀이 없을때, 새 글쓰기에서 팀원구하지 못하게
	 public int getTeamCnt(int m_no) {
		 
		 int getTeamCnt = this.recruitDAO.getTeamCnt(m_no);
		 
		 return getTeamCnt;
	 }
	 
	 
}

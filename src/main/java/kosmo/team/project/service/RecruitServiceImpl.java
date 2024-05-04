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
		return regTeamMemRecruit; 		
		
	}
	
}

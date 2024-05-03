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
import kosmo.team.project.dto.RecruitMemDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamDTO;

@Service
@Transactional
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitDAO recruitDAO;
	
	
	public List<RecruitTeamDTO> getRecruit_TeamBoardList(RecruitSearchDTO recruitSearchDTO) {

		List<RecruitTeamDTO> getRecruit_TeamBoardList = this.recruitDAO.getRecruit_TeamBoardList(recruitSearchDTO);

		return getRecruit_TeamBoardList;

	}
	
	public List<RecruitMemDTO> getRecruit_MemBoardList(RecruitSearchDTO recruitSearchDTO) {

		List<RecruitMemDTO> getRecruit_MemBoardList = this.recruitDAO.getRecruit_MemBoardList(recruitSearchDTO);

		return getRecruit_MemBoardList;

	}

	public List<RecruitHiredDTO> getRecruit_HiredBoardList() {

		List<RecruitHiredDTO> getRecruit_HiredBoardList = this.recruitDAO.getRecruit_HiredBoardList();

		return getRecruit_HiredBoardList;

	}
	
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList() {

		List<RecruitLessonDTO> getRecruit_LessonBoardList = this.recruitDAO.getRecruit_LessonBoardList();

		return getRecruit_LessonBoardList;

	}

	public RecruitTeamDTO getRecruit_TeamDetail(int recruitment_no) {

		RecruitTeamDTO getRecruit_TeamDetail = this.recruitDAO.getRecruit_TeamDetail(recruitment_no);

		return getRecruit_TeamDetail;

	}
	
	
	public RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no) {

		RecruitHiredDTO getRecruit_HiredDetail = this.recruitDAO.getRecruit_HiredDetail(recruitment_no);

		return getRecruit_HiredDetail;

	}
	

	public RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no) {

		RecruitLessonDTO getRecruit_LessonDetail = this.recruitDAO.getRecruit_LessonDetail(recruitment_no);

		return getRecruit_LessonDetail;

	}
	

	public RecruitMemDTO getRecruit_MemDetail(int recruitment_no) {

		RecruitMemDTO getRecruit_MemDetail = this.recruitDAO.getRecruit_MemDetail(recruitment_no);

		return getRecruit_MemDetail;

	}
}

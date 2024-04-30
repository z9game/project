package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.CommunityDAO;
import kosmo.team.project.dao.RecruitDAO;
import kosmo.team.project.dao.SampleDAO;
import kosmo.team.project.dao.TournamentDAO;
import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitTeamDTO;
import kosmo.team.project.dto.SampleDTO;
import kosmo.team.project.dto.SampleSearchDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

@Service
@Transactional
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitDAO recruitDAO;
	
	
	public List<RecruitTeamDTO> getRecruit_TeamBoardList() {

		List<RecruitTeamDTO> getRecruit_TeamBoardList = this.recruitDAO.getRecruit_TeamBoardList();

		return getRecruit_TeamBoardList;

	}

	public List<RecruitHiredDTO> getRecruit_HiredBoardList() {

		List<RecruitHiredDTO> getRecruit_HiredBoardList = this.recruitDAO.getRecruit_HiredBoardList();

		return getRecruit_HiredBoardList;

	}
	
	
	public List<RecruitLessonDTO> getRecruit_LessonBoardList() {

		List<RecruitLessonDTO> getRecruit_LessonBoardList = this.recruitDAO.getRecruit_LessonBoardList();

		return getRecruit_LessonBoardList;

	}
}

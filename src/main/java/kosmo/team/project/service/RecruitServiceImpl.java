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
import kosmo.team.project.dto.RecruitTeamDTO;
import kosmo.team.project.dto.SampleDTO;
import kosmo.team.project.dto.SampleSearchDTO;
import kosmo.team.project.dto.TeamMemDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

@Service
@Transactional
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitDAO recruitDAO;
	
	
	public List<RecruitTeamDTO> getRecruit_TeamBoardList(String choice) {
		
		
		String team_mem = choice;
			
			
			
		if(team_mem == "팀")
		{
			List<RecruitTeamDTO> getRecruit_TeamBoardList = this.recruitDAO.getRecruit_TeamBoardList();
			System.out.println("team=>" + getRecruit_TeamBoardList);
			return getRecruit_TeamBoardList;
		}
		else if(team_mem == "팀원")
		{
			List<RecruitTeamDTO> getRecruit_TeamBoardList = this.recruitDAO.getRecruit_MemBoardList();
			System.out.println("mem=>" + getRecruit_TeamBoardList);
			return getRecruit_TeamBoardList;
		}
		
		
		return null;

	}

}

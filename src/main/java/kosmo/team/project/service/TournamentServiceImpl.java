package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.CommunityDAO;
import kosmo.team.project.dao.SampleDAO;
import kosmo.team.project.dao.TournamentDAO;
import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.SampleDTO;
import kosmo.team.project.dto.SampleSearchDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

@Service
@Transactional
public class TournamentServiceImpl implements TournamentService {

	@Autowired
	private TournamentDAO tournamentDAO;
	
	
	public List<TournamentDTO> getTournamentList(TournamentSearchDTO tournamentSearchDTO) {

		List<TournamentDTO> tournamentList = this.tournamentDAO.getTournamentList(tournamentSearchDTO);

		return tournamentList;

	}

}

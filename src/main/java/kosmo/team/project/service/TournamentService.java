package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

public interface TournamentService {
	
	public List<TournamentDTO> getTournamentList(TournamentSearchDTO tournamentSearchDTO);
}

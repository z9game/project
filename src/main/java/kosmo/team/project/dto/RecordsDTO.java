package kosmo.team.project.dto;

public class RecordsDTO {
	
	private String nickname;
	private int games_played;
	private int wins;
	private int draws;
	private int losses;
	private int goals_for;
	private int goals_assist;
	
	private int player;
	
	private String sort;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getGames_played() {
		return games_played;
	}

	public void setGames_played(int games_played) {
		this.games_played = games_played;
	}

	public int getWins() {
		return wins;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public int getDraws() {
		return draws;
	}

	public void setDraws(int draws) {
		this.draws = draws;
	}

	public int getLosses() {
		return losses;
	}

	public void setLosses(int losses) {
		this.losses = losses;
	}

	public int getGoals_for() {
		return goals_for;
	}

	public void setGoals_for(int goals_for) {
		this.goals_for = goals_for;
	}

	public int getGoals_assist() {
		return goals_assist;
	}

	public void setGoals_assist(int goals_assist) {
		this.goals_assist = goals_assist;
	}

	public int getPlayer() {
		return player;
	}

	public void setPlayer(int player) {
		this.player = player;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
}
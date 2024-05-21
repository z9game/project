package kosmo.team.project.dto;

import java.util.List;

public class TeamDTO {

	//팀생성할때 
	private String team_name;
	private int team_master;
	
	//수락리스트가져올때
	private String name;
	private int age;
	private String sido;
	private int m_no;
	private List<Integer> m_no_A;
	
	//팀정보
	private int team_no;

	
	
	
	public int getTeam_no() {
		return team_no;
	}

	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}

	public List<Integer> getM_no_A() {
		return m_no_A;
	}

	public void setM_no_A(List<Integer> m_no_A) {
		this.m_no_A = m_no_A;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getTeam_name() {
		return team_name;
	}

	public int getTeam_master() {
		return team_master;
	}

	public void setTeam_master(int team_master) {
		this.team_master = team_master;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	
	
	
	
}

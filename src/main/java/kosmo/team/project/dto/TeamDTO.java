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
	private List<Integer> m_no_H;
	private List<Integer> m_no_L;
	
	//팀정보
	private int team_no;
	
	//매칭수락
	private String nickname;
	
	//수락/거절
	private int reg;
	private int refuse;
	
	//다음경기일정
	private String stadium_name;
	private String day;
	private String time_range;

	
	
	
	public List<Integer> getM_no_L() {
		return m_no_L;
	}

	public void setM_no_L(List<Integer> m_no_L) {
		this.m_no_L = m_no_L;
	}

	public List<Integer> getM_no_H() {
		return m_no_H;
	}

	public void setM_no_H(List<Integer> m_no_H) {
		this.m_no_H = m_no_H;
	}

	public String getStadium_name() {
		return stadium_name;
	}

	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTime_range() {
		return time_range;
	}

	public void setTime_range(String time_range) {
		this.time_range = time_range;
	}

	public int getReg() {
		return reg;
	}

	public void setReg(int reg) {
		this.reg = reg;
	}

	public int getRefuse() {
		return refuse;
	}

	public void setRefuse(int refuse) {
		this.refuse = refuse;
	}

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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	
	
}

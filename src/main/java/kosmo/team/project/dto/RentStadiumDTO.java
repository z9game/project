package kosmo.team.project.dto;

import java.util.List;

public class RentStadiumDTO {
	
	
	
	private int stadium_no; 
	private int time_slot;
	private String date;
	private List<String> checkDate;
	public int getStadium_no() {
		return stadium_no;
	}
	public void setStadium_no(int stadium_no) {
		this.stadium_no = stadium_no;
	}
	public int getTime_slot() {
		return time_slot;
	}
	public void setTime_slot(int time_slot) {
		this.time_slot = time_slot;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<String> getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(List<String> checkDate) {
		this.checkDate = checkDate;
	}
	
	
	

	
	
	
	
	

}

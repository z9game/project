package kosmo.team.project.dto;

import java.util.List;

public class MatchingSearchDTO {
	
	private String searchType1;
	private String keyword1;
	private int sido;
	private int sigungu;
	private String date;
	private int matchingTime;
	
	
	public String getSearchType1() {
		return searchType1;
	}
	public void setSearchType1(String searchType1) {
		this.searchType1 = searchType1;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getMatchingTime() {
		return matchingTime;
	}
	public void setMatchingTime(int matchingTime) {
		this.matchingTime = matchingTime;
	}
	public int getSido() {
		return sido;
	}
	public void setSido(int sido) {
		this.sido = sido;
	}
	public int getSigungu() {
		return sigungu;
	}
	public void setSigungu(int sigungu) {
		this.sigungu = sigungu;
	}
	
	
	
	
}

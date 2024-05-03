package kosmo.team.project.dto;

import java.util.List;

public class AdminSearchDTO {

	private String searchType1;
	private String searchType2;
	private int sido;
	private int sigungu;
	private String minDate;
	private String maxDate;
	private String keyword1;
	private String keyword2;
	private String orand;
	private String sort;
	private List<String> gender;

	
	private int selectPageNo; // 선택한 페이지 번호 관련 파값 저장 변수
	private int rowCntPerPage; // 페이지 당 보여줄 행의 개수 관련 파값 저장 변수
	private int begin_rowNo; // 테이블 검색 시 시작행 번호 저장 변수 선언.
	private int end_rowNo; // 테이블 검색 시 끝행 번호 저장 변수 선언.
	public String getSearchType1() {
		return searchType1;
	}
	public void setSearchType1(String searchType1) {
		this.searchType1 = searchType1;
	}
	public String getSearchType2() {
		return searchType2;
	}
	public void setSearchType2(String searchType2) {
		this.searchType2 = searchType2;
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
	public String getMinDate() {
		return minDate;
	}
	public void setMinDate(String minDate) {
		this.minDate = minDate;
	}
	public String getMaxDate() {
		return maxDate;
	}
	public void setMaxDate(String maxDate) {
		this.maxDate = maxDate;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getOrand() {
		return orand;
	}
	public void setOrand(String orand) {
		this.orand = orand;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public List<String> getGender() {
		return gender;
	}
	public void setGender(List<String> gender) {
		this.gender = gender;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public int getBegin_rowNo() {
		return begin_rowNo;
	}
	public void setBegin_rowNo(int begin_rowNo) {
		this.begin_rowNo = begin_rowNo;
	}
	public int getEnd_rowNo() {
		return end_rowNo;
	}
	public void setEnd_rowNo(int end_rowNo) {
		this.end_rowNo = end_rowNo;
	}
	
	
	
	
	
	
	
	
	
	
}

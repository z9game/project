package kosmo.team.project.dto;

public class RecruitHiredDTO {
	
	private int recruitment_no;
	private String title;
	private String writer;
	private String content;
	private int readcount;
	private String reg_date;
	
	
	
	public int getRecruitment_no() {
		return recruitment_no;
	}
	public void setRecruitment_no(int recruitment_no) {
		this.recruitment_no = recruitment_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}	
}

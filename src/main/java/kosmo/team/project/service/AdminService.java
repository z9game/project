package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.MemberSearchDTO;

public interface AdminService {
	// 모든 회원 목록을 불러오는 메서드
	public List<MemberDTO> getMemberList(MemberSearchDTO memberSearchDTO);

	public int getMemberListCnt(MemberSearchDTO memberSearchDTO);


	public int getMemberListAllCnt();

	MemberDTO getMember(int b_no);

}

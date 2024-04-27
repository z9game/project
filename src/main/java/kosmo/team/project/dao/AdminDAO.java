package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.MemberSearchDTO;
@Mapper
public interface AdminDAO {
    // 모든 회원 목록을 가져오는 메서드
	public List<MemberDTO> getMemberList(MemberSearchDTO memberSearchDTO);

	public int getMemberListCnt(MemberSearchDTO memberSearchDTO);


	public int getMemberListAllCnt();

	MemberDTO getMember(int b_no);
}

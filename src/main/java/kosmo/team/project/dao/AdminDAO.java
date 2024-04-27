package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.MemberDTO;
@Mapper
public interface AdminDAO {
    // 모든 회원 목록을 가져오는 메서드
    List<MemberDTO> getAllMembers();
}

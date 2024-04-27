package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.MemberDTO;

public interface AdminService {
    // 모든 회원 목록을 불러오는 메서드
    List<MemberDTO> getAllMembers();
}

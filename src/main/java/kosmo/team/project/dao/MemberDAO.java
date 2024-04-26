package kosmo.team.project.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import kosmo.team.project.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	int insertMember(MemberDTO memberDTO);
	int getmid(Map<String,String> mid);
}

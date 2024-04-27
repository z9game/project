package kosmo.team.project.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	public int getmidpwdCnt(Map<String,String> midpwd);
}
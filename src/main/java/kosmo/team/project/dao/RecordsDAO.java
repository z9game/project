package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kosmo.team.project.dto.RecordsDTO;

@Mapper
public interface RecordsDAO {
	
	public List<RecordsDTO> getRecordsStatistics(RecordsDTO recordsDTO);
	
	public int getRecordsStatisticsListCnt(RecordsDTO recordsDTO);
}

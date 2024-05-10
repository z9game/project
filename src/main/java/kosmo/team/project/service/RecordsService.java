package kosmo.team.project.service;

import java.util.List;
import kosmo.team.project.dto.RecordsDTO;

public interface RecordsService {
	
	public List<RecordsDTO> getRecordsStatistics(RecordsDTO recordsDTO);
	
	public int getRecordsStatisticsListCnt(RecordsDTO recordsDTO);
}

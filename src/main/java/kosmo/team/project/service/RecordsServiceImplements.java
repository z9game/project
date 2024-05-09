package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosmo.team.project.dao.RecordsDAO;
import kosmo.team.project.dto.RecordsDTO;

@Service
public class RecordsServiceImplements implements RecordsService {

	@Autowired
	private RecordsDAO recordsDAO;

	@Override
	public List<RecordsDTO> getRecordsStatistics(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsStatistics = this.recordsDAO.getRecordsStatistics(recordsDTO);

		return recordsStatistics;

	}
	
	@Override
	public int getRecordsStatisticsListCnt(RecordsDTO recordsDTO) {
		
		int recordsStatisticsListCnt = this.recordsDAO.getRecordsStatisticsListCnt(recordsDTO);
		
		return recordsStatisticsListCnt;
	}
}

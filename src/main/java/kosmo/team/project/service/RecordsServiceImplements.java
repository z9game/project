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

	// 전체 순위
	
	@Override
	public List<RecordsDTO> getRecordsRankingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsRankingTabAll = this.recordsDAO.getRecordsRankingTabAll(recordsDTO);

		return recordsRankingTabAll;

	}
	
	@Override
	public int getRecordsRankingTabAllListCnt(RecordsDTO recordsDTO) {
		
		int recordsRankingTabAllListCnt = this.recordsDAO.getRecordsRankingTabAllListCnt(recordsDTO);
		
		return recordsRankingTabAllListCnt;
	}
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabAll = this.recordsDAO.getRecordsGoalRatingTabAll(recordsDTO);

		return recordsGoalRatingTabAll;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabAll = this.recordsDAO.getRecordsWinRatingTabAll(recordsDTO);

		return recordsWinRatingTabAll;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabAll = this.recordsDAO.getRecordsAssistRatingTabAll(recordsDTO);

		return recordsAssistRatingTabAll;

	}
	
	// 지역 순위
	
	@Override
	public List<RecordsDTO> getRecordsRankingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsRankingTabRegion = this.recordsDAO.getRecordsRankingTabRegion(recordsDTO);

		return recordsRankingTabRegion;

	}
	
	@Override
	public int getRecordsRankingTabRegionListCnt(RecordsDTO recordsDTO) {
		
		int recordsRankingTabRegionListCnt = this.recordsDAO.getRecordsRankingTabRegionListCnt(recordsDTO);
		
		return recordsRankingTabRegionListCnt;
	}
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabRegion = this.recordsDAO.getRecordsGoalRatingTabRegion(recordsDTO);

		return recordsGoalRatingTabRegion;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabRegion = this.recordsDAO.getRecordsWinRatingTabRegion(recordsDTO);

		return recordsWinRatingTabRegion;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabRegion = this.recordsDAO.getRecordsAssistRatingTabRegion(recordsDTO);

		return recordsAssistRatingTabRegion;

	}
}
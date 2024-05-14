package kosmo.team.project.service;

import java.util.List;
import kosmo.team.project.dto.RecordsDTO;

public interface RecordsService {
	
	// 전체 순위
	
	public List<RecordsDTO> getRecordsRankingTabAll(RecordsDTO recordsDTO);
	
	public int getRecordsRankingTabAllListCnt(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsGoalRatingTabAll(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabAll(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabAll(RecordsDTO recordsDTO);
	
	
	// 지역 순위
	
	public List<RecordsDTO> getRecordsRankingTabRegion(RecordsDTO recordsDTO);
	
	public int getRecordsRankingTabRegionListCnt(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsGoalRatingTabRegion(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabRegion(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabRegion(RecordsDTO recordsDTO);
}
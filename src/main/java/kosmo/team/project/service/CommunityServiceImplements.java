package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.CommunityDAO;
import kosmo.team.project.dao.SampleDAO;
import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.SampleDTO;
import kosmo.team.project.dto.SampleSearchDTO;

@Service
@Transactional
public class CommunityServiceImplements implements CommunityService {

	@Autowired
	private CommunityDAO communityDAO;

	@Override
	public int getNoticeBoardListCnt(CommunityDTO communityDTO) {

		int noticeBoardListCount = communityDAO.getNoticeBoardListCnt(communityDTO);

		return noticeBoardListCount;

	}

	@Override
	public List<CommunityDTO> getNoticeBoardList(CommunityDTO communityDTO) {

		List<CommunityDTO> noticeBoardList = communityDAO.getNoticeBoardList(communityDTO);

		return noticeBoardList;

	}
	
	@Override
	public int getFreeBoardListCnt(CommunityDTO communityDTO) {

		int freeBoardListCount = communityDAO.getFreeBoardListCnt(communityDTO);

		return freeBoardListCount;

	}

	@Override
	public List<CommunityDTO> getFreeBoardList(CommunityDTO communityDTO) {

		List<CommunityDTO> freeBoardList = communityDAO.getFreeBoardList(communityDTO);

		return freeBoardList;

	}
	
	@Override
	public int getImageBoardListCnt(CommunityDTO communityDTO) {

		int imageBoardListCnt = communityDAO.getImageBoardListCnt(communityDTO);

		return imageBoardListCnt;

	}

	@Override
	public List<CommunityDTO> getImageBoardList(CommunityDTO communityDTO) {

		List<CommunityDTO> imageBoardList = communityDAO.getImageBoardList(communityDTO);

		return imageBoardList;

	}
}

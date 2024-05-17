package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.AdminCommunitySearchDTO;
import kosmo.team.project.dto.AdminSearchDTO;
import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunityFreeBoardDetailDTO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.PlayerRecordDTO;
import kosmo.team.project.dto.Stadim2DTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

@Mapper
public interface AdminDAO {
	// 모든 회원 목록을 가져오는 메서드
	public List<MemberDTO> getMemberList(AdminSearchDTO adminSearchDTO);

	public int getMemberListCnt(AdminSearchDTO adminSearchDTO);

	public int getMemberListAllCnt();

	MemberDTO getMember(int m_no);

	int getMemberCnt(int m_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateMember(MemberDTO memberDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteMember(MemberDTO memberDTO);

	PlayerRecordDTO getPlayerRecord(int m_no);

	int getPlayerRecordCnt(int m_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updatePlayerRecord(PlayerRecordDTO playerRecordDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deletePlayerRecord(PlayerRecordDTO playerRecordDTO);

	// ---------------------------------------
	// 공지사항
	// --------------------------------------

	public List<CommunityDTO> getNoticeBoardList(AdminSearchDTO adminSearchDTO);

	public int getNoticeBoardListCnt(AdminSearchDTO adminSearchDTO);

	public int getNoticeBoardAllCnt();

	CommunityDTO getNoticeBoard(int b_no);

	int updateNoticeBoardReadCount(int b_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateNoticeBoard(CommunityDTO communityDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteNoticeBoard(CommunityDTO communityDTO);

	int getNoticeBoardCnt(int b_no);

	int insertNoticeBoard(CommunityDTO communityDTO);

	// ----------------------------------------
	// 경기장
	// ----------------------------------------
	public List<Stadim2DTO> getStadiumList(AdminSearchDTO adminSearchDTO);

	public int getStadiumListCnt(AdminSearchDTO adminSearchDTO);

	public int getStadiumListAllCnt();

	Stadim2DTO getStadium(int stadium_no);

	int getStadiumCnt(int stadium_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 경기장] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateStadium(Stadim2DTO stadim2DTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 경기장] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteStadium(Stadim2DTO stadim2DTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 경기장 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int insertStadium(Stadim2DTO stadim2DTO);
	
	public List<TournamentDTO> getTournamentList(TournamentSearchDTO tournamentSearchDTO);
	
	public int getTournamentListCnt(TournamentSearchDTO tournamentSearchDTO);

	public int getCommunityGallaryBoardListAllCnt();
	
	public int getCommunityGallaryBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);
	
	public List<CommunityDTO> getCommunityGallaryBoardList(AdminCommunitySearchDTO communitySearchDTO);

	public int insertCommunityGallaryProc(CommunityDTO communityDTO);
	
	public int updateCommunityGallaryReadCount(int b_no);
	
	public CommunityDTO getCommunityGallaryDetailForm(int b_no);
	
	public int getCommunityGallaryBoardCnt(int b_no);
	
	public int updateCommunityGallaryUpProc(CommunityDTO communityDTO);
	
	public int deleteCommunityGallaryDelProc(CommunityDTO communityDTO);
	
   //--All
   /*** admin 장터 sale, free_sharing 테이블 리스트 총 개수 가져오기  ***/
   public int getTabAllMarketplaceBoardListAllCnt();
	
   public int getTabAllMarketplaceBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);
   
   public List<CommunityDTO> getTabAllMarketplaceBoardList(AdminCommunitySearchDTO communitySearchDTO);
   
   public int getTabSaleMarketplaceBoardListAllCnt();
   
   public int getTabSaleMarketplaceBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);
   
   public List<CommunityDTO> getTabSaleMarketplaceBoardList(AdminCommunitySearchDTO communitySearchDTO);
   
   public int getTabFreeSharingMarketplaceBoardListAllCnt();
   
   public int getTabFreeSharingMarketplaceBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);
   
   public List<CommunityDTO> getTabFreeSharingMarketplaceBoardList(AdminCommunitySearchDTO communitySearchDTO);
	
   // 장터 세일
   public int insertMarketplaceSaleCommunity(CommunityDTO communityDTO);
   
   public int insertMarketplaceFreeSharingCommunity(CommunityDTO communityDTO);
   
   public int updateMarketplaceSaleBoardReadCount(int b_no);
   
   public CommunityDTO getCommunityMarketplaceSaleDetailForm(int b_no);
   
   public int updateMarketplaceFreeSharingBoardReadCount(int b_no);
   
   public CommunityDTO getCommunityMarketplaceFreeSharingDetailForm(int b_no);
   
   public int getMarketplaceSaleBoardCnt(int b_no);
   
   public int updateMarketplaceSaleBoard(CommunityDTO communityDTO);
   
   public int getMarketplaceFreeSharingBoardCnt(int b_no);
   
   public int updateMarketplaceFreeSharingBoard(CommunityDTO communityDTO);
   
   public int deleteMarketplaceSaleBoard(CommunityDTO communityDTO);
   
   public int deleteMarketplaceFreeSharingBoard(CommunityDTO communityDTO);
   
   //자유게시판-------------------------------------------------------------------------------------------------------------
   public int getFreeBoardAllCnt();
   
   public int getFreeBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);
   
   public List<CommunityDTO> getFreeBoardList(AdminCommunitySearchDTO communitySearchDTO);
   
   public int insertCommunityFreeBoard(CommunityDTO communityDTO);
   
   public int updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO);
   
   public CommunityFreeBoardDetailDTO getFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO);
   
   public int getFreeBoardDetailCommentPageListCount(CommunityFreeBoardDetailDTO detailDTO);
   
   public List<CommunityFreeBoardDetailDTO> getFreeBoardDetailCommentPageList(CommunityFreeBoardDetailDTO detailDTO);
   
   public int insertFreeBoardDetailComment(CommunityFreeBoardDetailDTO detailDTO);
   
   public int updateFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO);
   
   public int insertFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO);
   
   public CommunityDTO getFreeBoard(int b_no);
   
   public int getCommunityFreeBoardCount(int b_no);
   
   public int updateCommunityFreeBoard(CommunityDTO communityDTO);
   
   public int getFreeBoardCommentCount(int b_no);
   
   public int deleteCommunityFreeBoard(CommunityDTO communityDTO);
}

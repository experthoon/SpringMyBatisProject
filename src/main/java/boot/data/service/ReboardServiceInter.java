package boot.data.service;

import java.util.List;
import boot.data.dto.ReboardDto;

public interface ReboardServiceInter {
	public int getMaxNum();
	public int getTotalCount(String serachcolumn, String searchword);
	public List<ReboardDto> getPagingList(String searchcolumn, String searchword, int start, int perpage);
	public void insertReboard(ReboardDto dto);
	public void updateRestep(int regroup, int restep);
	public void updateReadCount(int num);
	public ReboardDto getData(int num);
	public void updateReboard(ReboardDto dto);
	public void deleteReboard(int num);
	public void updateLikes(int num);
}

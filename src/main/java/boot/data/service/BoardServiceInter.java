package boot.data.service;

import java.util.List;

import boot.data.dto.BoardDto;

public interface BoardServiceInter {
	public int getTotalCount();
	public void updatereadcount(String num);
	public BoardDto getData(String num);
	public int getMaxNum();
	public List<BoardDto> getList(int start, int perpage);
	public void insertBoard(BoardDto dto);
}

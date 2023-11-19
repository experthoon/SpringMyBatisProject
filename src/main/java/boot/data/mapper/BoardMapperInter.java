package boot.data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.BoardDto;

@Mapper
public interface BoardMapperInter {
	public int getTotalCount(); //resulttype int 파라미터값 없음
	public void updatereadcount(String num);
	public BoardDto getData(String num);
	public int getMaxNum();
	public List<BoardDto> getList(HashMap<String, Integer> map);
	public void insertBoard(BoardDto dto);
}

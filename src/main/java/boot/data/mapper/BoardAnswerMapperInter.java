package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.BoardAnswerDto;

@Mapper
public interface BoardAnswerMapperInter {
	
	public void insertAnswer(BoardAnswerDto dto);
	public List<BoardAnswerDto> getAllAnswers(String num);  //몇번 글에 대한 댓글 리스트 필요하기 때문에 num이 넘어감
	public BoardAnswerDto getAnswer(String idx);
	public void updateAnswer(BoardAnswerDto dto); //idx 값을 넘어감
	public void deleteAnswer(String idx);
	
}

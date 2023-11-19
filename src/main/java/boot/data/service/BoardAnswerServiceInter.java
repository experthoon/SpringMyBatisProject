package boot.data.service;

import java.util.List;

import boot.data.dto.BoardAnswerDto;

public interface BoardAnswerServiceInter  {
	
	public void insertAnswer(BoardAnswerDto dto);
	public List<BoardAnswerDto> getAllAnswers(String num);  //몇번 글에 대한 댓글 리스트 필요하기 때문에 num이 넘어감
	public BoardAnswerDto getAnswer(String idx);
	public void updateAnswer(BoardAnswerDto dto); //idx 값을 넘어감
	public void deleteAnswer(String idx);
	
}

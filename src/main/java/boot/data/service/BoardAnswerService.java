package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.BoardAnswerDto;
import boot.data.mapper.BoardAnswerMapperInter;

@Service
public class BoardAnswerService implements BoardAnswerMapperInter {

	@Autowired
	BoardAnswerMapperInter mapper;
	
	@Override
	public void insertAnswer(BoardAnswerDto dto) {
		mapper.insertAnswer(dto);
	}

	@Override
	public List<BoardAnswerDto> getAllAnswers(String num) {
		return mapper.getAllAnswers(num);
	}

	@Override
	public BoardAnswerDto getAnswer(String idx) {
		return mapper.getAnswer(idx);
	}

	@Override
	public void updateAnswer(BoardAnswerDto dto) {
		mapper.updateAnswer(dto);
	}

	@Override
	public void deleteAnswer(String idx) {
		mapper.deleteAnswer(idx);
	}

}

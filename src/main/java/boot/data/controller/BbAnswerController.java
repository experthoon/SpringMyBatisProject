package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.BoardAnswerDto;
import boot.data.service.BoardAnswerService;
import boot.data.service.MemberService;

@RestController
public class BbAnswerController {
	
	@Autowired
	MemberService memService;
	
	@Autowired
	BoardAnswerService bbService;
	
//	//insert
//	@PostMapping("/board/ainsert")
//	public void insert(@ModelAttribute BoardAnswerDto dto, HttpSession session)
//	{
//		//세션에 로그인한 아이디 얻기
//		String myid = (String)session.getAttribute("myid");
//		//아이디를 넘겨서 name 얻기
//		String name = memService.getName(myid);
//
//		//dto에 넣기
//		dto.setMyid(myid);
//		dto.setName(name);
//
//		//insert
//		bbService.insertAnswer(dto);
//	}
	
	
	//list
	@GetMapping("/board/alist")
	public List<BoardAnswerDto> alist(String num)
	{
		return bbService.getAllAnswers(num);
	}
	
	//delete
	@GetMapping("/board/adelete")
	public void delete(String idx)
	{
		bbService.deleteAnswer(idx);
	}
	
	//수정폼에 출력할 데이터 변환
	@GetMapping("/board/updateAnswer")
	public BoardAnswerDto getData(String idx)
	{
		return bbService.getAnswer(idx);
	}
	
	//수정
	@PostMapping("/board/aupdate")
	public void update(BoardAnswerDto dto)
	{
		bbService.updateAnswer(dto);
	}
}

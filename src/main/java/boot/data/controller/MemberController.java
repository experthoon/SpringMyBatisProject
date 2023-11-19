package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/member/form")
	public String memberform()
	{
		return "/member/memberform";
	}
	
	
	@GetMapping("/member/list")
	public String list(Model model)
	{
		//전체조회
		List<MemberDto> list = service.getAllMembers();
		
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		
		return "/member/memberlist";
	}
	
	//중복체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheckPass(@RequestParam String id)
	{
		Map<String, Integer> map = new HashMap<>();
		
		//id
		int n = service.getSearchId(id);
		map.put("count", n); //0 or 1 
		
		return map;
	}
	
	//insert
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto,
				MultipartFile myphoto,
				HttpSession session)
	{
		//업로드경로
		String path = session.getServletContext().getRealPath("/photo");
		
		//저장파일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "photo_" + sdf.format(new Date())+ myphoto.getOriginalFilename();
		
		//dto의 photo에 저장
		dto.setPhoto(fileName);
		
		//upload
		try {
			myphoto.transferTo(new File(path + "\\" + fileName));
			
			service.insertMember(dto);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		//return "/member/gaipsuccess";
		return "redirect:list";
	}
	
	
	//나의 정보로 이동
	@GetMapping("/member/myinfo")
	public String myinfo(Model model,HttpSession session)
	{
		String id=(String)session.getAttribute("myid");
		
		MemberDto dto=service.getDataById(id);
		
		model.addAttribute("dto", dto);
		
		return "/member/myinfo";
	}
	
	//info에서 사진만 수정
	
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void photoUpload(String num, MultipartFile photo, HttpSession session)
	{
		//업로드될 경로구하기
		String path = session.getServletContext().getRealPath("/photo");
		
		//파일명 구하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "f_"+sdf.format(new Date()) + photo.getOriginalFilename();
		
		
		try {
			photo.transferTo(new File(path + "\\" + fileName));
			
			service.updatePhoto(num, fileName); //db의 사진 수정 session 사진까지는 수정 안됨
			session.setAttribute("loginphoto", fileName);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//수정폼에 출력할 데이터 반환
	@GetMapping("/member/updateform")
	@ResponseBody //일반 컨트롤러 ajax 사용
	public MemberDto getData(String num)
	{
		return service.getDataByNum(num);
	}
	
	//수정
	@PostMapping("/member/update")
	@ResponseBody
	public void update(MemberDto dto, HttpSession session)
	{
		service.updateMember(dto);
		
		//세션에 저장된 이름 변경
		session.setAttribute("loginname", dto.getName());
	}
}

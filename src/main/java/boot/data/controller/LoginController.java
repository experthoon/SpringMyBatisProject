package boot.data.controller;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	MemberService service;

	@GetMapping("/login/main")
	public String loginform(HttpSession session,
							Model model) {

		//폼의 아이디를 얻어줌
		String myid=(String)session.getAttribute("myid");
		//로그인 상태인지 아닌지 판단
		String loginok=(String)session.getAttribute("loginok");

		//한 번도 실행 안하면 null
		if(loginok==null) {
			return "/login/loginForm";
		} else {
			//로그인 중일 때 request에 로그인한 이름 저장하기
			String name=service.getName(myid);
			model.addAttribute("name",name);

			return "/login/logoutForm";
		}
	}

	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String id,
							@RequestParam String pass,
							//null값 들어올 수 있는 가능성 있는 건 무조건 require=false 처리
							@RequestParam(required = false) String cbsave,
							HttpSession session,
							Model model) {

		int check=service.loginIdPassCheck(id,pass);
		//로그인 성공 시
		if(check==1) {
			session.setMaxInactiveInterval(60*60*8);
			session.setAttribute("myid",id);
			session.setAttribute("loginok","yes");
			session.setAttribute("saveok",cbsave);
			session.setAttribute("loginname",service.getName(id));

			//id에 대한 데이터
			MemberDto dto=service.getDataById(id);
			session.setAttribute("loginphoto",dto.getPhoto());
//            model.addAttribute("dto",dto);
			return "redirect:main";
		} else {
			return "/login/passFail";
		}
	}

	@GetMapping("/login/logoutprocess")
	public String logoutproc(HttpSession session) {
		session.removeAttribute("loginok");

		return "redirect:main";
	}
}

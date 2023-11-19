package boot.data.controller;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginRestController {

    @Autowired
    MemberService service;

    @GetMapping("/member/login")
    public Map<String,String> loginproc(String id,
                                        String pass,
                                        HttpSession session) {
        //단순히 리턴 값을 map으로 줄려고 하는 것
        Map<String,String> map=new HashMap<>();
        int result=service.loginIdPassCheck(id,pass);
        if(result==1) {
            //세션 설정
            session.setMaxInactiveInterval(60*60*4);
            //로그인한 정보 얻기
            MemberDto mdto=service.getDataById(id);
            session.setAttribute("loginphoto",mdto.getPhoto());
            session.setAttribute("myid",id);
            session.setAttribute("loginok","yes");
            session.setAttribute("loginname",service.getName(id));
        }
        map.put("result",result==1?"success":"fail");
        return map;
    }

    @GetMapping("/member/logout")
    public void logoutproc(HttpSession session) {
        //로그아웃 때 제거되어야 할 세션
        session.removeAttribute("loginok");
        session.removeAttribute("myid");
    }
}

package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.BoardDto;
import boot.data.dto.SmartDto;
import boot.data.service.SmartService;

@Controller
@RequestMapping("/smart")
public class SmartController {
	
	@Autowired
	SmartService service;
	
	@GetMapping("/form")
	public String form()
	{
		return "/smart/smartform";
	}
	
	
	//insert
	@PostMapping("/insert")
	public String insert(@ModelAttribute SmartDto dto)
	{
		service.insertShop(dto);
		return "redirect:list";
	}
	
	@GetMapping("/list")
	   public ModelAndView list(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
	      ModelAndView model = new ModelAndView();

	      // 총 글의 개수
	      int totalCount = service.getTotalCount();

	      int totalPage; // 총 페이지수
	      int startPage; // 각 블럭의 시작페이지
	      int endPage; // 각 블럭의 끝페이지
	      int start; // 각 페이지의 시작번호
	      int perPage = 5; // 한 페이지에 보여질 글의 갯수
	      int perBlock = 5; // 한 블럭당 보여지는 페이지 갯수

	      // 총 페이지 갯수
	      totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
	      // 각 블럭의 시작페이지
	      startPage = (currentPage - 1) / perBlock * perBlock + 1;
	      endPage = startPage + perBlock - 1;

	      // 총페이지=8일 경우 endpage를 8로 수정한다.
	      if (endPage > totalPage)
	         endPage = totalPage;

	      // 각 페이지에서 불러올 시작번호
	      start = (currentPage - 1) * perPage;

	      // 각 페이지에서 필요한 게시글 가져오기
	      List<SmartDto> list = service.getShopList(start, perPage);

	      // 각 페이지에 출력할 시작번호
	      int no = totalCount - (currentPage - 1) * perPage;

	      // 출력에 필요한 변수들을 model에 저장
	      model.addObject("totalCount", totalCount);
	      model.addObject("list", list);
	      model.addObject("totalPage", totalPage);
	      model.addObject("startPage", startPage);
	      model.addObject("endPage", endPage);
	      model.addObject("perBlock", perBlock);
	      model.addObject("currentPage", currentPage);
	      model.addObject("no", no);

	      model.setViewName("/smart/smartlist");
	      return model;
	   }
	
		@GetMapping("/detail")
		public ModelAndView detail(@RequestParam int num, @RequestParam int currentPage)
		{
			ModelAndView model = new ModelAndView();
			
			//num에 해당하는 dto
			SmartDto dto = service.getSangpum(num);
			
			model.addObject("dto", dto);
			model.addObject("currentPage", currentPage);
			
			model.setViewName("/smart/detail");
			
			return model;
		}
	
	
}

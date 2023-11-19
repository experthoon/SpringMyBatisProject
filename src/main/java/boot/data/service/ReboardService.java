package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ReboardDto;
import boot.data.mapper.ReboardMapperInter;

@Service
public class ReboardService implements ReboardServiceInter {
	@Autowired
	ReboardMapperInter mapper;

	@Override
	public int getMaxNum() {
		return mapper.getMaxNum();
	}

	@Override
	public int getTotalCount(String serachcolumn, String searchword) {
		Map<String, String> map = new HashMap<>();
		map.put("searchcolumn", serachcolumn);
		map.put("searchword", searchword);
		return mapper.getTotalCount(map);
	}

	@Override
	public List<ReboardDto> getPagingList(String searchcolumn, String searchword, int start, int perpage) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getPagingList(map);
	}

	@Override
	public void insertReboard(ReboardDto dto) {
		int num = dto.getNum(); //새글일경우는 0이 들어있다
		int regroup = dto.getRegroup();
		int restep = dto.getRestep();
		int relevel = dto.getRelevel();
		
		if(num==0)
		{
			//새글일 경우 num==0
			regroup=this.getMaxNum()+1;
			restep=0;
			relevel=0;
		}else { //답글
			
			//같은 그룹중에서 전달받은 restep보다 큰 값은 일괄 1씩 증가
			this.updateRestep(regroup, restep);
			
			//그 이후에 전달받은 값보다 1크게 db저장
			restep++;
			relevel++; //댓글 대댓글 구분
		}
		
		//변경된 값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//insert
		mapper.insertReboard(dto);
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		Map<String, Integer> map = new HashMap<>();
		map.put("regroup", regroup);
		map.put("restep", restep);	
		mapper.updateRestep(map);
	}
		
	@Override
	public void updateReadCount(int num) {
		mapper.updateReadCount(num);
	}

	@Override
	public ReboardDto getData(int num) {
		return mapper.getData(num);
	}

	@Override
	public void updateReboard(ReboardDto dto) {
		mapper.updateReboard(dto);
	}

	@Override
	public void deleteReboard(int num) {
		mapper.deleteReboard(num);
	}

	@Override
	public void updateLikes(int num) {
		mapper.updateLikes(num);
	}
}

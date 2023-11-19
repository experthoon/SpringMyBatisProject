package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {
		
	public List<MemberDto> getAllMembers();
	public void insertMember(MemberDto dto);
	public int getSearchId(String id);
	public String getName(String id);
	public int loginIdPassCheck(Map<String, String> map);
	public MemberDto getDataById(String id);
	public void deleteMember(String num);
	public void updatePhoto(Map<String, String> map);
	public void updateMember(MemberDto dto);
	public MemberDto getDataByNum(String num);
}

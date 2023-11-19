package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
@Alias("BoardDto") //mybatis의 dto 타입
public class BoardDto {
	
	private String num;
	private String myid;
	private String name;
	private String subject;
	private String content;
	private String uploadfile;
	private MultipartFile upload; //폼 태그 이름과 같아야함
	private int readcount;
	private Timestamp writeday;
	private int acount;
	
}

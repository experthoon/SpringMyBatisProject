package boot.tiles.mini;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.data.*","boot.tiles.mini"}) //boot*
@MapperScan("boot.data.mapper")
public class BootMiniProject1Application {

	public static void main(String[] args) {
		SpringApplication.run(BootMiniProject1Application.class, args);
	}

}

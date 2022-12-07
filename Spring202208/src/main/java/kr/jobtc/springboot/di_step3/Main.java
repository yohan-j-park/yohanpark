package kr.jobtc.springboot.di_step3;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

//import kr.jobtc.springboot.member.Member;

public class Main {
	//Spring 어플리케이션과 관계없이 실행시킴 , 비즈니스코드
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = 
			new AnnotationConfigApplicationContext(Assembler.class);
		
		Sql sql = (Sql)context.getBean("getSql");
		sql.crud();
		
//		Member member = (Member)context.getBean("getMember");
//		member.crud();
	}

}

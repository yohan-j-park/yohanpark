package kr.jobtc.springboot.di_step3;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.jobtc.springboot.member.GuestMember;
import kr.jobtc.springboot.member.Member;
import kr.jobtc.springboot.member.RegisterMember;

@Configuration
public class Assembler {
	
	@Bean	//getSql의 결과가 Bean의 역할이다.
	public Sql getSql() {
		return new Mssql();
	}
	
//	@Bean
//	public Member getMember() {
//		return new GuestMember();
//	}
}

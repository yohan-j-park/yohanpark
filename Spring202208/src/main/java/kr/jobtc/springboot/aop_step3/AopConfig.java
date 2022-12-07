package kr.jobtc.springboot.aop_step3;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

//@COnfiguration 을 해야 @Bean을 만들 수 있음
@Configuration
@EnableAspectJAutoProxy
@Aspect
public class AopConfig {
	
	public AopConfig() {
		System.out.println("AopConfig()");
	}
	
	@Bean
	public AopDao getAopDao() {
		return new AopDao();
	}
	
	//가로챈 프로세스를 JoinPoint에 담는다.
	//JoinPoint: AOP가 구현되기 위한 장소 타이밍에는 After, Before가 있다 / JoinPoint가 하나로 묶어서 관리해줌
	//Before("execution(접근자 반환형 패키지명.클래스명.메서드명(매개변수))")
	//		(* kr.jobtc.springboot.AopDao.*(..)) => AopDao클래스에 있는 어떤 메서드라도 실행되기전에
	@Before("execution(* kr.jobtc.springboot.aop_step3.AopDao.*(..))")
	public void beforeAdvice(JoinPoint jp) {	
		System.out.println("log...........");
		
		//실행될 메서드명
		System.out.println(jp.getSignature().getName());
	}
}

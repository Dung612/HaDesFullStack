package Hades.main.configurer;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import Hades.main.service.*;

@Configuration
@EnableWebSecurity
public class SecureConfigurer extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests() // bat cac request tu brower
		
		.antMatchers("/frontend/**", "/backend/**","/FileUploads/**","/login/**","/logout").permitAll()
		//cac request kieu /admin phai login
//		.antMatchers("/admin/**").authenticated()
		
		//cac request kieu "/admin/**"phai co role la admin
		.antMatchers("/admin/**").hasAuthority("ADMIN")
		
		.and()
		//neu chua login thi redirect den trang login
		//voi "/login" la 1 request trong controller
		
		.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url") 
		
	//	.defaultSuccessUrl("/admin/home",true) //login thanh cong vao trang admin home
		//LOGIN THANH CONG CHUYEN DEN REQUEST PHU HOP VOI ROLE STEP 3
		.successHandler(new UrlAuthenticationSuccessHandler())
		//login khong thanh cong
		.failureUrl("/login?login_error=true")
		
		.and()
		
		//cau hinh logout
		
		.logout().logoutUrl("/logout").logoutSuccessUrl("/index")
		.invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		
		.and()
		.rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400);
		
	}
	@Autowired
	private UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}
//	public static void main(String[] args) {
//		System.out.println(new BCryptPasswordEncoder(4).encode("1234"));
//	}

}

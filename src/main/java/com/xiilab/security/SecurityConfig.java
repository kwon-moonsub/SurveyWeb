package com.xiilab.security;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import lombok.extern.java.Log;

@Log
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
	ZerockUsersService zerockUsersService;
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		log.info("security config..............");
		http.authorizeRequests().antMatchers("/guest/**").permitAll();
		http.authorizeRequests().antMatchers("/manager/**").hasRole("MANAGER");
		http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");
		http.authorizeRequests().antMatchers("/makeSurvey/**").hasRole("MANAGER");
		http.authorizeRequests().antMatchers("/manageSurvey/**").hasRole("MANAGER");
		http.authorizeRequests().antMatchers("/manageSurvey/**").hasRole("MANAGER");
		http.authorizeRequests().antMatchers("/manageOrg").hasRole("ADMIN");
		
		http.authorizeRequests().antMatchers("/questionnaire/**").hasRole("MANAGER");
		http.csrf().disable();
		http.formLogin().loginPage("/login");
		http.exceptionHandling().accessDeniedPage("/accessDenied");
		http.logout().logoutUrl("/logout").invalidateHttpSession(true);
		
		http.userDetailsService(zerockUsersService);
	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		log.info("build Auth global........");
		//auth.userDetailsService(zerockUsersService).passwordEncoder(passwordEncoder());
		//auth.inMemoryAuthentication().withUser("manager").password("1111").roles("MANAGER");
	}
	
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}
	
	private PersistentTokenRepository getJDBCRepository(){
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
}

package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MyCharacterEncoding implements Filter{
	
	private String encoding;

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		req.setCharacterEncoding(encoding); // 요청 인코딩 처리
		resp.setCharacterEncoding(encoding); // 응답 인코딩 처리
		
		chain.doFilter(req, resp); //다음 필터한테 전달 다음 필터 없으면 servlet으로 감
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//encoding -> 여러가지 바꿀수 있어서 여지 남겨줌
		if(filterConfig.getInitParameter("encoding") == null){
			this.encoding = "UTF-8";
		}else {
			this.encoding = filterConfig.getInitParameter("encoding");
		}
		
		System.out.println("설정된 인코딩 정보 : "+ encoding);
	}

	
	
	

}
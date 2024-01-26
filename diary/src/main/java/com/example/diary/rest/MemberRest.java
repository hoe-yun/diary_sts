package com.example.diary.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.diary.service.CounterService;
import com.example.diary.service.MemberService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class MemberRest {
	@Autowired
	private MemberService memberService;
	@Autowired
	private CounterService counterService;
	
	//아이디 중복 체크
	@PostMapping("idCk")
	public int idCk(@RequestParam(name="idCk")String idCk) {
		log.debug("\u001B[41m"+idCk);
		int Cnt = memberService.idCk(idCk);
		log.debug("\u001B[41m"+Cnt+"");
		return Cnt;
	}
	
	//누적 접속자
	@GetMapping("/COUNT")
	public int totalCount() {
		int totalCount=counterService.selectCntSum();
		log.debug(totalCount+"");
		
		return totalCount;
	}
}

package com.bontex.knt.xframework.com.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import xdataset5.XDataSet5;
import com.bontex.knt.xframework.com.service.ExampleService;

@Controller
public class SimpleXDataSet5Contoller {
	
	@Resource(name = "exampleService")
	private ExampleService exampleService;
	
	private Log log = LogFactory.getLog(this.getClass());
	
	/**
	 * xframe5 조회  (기본방식) 
	 * @param request 스프링에서 제공해주는 HttpServletRequest
	 * @param response 스프링에서 제공해주는 HttpServletResponse
	 * @param model 스프링에서 제공해주는 ModelMap
	 */
	@RequestMapping(value = "/sample/selectSimple.do")
	public void select(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("xframe5 조회  (기본방식)");
		
		XDataSet5 xDataSet5 		= null;
		String strEmpAge 			= null;
		Map<String, Object> element = null;
		int nRow 					= 0;
		int test =1;
		try {
			// XDataSet5오브젝트 생성
			xDataSet5 = new XDataSet5(request, response);
			
			// XDataSet5오브젝트에 포함되어 있는 부가 메타 정보를 로깅
			log.info("ScreenNo : " + xDataSet5.getScreenNo());
			log.info("IP : " + xDataSet5.getTerminalIpAddress());
			log.info("Map ID : " + xDataSet5.getTransactionMapId());
			log.info("User Header : " + xDataSet5.getUserHeader());					
			
			// XDataSet5오브젝트로부터 직원 정보 조회 기준인 직원 이름 정보를 얻어온다.
			// 이 정보는 "TR_SELECT" 트랜잭션의 입력 데이터 셋인 "DS_EMP_AGE"의 "EMP_AGE" 칼럼에서 정보를 가져온다.
			strEmpAge = xDataSet5.getData("DS_EMP_AGE", "EMP_AGE", 0);	// ds_input 데이터셋의 첫번째줄의 EMP_NAME 값 반환	
			
			// 직원 이름으로 DB검색
			List<Map<String,Object>> empInfoList = exampleService.selectMapListByStr(strEmpAge);
			Iterator<Map<String, Object>> iterator = empInfoList.iterator();
	
			// DB검색 결과와 출력 데이터셋을 XDataSet5 오브젝트에 추가
			while (iterator.hasNext()) {
				element = iterator.next();
				xDataSet5.setData("DS_EMP_INFO", "EMP_NAME", nRow, String.valueOf(element.get("EMP_NAME")));
				xDataSet5.setData("DS_EMP_INFO", "EMP_NO", nRow, String.valueOf(element.get("EMP_NO")));	
				xDataSet5.setData("DS_EMP_INFO", "EMP_AGE", nRow, String.valueOf(element.get("EMP_AGE")));	
				xDataSet5.setData("DS_EMP_INFO", "DEPT_CODE", nRow, String.valueOf(element.get("DEPT_CODE")));	
				xDataSet5.setData("DS_EMP_INFO", "TITLE_CODE", nRow, String.valueOf(element.get("TITLE_CODE")));	
				xDataSet5.setData("DS_EMP_INFO", "MAIL_ADDR", nRow,String.valueOf(element.get("MAIL_ADDR")));
				
			    nRow++;
			}
			// 유저헤더부 세팅시 아래와 같이 호출
			// xDataSet5.setUserHeader("user_header_msg");
			// 일반메시지 세팅시 아래와 같이 호출
			// xDataSet5.setMessage("normal_msg_code", "normal_msg_detail");
			
			xDataSet5.returnData();	// response로 데이터 반환처리함		
			
		} catch (Exception e) {		
			log.error("select = " + e);
			try {
				if(xDataSet5 != null) {
					// 로직 처리중 Exception이 발생할 경우, XDataSet5오브젝트에 에러 코드와 에러 메시지를 설정하고 송신
					xDataSet5.setErrorMessage("error_msg_code", e.toString());
					xDataSet5.returnData();	//response로 데이터 반환처리	
				}
			} catch (Exception ex) {
				log.error(ex);
			}
		}
	}
}

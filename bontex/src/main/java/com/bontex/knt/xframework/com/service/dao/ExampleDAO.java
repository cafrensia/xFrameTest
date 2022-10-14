/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.bontex.knt.xframework.com.service.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bontex.knt.xframework.com.service.vo.ExampleVO;

/**
 * @Class Name : XFrameDAO.java
 * @Description : XFrame DAO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2017.05.23           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2017.05.23
 * @version 1.0
 * @see
 *
 *  Copyright (C) by Softbase All right reserved.
 */
@Repository("exampleDAO")
public class ExampleDAO {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	/**
	 * 직원정보를 조회한다.
	 * @param strEmpName - 조회할 정보가 담긴 String
	 * @return 직원정보 리스트
	 * @exception Exception
	 */
	public List<Map<String, Object>> selectMapListByStr(String strEmpName) throws Exception {
		return sqlSession.selectList("sampleMapper.selectMapListByStr", strEmpName);
	}
	
	/**
	 * 직원정보를  조회한다.
	 * @param empMap - 조회할 정보가 담긴 Map
	 * @return 직원정보 리스트
	 * @exception Exception
	 */
	public List<Map<String,Object>> selectMapListByMap(Map<String, Object> empMap)throws Exception {
		return sqlSession.selectList("sampleMapper.selectMapListByMap", empMap);
	}
	
	/**
	 * 직원정보를  조회한다.
	 * @param ExampleVO - 조회할 정보가 담긴 VO
	 * @return 직원정보 리스트
	 * @exception Exception
	 */
	public List<ExampleVO> selectVOListByVO(ExampleVO exampleVO) throws Exception {
		return sqlSession.selectList("sampleMapper.selectVOListByVO", exampleVO);
	}
	
	/**
	 * 직원정보를  업데이트한다.
	 * @param empMap - 변경할 정보가 담긴 Map
	 * @return 처리결과
	 * @exception Exception
	 */
	public int updateMapListByMap(Map<String, Object> empMap)throws Exception {
		return sqlSession.update("sampleMapper.updateMapListByMap", empMap);
	}
	
	/**
	 * 직원정보를  삭제한다.
	 * @param empMap - 삭제할 정보가 담긴 Map
	 * @return 처리결과
	 * @exception Exception
	 */
	public int deleteMapListByMap(Map<String, Object> empMap)throws Exception {
		return sqlSession.delete("sampleMapper.deleteMapListByMap", empMap);
	}
	
	/**
	 * 직원정보를  추가한다.
	 * @param empMap - 추가할 정보가 담긴 Map
	 * @return 처리결과
	 * @exception Exception
	 */
	public int insertMapListByMap(Map<String, Object> empMap)throws Exception {
		return sqlSession.insert("sampleMapper.insertMapListByMap", empMap);
	}
	
	/**
	 * ID/PWD를 이용하여 로그인 데이터를 구한다.
	 * @param empMap - 조회할 정보가 담긴 Map
	 * @return 회원정보 데이터
	 * @exception Exception
	 */
	public List<Map<String,Object>> selectLoginData(Map<String, Object> empMap)throws Exception {
		return sqlSession.selectList("sampleMapper.selectLoginData", empMap);
	}

}

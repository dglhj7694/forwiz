package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.EmployeeVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("employeeDAO")
public class EmployeeDAO extends EgovAbstractDAO{


	//사용자 등록
	public String insertEmployee(EmployeeVO vo) throws Exception {
		return (String) insert("employeeDAO.insertEmployee", vo);
	}
	
	//사용자 정보 수정
	public void updateEmployee(EmployeeVO vo) throws Exception {
		update("employeeDAO.updateEmployee", vo);
	}

	//사용자 정보 삭제
	public void deleteEmployee(EmployeeVO vo) throws Exception {
		delete("employeeDAO.deleteEmployee", vo);
	}

	
	//사용자 정보 상세보기
	public EmployeeVO selectEmployee(EmployeeVO vo) throws Exception {
		return (EmployeeVO) select("employeeDAO.selectEmployee", vo);
	}

	
	//사용자 목록 보기
	public List<?> selectEmployeeList(SampleDefaultVO searchVO) throws Exception {
		return list("employeeDAO.selectEmployeeList", searchVO);
	}


	//사용자 목록 총 갯수
	public int selectEmployeeListTotCnt(SampleDefaultVO searchVO) {
		return (Integer) select("employeeDAO.selectEmployeeListTotCnt", searchVO);
	}
}

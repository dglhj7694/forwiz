package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import egovframework.example.sample.service.EmployeeService;
import egovframework.example.sample.service.EmployeeVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("employeeService")
public class EmployeeServiceImpl extends EgovAbstractServiceImpl implements EmployeeService{
	private static final Logger LOGGER = LoggerFactory.getLogger(EmployeeServiceImpl.class);
	
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "employeeDAO")
	private EmployeeDAO employeeDAO;
	// TODO mybatis 사용
	//  @Resource(name="employeeMapper")
	//	private EmployeeMapper employeeDAO;
	/** ID Generation */
	@Resource(name = "employeeIdGnrService")
	private EgovIdGnrService employeeIdGnrService;
	
	//사용자 등록
	@Override
	public String insertEmployee(EmployeeVO vo) throws Exception {
		
		
		// TODO Auto-generated method stub
		String id = employeeIdGnrService.getNextStringId();
		vo.setEmp_No(id);
		LOGGER.debug(vo.toString());

		employeeDAO.insertEmployee(vo);
		return id;
	}

	//사용자 정보 수정
	@Override
	public void updateEmployee(EmployeeVO vo) throws Exception {
		// TODO Auto-generated method stub
		employeeDAO.updateEmployee(vo);
	}

	//사용자 정보 삭제
	@Override
	public void deleteEmployee(EmployeeVO vo) throws Exception {
		// TODO Auto-generated method stub
		employeeDAO.deleteEmployee(vo);
	}

	//사용자 상세정보
	@Override
	public EmployeeVO selectEmployee(EmployeeVO vo) throws Exception {
		// TODO Auto-generated method stub
		EmployeeVO resultVO = employeeDAO.selectEmployee(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}
	

	//사용자 목록 보기
	@Override
	public List<?> selectEmployeeList(SampleDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return employeeDAO.selectEmployeeList(searchVO);
	}

	//사용자 총 인원(글 총 갯수 구함)
	@Override
	public int selectEmployeeListTotCnt(SampleDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return employeeDAO.selectEmployeeListTotCnt(searchVO);
	}

}

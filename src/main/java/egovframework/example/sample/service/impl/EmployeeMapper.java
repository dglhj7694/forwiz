package egovframework.example.sample.service.impl;

import java.util.List;

import egovframework.example.sample.service.EmployeeVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("employeeMapper")
public interface EmployeeMapper {
	/**
	 * 사용자 정보를 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	void insertEmployee(EmployeeVO vo) throws Exception;

	/**
	 * 사용자 정보를 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void updateEmployee(EmployeeVO vo) throws Exception;

	/**
	 * 사용자 정보를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteEmployee(EmployeeVO vo) throws Exception;

	/**
	 * 사용자 정보를 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	EmployeeVO selectEmployee(EmployeeVO vo) throws Exception;

	/**
	 * 사용자 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectEmployeeList(SampleDefaultVO searchVO) throws Exception;

	/**
	 * 사용자 총 인원을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectEmployeeListTotCnt(SampleDefaultVO searchVO);
}

package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.EmployeeService;
import egovframework.example.sample.service.EmployeeVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EmployeeController {
	/** EgovSampleService */
	@Resource(name = "employeeService")
	private EmployeeService employeeService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 *  목록을 조회한다. (pageing)
	 */
	@RequestMapping(value = "/employeeList.do")
	public String selectEmployeeList(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> employeeList = employeeService.selectEmployeeList(searchVO);
		model.addAttribute("resultList", employeeList);
		System.out.println("employeeList === "+employeeList);

		int totCnt = employeeService.selectEmployeeListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sample/employeeList";
	}
	
	
	
	/**
	 * 글 등록 화면을 조회한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addEmployeePage.do", method = RequestMethod.POST)
	public String addEmployeeView(@ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		model.addAttribute("employeeVO", new EmployeeVO());
		return "sample/employeeRegister";
/*		@RequestMapping(value = "/addEmployee.do", method = RequestMethod.GET)
		public String addEmployeeView(@ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
			model.addAttribute("employeeVO", new EmployeeVO());
			return "sample/employeeRegister";
*/	}

	/**
	 * 글을 등록한다.
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addEmployee.do", method = RequestMethod.POST)
	public String addEmployee(@ModelAttribute("searchVO") SampleDefaultVO searchVO, EmployeeVO employeeVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		// Server-Side Validation
		beanValidator.validate(employeeVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("employeeVO", employeeVO);
			return "sample/EmployeeRegister";
		}

		employeeService.insertEmployee(employeeVO);
		status.setComplete();
		return "forward:/employeeList.do";
	}

	/**
	 * 글 수정화면을 조회한다.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping("/updateEmployeeView.do")
	public String updateEmployeeView(@RequestParam("selectedId") String id, @ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEmp_No(id);
		// 변수명은 CoC 에 따라 sampleVO
		model.addAttribute(selectEmployee(employeeVO, searchVO));
		return "sample/employeeRegister";
	}

	/**
	 * 글을 조회한다.
	 * @param sampleVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("sampleVO") - 조회한 정보
	 * @exception Exception
	 */
	public EmployeeVO selectEmployee(EmployeeVO employeeVO, @ModelAttribute("searchVO") SampleDefaultVO searchVO) throws Exception {
		return employeeService.selectEmployee(employeeVO);
	}

	/**
	 * 글을 수정한다.
	 * @param sampleVO - 수정할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/updateEmployee.do")
	public String updateEmployee(@ModelAttribute("searchVO") SampleDefaultVO searchVO, EmployeeVO employeeVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		beanValidator.validate(employeeVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("employeeVO", employeeVO);
			return "sample/employeeRegister";
		}

		employeeService.updateEmployee(employeeVO);
		System.out.println("error===================");
		System.err.println(employeeVO);
		status.setComplete();
		return "forward:/employeeList.do";
	}

	/**
	 * 글을 삭제한다.
	 * @param sampleVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/deleteEmployee.do")
	public String deleteEmployee(EmployeeVO employeeVO, @ModelAttribute("searchVO") SampleDefaultVO searchVO, SessionStatus status) throws Exception {
		employeeService.deleteEmployee(employeeVO);
		status.setComplete();
		return "forward:/employeeList.do";
	}
	
}

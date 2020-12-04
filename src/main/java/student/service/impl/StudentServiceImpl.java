package student.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import student.dao.StudentDao;
import student.pojo.PageIndexer;
import student.pojo.Student;
import student.service.StudentService;


import java.util.List;

/**
 * Student业务逻辑层接口实现类
 */
@Transactional
@Service("studentService")
public class StudentServiceImpl implements StudentService {
	//依赖注入dao层对象
	@Autowired
	private StudentDao studentDao;


	/**
	 * 添加学生信息
	 *
	 * @param student
	 *            学生实体对象
	 * @return 返回是否添加成功的状态：1成功；0异常失败；-1id重复
	 */
	@Transactional
	public int add(Student student) {
		int state = -1;
		// 判断id是否重复
		if (studentDao.getStudentById(student.getId()) == null) {
			// 添加记录
			boolean flag = studentDao.addStudent(student);
			if (flag) {
				state = 1;
			} else {
				state = 0;
			}
		}

		return state;
	}

	/**
	 * 修改学生信息
	 *
	 * @param student
	 *            学生实体对象
	 * @return 返回是否修改成功的状态：1成功；0异常失败；-1id不存在
	 */
	@Transactional
	public int update(Student student) {
		int state = -1;
		// 判断id是否存在
		if (studentDao.getStudentById(student.getId()) != null) {
			// 修改记录
			boolean flag = studentDao.updateStudent(student);
			if (flag) {
				state = 1;
			} else {
				state = 0;
			}
		}

		return state;
	}


	/**
	 * 删除学生信息
	 *
	 * @param id
	 *            学号
	 * @return 返回是否删除成功的状态：1成功；0异常失败；-1id不存在
	 */
	@Transactional
	public int delete(int id) {
		int state = -1;
		// 判断id是否存在
		if (studentDao.getStudentById(id) != null) {
			// 修改记录
			boolean flag = studentDao.deleteStudent(id);
			if (flag) {
				state = 1;
			} else {
				state = 0;
			}
		}

		return state;
	}

	/**
	 * 查询返回所有学生信息
	 *
	 * @return 返回学生实体对象泛型集合
	 */
	public List<Student> list() {
		List<Student> students=studentDao.getAllStudents();
		return students;
	}

	/**
	 * 根据学号查询学生信息
	 *
	 * @param id
	 *            学号
	 * @return 返回学生实体对象
	 */
	public Student searchById(int id) {
		Student s= studentDao.getStudentById(id);
		return s;
	}

	public String searchSuggest(String keywords) {
		String result = "";
		List<Student> students = studentDao.getStudentsByName(keywords);
		for (Student s : students) {
			result += s.getName() + "-";
		}

		if (result.length() > 0) {
			result = result.substring(0, result.length() - 1);
		}

		return result;
	}

	public List<Student> list(PageIndexer page) {
		List<Student> students= studentDao.getStudentsByPage(page);
		return students;
	}

	public StudentDao getStudentMapper() {
		return studentDao;
	}

	public void setStudentMapper(StudentDao studentMapper) {
		this.studentDao = studentMapper;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public int deleteAndInsert(Student student) {
		studentDao.deleteStudent(student.getId());
		int a=1/0;
		studentDao.addStudent(student);
		return 1;
	}


}

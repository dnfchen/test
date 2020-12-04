package student.dao;



import org.springframework.stereotype.Repository;
import student.pojo.PageIndexer;
import student.pojo.Student;

import java.util.List;

/**
 * Student数据访问层接口
 */

public interface StudentDao {
	/**
	 * 添加学生
	 *
	 * @param student
	 *            学生实体对象
	 * @return 返回是否添加成功
	 */
	boolean addStudent(Student student);

	/**
	 * 修改学生
	 *
	 * @param student
	 *            学生实体对象
	 * @return 返回是否修改成功
	 */
	boolean updateStudent(Student student);

	/**
	 * 删除学生
	 *
	 * @param id
	 *            学号
	 * @return 返回是否删除成功
	 */
	boolean deleteStudent(int id);

	/**
	 * 查询获取所有学生信息
	 *
	 * @return 返回学生实体泛型集合
	 */
	List<Student> getAllStudents();

	/**
	 * 根据学号查询获取学生信息
	 *
	 * @param id
	 *            学号
	 * @return 返回学生实体对象
	 */
	Student getStudentById(int id);

	/**
	 * 通过姓名模糊查询获取学生信息
	 *
	 * @return
	 */
	List<Student> getStudentsByName(String name);

	/**
	 * 分页显示学生信息
	 * @param page 分页实体对象
	 * @return 返回指定页码的学生数据
	 */
	List<Student> getStudentsByPage(PageIndexer page);
}

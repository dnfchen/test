package student.service;



import student.pojo.PageIndexer;
import student.pojo.Student;

import java.util.List;

/**
 * Student业务逻辑层接口
 */
public interface StudentService {
	/**
	 * 添加学生信息
	 * @param student 学生实体对象
	 * @return 返回是否添加成功：1成功；0数据库异常添加失败；-1学号重复添加失败
	 */
	int add(Student student);

	/**
	 * 修改学生信息
	 * @param student 学生实体对象
	 * @return 返回是否修改成功：1成功；0数据库异常修改失败；-1学号不存在修改失败
	 */
	int update(Student student);

	/**
	 * 删除学生信息
	 * @param id 学号
	 * @return 返回是否删除成功：1成功；0数据库异常删除失败；-1学号不存在删除失败
	 */
	int delete(int id);

	/**
	 * 查询获取所有学生信息列表
	 * @return 返回学生实体对象的泛型集合
	 */
	List<Student> list();

	/**
	 * 根据学号查询学生信息
	 * @param id 学号
	 * @return 返回学生实体对象
	 */
	Student searchById(int id);

	/**
	 * 搜索自动提示功能：ajax技术实现
	 * @param keywords 搜索关键字
	 * @return 返回拼接字符串
	 */
	String searchSuggest(String keywords);

	/**
	 * 分页显示学生信息
	 * @param page 分页实体对象
	 * @return 返回指定页码的学生数据
	 */
	List<Student> list(PageIndexer page);

	int deleteAndInsert(Student student);
}

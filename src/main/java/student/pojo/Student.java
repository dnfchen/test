package student.pojo;

import java.io.Serializable;

/**
 * 学生实体类
 */
public class Student implements Serializable {
	private int id;//学号
	private String name;//姓名
	private int sex;//性别
	private double score;//成绩

	public Student(){

	}

	public Student(int id,String name,int sex,double score){
		this.id=id;
		this.name=name;
		this.sex=sex;
		this.score=score;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}
}

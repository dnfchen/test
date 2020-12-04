package student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import student.pojo.PageIndexer;
import student.pojo.Student;
import student.service.StudentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 学生控制层
 */
@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("/list")
    public String list(Model model, @RequestParam(value = "pageIndex",required = false) int pageIndex){
        // 获取分页对象
        PageIndexer pi = new PageIndexer(1, 3, 0);
        pi.setPageIndex(pageIndex);

        //获取所有学生集合
        List<Student> lists = studentService.list(pi);

        //计算总页数
        pi.setPageCount((int) (Math.ceil(studentService.list().size() * 1.0
                / pi.getPageSize())));

        //传回
        model.addAttribute("students", lists);
        model.addAttribute("pi", pi);
        return "liststudentbypage";
    }

    @RequestMapping("/add")
    public String add(Student student, HttpServletRequest request, HttpServletResponse response) throws IOException {

        Student s = new Student(student.getId(),student.getName(),student.getSex(),student.getScore());
        int flag = studentService.add(s);

        //清除消息
        request.getSession().removeAttribute("message");
        if(flag==1){
            return "redirect:list?pageIndex=1";

        }else if(flag==-1){

            request.getSession().setAttribute("message", "id重复，添加失败！");
            return "addstudent";
        }else{
            request.getSession().setAttribute("message", "数据异常，添加失败！");
            return "addstudent";
        }
    }

    @RequestMapping("/search")
    public String search(Model model,@RequestParam(value = "sid",required = false) String sid){
        //获取参数id

        Student student = null;
        if (sid !=null){
            int id = Integer.parseInt(sid);
            //调用业务逻辑层
            student = studentService.searchById(id);
        }
        //保存
        model.addAttribute("student",student);
        return "searchstudent";
    }
    @RequestMapping("/del")
    public String del(@RequestParam(value = "id",required = false) int id){

        int flag = studentService.delete(id);
        if (flag==1){
            return "redirect:list?pageIndex=1";
        }else {
            return "redirect:list?pageIndex=1";
        }
    }

    @RequestMapping("update")
    public String update(Student student){
        Student s = new Student(student.getId(),student.getName(),student.getSex(),student.getScore());

        int flag = studentService.update(s);

        if(flag==1){
            return "redirect:list?pageIndex=1";
        }else{
            return "updatestudent";

        }
    }
    @RequestMapping("/seaUpdate")
    public String seaUpdate(Model model,@RequestParam(value = "id",required = false) int id){

        Student student =  studentService.searchById(id);

        model.addAttribute("s",student);
        return "updatestudent";
    }
}

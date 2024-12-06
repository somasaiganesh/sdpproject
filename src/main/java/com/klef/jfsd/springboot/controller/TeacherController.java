package com.klef.jfsd.springboot.controller;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Marks;
import com.klef.jfsd.springboot.model.Reports;
import com.klef.jfsd.springboot.model.Student;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Teacher;


import com.klef.jfsd.springboot.service.StudentService;
import com.klef.jfsd.springboot.service.TeacherService;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class TeacherController {
  
  @Autowired
  private TeacherService teacherService;
 
  @Autowired
  private StudentService studentService;
  


  
  
  
  @GetMapping("/")
  public ModelAndView home()
  {
    ModelAndView mv=new ModelAndView("index");
    return mv;
  }
  
  @GetMapping("teacherhome")
  public ModelAndView teacherhome()
  {
    ModelAndView mv=new ModelAndView("teacher-dashboard");
    return mv;
  }
  
  @GetMapping("teacherlogin")
	public ModelAndView teacherlogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("teacherlogin");
		return mv;
	}
	@GetMapping("logout")
	public String teacherLogout(HttpServletRequest request) {
		// Invalidate the session
		request.getSession().invalidate();

		// Redirect to the login page
		return "redirect:/teacherlogin";
	}

	
	@PostMapping("checkteacherlogin")
	public ModelAndView checkteacherlogin(HttpServletRequest request) {
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");

		Teacher a = teacherService.checkteacherlogin(uname, pwd);
		ModelAndView mv = new ModelAndView();
		if (a != null) {

			request.getSession().setAttribute("user", a);

			mv.setViewName("teacher-dashboard");

		} else {
			mv.setViewName("teacherlogin");
			mv.addObject("message", "Login Failed");
		}
		return mv;
	}
	
	@GetMapping("viewstudents")
	public ModelAndView viewstudents()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("viewstudents");
		long count=teacherService.studentcount();
	    mv.addObject("count", count);
		List<com.klef.jfsd.springboot.model.Student> students= teacherService.ViewStudents(); 
		mv.addObject("studentlist",students);  
		return mv;
	}
	
	
	@GetMapping("/addstudent")
    public String showAddStudentForm(Model model) {
        model.addAttribute("student", new Student());
        return "addstudent"; // Return the view name (HTML page for the form)
    }

    // Method to handle the form submission and add a student
    @PostMapping("/addstudent")
    public String addStudent(@ModelAttribute("student") Student student, Model model) {
        String resultMessage = studentService.addStudent(student); // Call the service to add student
        model.addAttribute("resultMessage", resultMessage); // Pass the result message to the view
        return "studentstatus"; // Redirect or return a view that shows the result message
    }
	    @GetMapping("deletestudent")
		public ModelAndView deletestudent()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("deletestudent");
			
			List<Student> students=teacherService.ViewStudents();
			mv.addObject("studentlist",students);
			return mv;
		}
	    @GetMapping("delete")
		public String delete(@RequestParam int id)
		{
			teacherService.deleteStudent(id);
			return "redirect:/deletestudent";
		}
	    @GetMapping("viewstudentbyid")
		public ModelAndView viewstudentbyid()
		{	
			ModelAndView mv=new ModelAndView();
			
			List<Student> students=teacherService.ViewStudents();
			mv.addObject("studentlist",students);
			
			mv.setViewName("viewstudentbyid");
			return mv;
		}
		@PostMapping("displaystudent")
		public ModelAndView displaystudents(HttpServletRequest request)
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			Student student=teacherService.displayStudentByID(id);
			
			ModelAndView mv=new ModelAndView("displaystudent");
			mv.addObject("s",student);
			
			return mv;
		}
		@GetMapping("/viewstudentreports")
		public String viewStudentReports(@RequestParam Integer studentId, Model model) {
		    Student student = studentService.getStudentWithReports(studentId);  // Assuming this method fetches the student with reports
		    model.addAttribute("student", student);
		    return "viewstudentreports";  // JSP name
		}
		@GetMapping("/addstudentreports")
		  public String addstudentreports() {
		      return "addreport"; // The JSP file name (without .jsp)
		  }

		 
		 @PostMapping("insertreport")
		  public ModelAndView insertreport(HttpServletRequest request)
		  {
		   String name = request.getParameter("s");
		   String gender = request.getParameter("sgender");
		   String dob = request.getParameter("sdob");
		   String email = request.getParameter("semail");
		   String password = request.getParameter("spwd");
		   String contact = request.getParameter("scontact");
		   String status = "Registered";
		   String gradeLevel = request.getParameter("sgradelevel");
		   
		     Student student = new Student();
		     student.setName(name);
		     student.setGender(gender);
		     student.setDateOfBirth(dob);
		     student.setEmail(email);
		     student.setPassword(password);
		     student.setContact(contact);
		     student.setStatus(status);
		     student.setGradeLevel(gradeLevel);
		     String msg = studentService.studentRegistraion(student);
		     if (gradeLevel == null || gradeLevel.isEmpty()) {
		         gradeLevel = "Grade 1"; // Default value
		     }
		     student.setGradeLevel(gradeLevel);


		     ModelAndView mv = new ModelAndView("studentlogin");
		     mv.addObject("message", msg);
		   
		     return mv;

		  }
		

		

}
package com.klef.jfsd.springboot.controller;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Marks;
import com.klef.jfsd.springboot.model.Recommendations;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Teacher;

import com.klef.jfsd.springboot.service.ReportsService;
import com.klef.jfsd.springboot.service.CourseService;
import com.klef.jfsd.springboot.service.MarksService;
import com.klef.jfsd.springboot.service.RecommendationsService;
import com.klef.jfsd.springboot.service.StudentService;
import com.klef.jfsd.springboot.service.TeacherService;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class TeacherController {
  
  @Autowired
  private TeacherService teacherService;
 
  @Autowired
  private StudentService studentService;
  
  @Autowired
  private CourseService courseService;
  
  @Autowired
  private MarksService marksService;
  
  @Autowired
  private ReportsService reportsService;
  
  @Autowired
  private RecommendationsService recommendationsService;


  
  
  
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
//		@GetMapping("/viewstudentreports")
//		public String viewStudentReports(@RequestParam Integer studentId, Model model) {
//		    Student student = studentService.getStudentWithReports(studentId);  // Assuming this method fetches the student with reports
//		    model.addAttribute("student", student);
//		    return "viewstudentreports";  // JSP name
//		}
//		@GetMapping("/addstudentreports")
//		  public String addstudentreports() {
//		      return "addreport"; // The JSP file name (without .jsp)
//		  }
//
//		 
//		 @PostMapping("insertreport")
//		  public ModelAndView insertreport(HttpServletRequest request)
//		  {
//		   String name = request.getParameter("s");
//		   String gender = request.getParameter("sgender");
//		   String dob = request.getParameter("sdob");
//		   String email = request.getParameter("semail");
//		   String password = request.getParameter("spwd");
//		   String contact = request.getParameter("scontact");
//		   String status = "Registered";
//		   String gradeLevel = request.getParameter("sgradelevel");
//		   
//		     Student student = new Student();
//		     student.setName(name);
//		     student.setGender(gender);
//		     student.setDateOfBirth(dob);
//		     student.setEmail(email);
//		     student.setPassword(password);
//		     student.setContact(contact);
//		     student.setStatus(status);
//		     student.setGradeLevel(gradeLevel);
//		     String msg = studentService.studentRegistraion(student);
//		     if (gradeLevel == null || gradeLevel.isEmpty()) {
//		         gradeLevel = "Grade 1"; // Default value
//		     }
//		     student.setGradeLevel(gradeLevel);
//
//
//		     ModelAndView mv = new ModelAndView("studentlogin");
//		     mv.addObject("message", msg);
//		   
//		     return mv;
//
//		  }
		 @GetMapping("/addreport")
		    public ModelAndView showAddReportForm() {
		        ModelAndView modelAndView = new ModelAndView("addreports");

		        // Fetch all students, courses, and marks for dropdowns
		        List<Student> students=studentService.getAllStudents();
		        List<Course> courses = courseService.getAllCourses();
		        List<Marks> marks = marksService.getAllMarks();

		        // Add attributes to the ModelAndView object
		        modelAndView.addObject("students", students);
		        modelAndView.addObject("courses", courses);
		        modelAndView.addObject("marks", marks);

		        return modelAndView;
		    }

		    /**
		     * Handles the submission of the add report form using ModelAndView.
		     */
		 @PostMapping("/addreport")
		 public ModelAndView addReport(
		         @RequestParam("studentId") int studentId,
		         @RequestParam("courseId") int courseId,
		         @RequestParam("marksId") int marksId,
		         @RequestParam("remarks") String remarks,
		         @RequestParam("teacherRemarks") String teacherRemarks
		 ) {
		     ModelAndView modelAndView = new ModelAndView("addreports");

		     try {
		         // Fetch related entities
		         Student student = studentService.getStudentById(studentId);
		         Course course = courseService.getCourseById(courseId);
		         Marks marks = marksService.getMarksById(marksId);

		         // Create a new report
		         Reports report = new Reports(student, course, marks, remarks, teacherRemarks);

		         // Save the report
		         Reports savedReport = reportsService.addReport(report);  // This will save the report and return the saved object

		         modelAndView.addObject("message", "Report added successfully!");
		     } catch (Exception e) {
		         modelAndView.addObject("message", "Failed to add the report. Please try again.");
		         e.printStackTrace();
		     }

		     // Fetch updated lists for the form
		     List<Student> students = studentService.getAllStudents();
		     List<Course> courses = courseService.getAllCourses();
		     List<Marks> marksList = marksService.getAllMarks();

		     modelAndView.addObject("students", students);
		     modelAndView.addObject("courses", courses);
		     modelAndView.addObject("marks", marksList);

		     return modelAndView;
		 }
		 @GetMapping("/viewstudentreports")
		 public ModelAndView viewStudentReports() {
		     List<Reports> reports = reportsService.getAllReports(); // Fetch all reports from the service

		     // Create a ModelAndView object
		     ModelAndView mav = new ModelAndView("viewstudentreports"); // Specify the view name
		     mav.addObject("reports", reports); // Add the reports list to the model

		     return mav; // Return the ModelAndView object
		 }
		 @GetMapping("/addmarks")
		    public ModelAndView showAddMarksForm() {
		        ModelAndView modelAndView = new ModelAndView("addmarks");

		        // Retrieve the list of students and courses from the services
		        modelAndView.addObject("students", studentService.getAllStudents()); // List of all students
		        modelAndView.addObject("courses", courseService.getAllCourses()); // List of all courses
		        
		        return modelAndView;
		    }

		    // Method to handle form submission and save marks
		    @PostMapping("/addmarks")
		    public ModelAndView addMarks(@RequestParam int studentId, @RequestParam int courseId,
		                                 @RequestParam Double marksObtained, @RequestParam Double totalMarks,
		                                 @RequestParam String remarks) {
		        ModelAndView modelAndView = new ModelAndView("addmarks");

		        // Logic to save the marks
		        Marks marks = new Marks();
		        Student student = studentService.getStudentById(studentId); // Get student by ID
		        Course course = courseService.getCourseById(courseId); // Get course by ID
		        marks.setStudent(student);
		        marks.setCourse(course);
		        marks.setMarksObtained(marksObtained);
		        marks.setTotalMarks(totalMarks);
		        marks.setRemarks(remarks);
		        
		        marksService.saveMarks(marks); // Save marks data

		        // Adding the success message and other model objects
		        modelAndView.addObject("message", "Marks added successfully!");
		        modelAndView.addObject("students", studentService.getAllStudents()); // Re-fetch students list
		        modelAndView.addObject("courses", courseService.getAllCourses()); // Re-fetch courses list

		        return modelAndView;
		    }
		    @GetMapping("/addrecommendation")
		    public ModelAndView showAddRecommendationPage() {
		        ModelAndView modelAndView = new ModelAndView("addrecommendation"); // View name
		        List<Student> students = studentService.getAllStudents();
		        modelAndView.addObject("students", students);
		        return modelAndView;
		    }

		    // POST method to handle form submission and add a recommendation
		    @PostMapping("/addrecommendation")
		    public ModelAndView addRecommendation(@RequestParam int studentId, 
		                                          @RequestParam String courseTitle,
		                                          @RequestParam String recommendationText) {
		        ModelAndView modelAndView = new ModelAndView("addrecommendation"); // View name

		        // Fetch the student by ID
		        Student student = studentService.getStudentById(studentId);

		        // Create new Recommendation object
		        Recommendations recommendation = new Recommendations();
		        recommendation.setStudent(student);
		        recommendation.setCourseTitle(courseTitle);
		        recommendation.setRecommendationText(recommendationText);

		        // Save the recommendation
		        recommendationsService.saveRecommendation(recommendation);

		        // Add a success message to be displayed on the page
		        modelAndView.addObject("message", "Recommendation added successfully!");

		        // Re-fetch the list of students (if needed)
		        modelAndView.addObject("students", studentService.getAllStudents());

		        return modelAndView;  // Return the ModelAndView object with the updated data
		    }

 

		

}
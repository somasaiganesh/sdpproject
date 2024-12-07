package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Marks;
import com.klef.jfsd.springboot.model.Recommendations;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.MarksService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
  
  @Autowired
  private StudentService studentService;
  @Autowired
  private MarksService marksService;
  
  // Display student dashboard with dynamic name
  @GetMapping("/studenthome")
  public ModelAndView studentHome(HttpSession session) {
      ModelAndView mv = new ModelAndView("student-dashboard");

      // Retrieve the logged-in student's information from the session
      Integer studentId = (Integer) session.getAttribute("studentId");
      if (studentId == null) {
          mv.setViewName("studentlogin");
          mv.addObject("message", "Session expired. Please log in again.");
          return mv;
      }

      Student student = studentService.findStudentById(studentId);
      if (student != null) {
          mv.addObject("student", student);
      } else {
          mv.setViewName("errorPage");
          mv.addObject("errorMessage", "Student not found.");
      }

      return mv;
  }

  @GetMapping("/studentregister")
  public String showStudentRegisterPage() {
      return "student-registration-form";
  }

  @PostMapping("/insertstudent")
  public ModelAndView insertStudent(HttpServletRequest request) {
      // Retrieve form inputs
      String name = request.getParameter("sname");
      String gender = request.getParameter("sgender");
      String dob = request.getParameter("sdob");
      String email = request.getParameter("semail");
      String password = request.getParameter("spwd");
      String contact = request.getParameter("scontact");
      String gradeLevel = request.getParameter("sgradelevel");
      if (gradeLevel == null || gradeLevel.isEmpty()) {
          gradeLevel = "Grade 1"; // Default value
      }

      // Create and populate student object
      Student student = new Student();
      student.setName(name);
      student.setGender(gender);
      student.setDateOfBirth(dob);
      student.setEmail(email);
      student.setPassword(password);
      student.setContact(contact);
      student.setStatus("Registered");
      student.setGradeLevel(gradeLevel);

      String msg = studentService.studentRegistraion(student);

      ModelAndView mv = new ModelAndView("studentlogin");
      mv.addObject("message", msg);
      return mv;
  }

  @GetMapping("/studentlogin")
  public ModelAndView studentLogin() {
      return new ModelAndView("studentlogin");
  }

  @PostMapping("/checkStudentLogin")
  public ModelAndView checkStudentLogin(HttpServletRequest request, HttpSession session) {
      String email = request.getParameter("email");
      String password = request.getParameter("password");

      Student student = studentService.checkstudentlogin(email, password);

      if (student != null) {
          session.setAttribute("studentId", student.getId());
          return new ModelAndView("redirect:/studenthome");
      } else {
          ModelAndView mv = new ModelAndView("studentloginfail");
          mv.addObject("message", "Login Failed! Please try again.");
          return mv;
      }
  }

  @GetMapping("/viewStudentDetails")
  public ModelAndView viewStudentDetails(HttpServletRequest request) {
      String email = request.getParameter("email");
      Student student = studentService.findByEmail(email);
      ModelAndView mv = new ModelAndView("student-details");
      if (student != null) {
          mv.addObject("student", student);
      } else {
          mv.addObject("message", "No student found with the given email.");
      }
      return mv;
  }

  @GetMapping("/studentProfile")
  public ModelAndView showStudentProfile(HttpSession session) {
      Integer studentId = (Integer) session.getAttribute("studentId");

      if (studentId == null) {
          return new ModelAndView("studentlogin").addObject("message", "Session expired. Please log in again.");
      }

      Student student = studentService.findStudentById(studentId);
      if (student != null) {
          return new ModelAndView("studentProfile").addObject("student", student);
      } else {
          return new ModelAndView("errorPage").addObject("errorMessage", "Student profile not found.");
      }
  }

  @GetMapping("/updateprofile")
  public ModelAndView showUpdateProfilePage(HttpSession session) {
      Integer studentId = (Integer) session.getAttribute("studentId");

      ModelAndView mv = new ModelAndView("updateprofile");
      if (studentId != null) {
          Student student = studentService.findStudentById(studentId);
          mv.addObject("student", student);
      } else {
          mv.addObject("errorMessage", "Session expired. Please log in again.");
      }
      return mv;
  }

  @PostMapping("/update")
  public ModelAndView updateStudentProfile(HttpServletRequest request, HttpSession session) {
      Integer studentId = (Integer) session.getAttribute("studentId");

      if (studentId == null) {
          return new ModelAndView("studentlogin").addObject("message", "Session expired. Please log in again.");
      }

      // Retrieve form data
      String name = request.getParameter("sname");
      String gender = request.getParameter("sgender");
      String dob = request.getParameter("sdob");
      String email = request.getParameter("semail");
      String contact = request.getParameter("scontact");
      String password = request.getParameter("spwd");
      String gradeLevel = request.getParameter("sgradelevel");

      Student student = studentService.findStudentById(studentId);

      if (student != null) {
          student.setName(name);
          student.setGender(gender);
          student.setDateOfBirth(dob);
          student.setEmail(email);
          student.setContact(contact);
          student.setPassword(password);
          student.setGradeLevel(gradeLevel);

          studentService.updateStudent(student);
          return new ModelAndView("studentProfile").addObject("student", student)
                  .addObject("message", "Profile updated successfully!");
      } else {
          return new ModelAndView("errorPage").addObject("errorMessage", "Student not found.");
      }
  }
  @GetMapping("/viewrecommendations")
  public ModelAndView viewRecommendations(HttpSession session) {
      Integer studentId = (Integer) session.getAttribute("studentId");

      if (studentId == null) {
          return new ModelAndView("studentlogin").addObject("message", "Session expired. Please log in again.");
      }

      // Fetch student data
      Student student = studentService.findStudentById(studentId);
      if (student == null) {
          return new ModelAndView("errorPage").addObject("errorMessage", "Student not found.");
      }

      // Fetch recommendations from the database
      List<Recommendations> recommendations = studentService.getRecommendationsByStudent(student);

      // Pass data to the view
      ModelAndView mv = new ModelAndView("viewrecommendations");
      mv.addObject("student", student);
      mv.addObject("recommendations", recommendations);
      return mv;
  }
  @GetMapping("/student/{studentId}/marks")
  public ModelAndView viewMarks(@PathVariable int studentId) {
      // Fetch all marks for the student from the service
      List<Marks> marksList = marksService.getMarksByStudentId(studentId);

      // Create ModelAndView object and set the model and view name
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("viewmarks"); // The name of the JSP file
      modelAndView.addObject("marksList", marksList); // Add marks data to the model

      return modelAndView;
  }
}
package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "student_table")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sid")
    private int id;

    @Column(name = "sname", length = 50, nullable = false)
    private String name;

    @Column(name = "sgender", length = 20, nullable = false)
    private String gender;

    @Column(name = "sdob", length = 20, nullable = false)
    private String dateOfBirth;

    @Column(name = "semail", length = 50, nullable = false, unique = true)
    private String email;

    @Column(name = "spwd", length = 50, nullable = false)
    private String password;

    @Column(name = "scontact", length = 50, nullable = false, unique = true)
    private String contact;

    @Column(name = "sstatus", nullable = false, length = 50)
    private String status;

    @Column(name = "sgrade_level", nullable = false) // Stores the student's grade level
    private String gradeLevel;

    // Relationship with Marks
    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Marks> markslist;

    // Relationship with Reports
    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Reports> percentage;

    // Relationship with Recommendations
    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Recommendations> recommendationText;

    // Profile image of the student
    private Blob profileImage;

    // Default constructor
    public Student() {}

    // Parameterized constructor
    public Student(String name, String gender, String dateOfBirth, String email, String password, String contact, String status, String gradeLevel) {
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.status = status;
        this.gradeLevel = gradeLevel;
    }

    // Getters and Setters
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGradeLevel() {
        return gradeLevel;
    }

    public void setGradeLevel(String gradeLevel) {
        this.gradeLevel = gradeLevel;
    }

   public List<Marks> getMarks() {
       return markslist;
    }

    public void setMarks(List<Marks> markslist) {
        this.markslist = markslist;
    }

    public List<Reports> getReports() {
        return percentage;
    }

    public void setReports(List<Reports> percentage) {
        this.percentage = percentage;
    }

    public List<Recommendations> getRecommendations() {
        return recommendationText;
    }

    public void setRecommendations(List<Recommendations> recommendationText) {
        this.recommendationText = recommendationText;
    }

    public Blob getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(Blob profileImage) {
        this.profileImage = profileImage;
    }

    @Override
    public String toString() {
        return "Student [id=" + id + ", name=" + name + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth
                + ", email=" + email + ", password=" + password + ", contact=" + contact + ", status=" + status
                + ", gradeLevel=" + gradeLevel + ", profileImage=" + profileImage + "]";
    }
}

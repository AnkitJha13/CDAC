
############################# using ArrayList (Que-1) #########################################



package EmpUsingArrayList;

class Employee {
    int id;
    String name;
    String designation;
    double salary;
    int experience;

    public Employee(int id, String name, String designation, double salary, int experience) {
        this.id = id;
        this.name = name;
        this.designation = designation;
        this.salary = salary;
        this.experience = experience;
    }

    @Override
    public String toString() {
        return "ID: " + id + ", Name: " + name + ", Designation: " + designation + ", Salary: " + salary + ", Experience: " + experience;
    }
}







package EmpUsingArrayList;

import java.util.ArrayList;
import java.util.Scanner;

public class EmployeeManagementSystem {
    ArrayList<Employee> employees = new ArrayList<>();
    Scanner scanner = new Scanner(System.in);


    public void addEmployee() {
        System.out.print("Enter ID: ");
        int id = scanner.nextInt();
        scanner.nextLine(); // consume newline
        System.out.print("Enter Name: ");
        String name = scanner.nextLine();
        System.out.print("Enter Designation: ");
        String designation = scanner.nextLine();
        System.out.print("Enter Salary: ");
        double salary = scanner.nextDouble();
        System.out.print("Enter Experience (in years): ");
        int experience = scanner.nextInt();

        employees.add(new Employee(id, name, designation, salary, experience));
        System.out.println("Employee added successfully.");
    }

    // Update an employee by ID
    public void updateEmployee() {
        System.out.print("Enter Employee ID to update: ");
        int id = scanner.nextInt();
        scanner.nextLine(); // consume newline
        for (Employee emp : employees) {
            if (emp.id == id) {
                System.out.print("Enter new Name: ");
                emp.name = scanner.nextLine();
                System.out.print("Enter new Designation: ");
                emp.designation = scanner.nextLine();
                System.out.print("Enter new Salary: ");
                emp.salary = scanner.nextDouble();
                System.out.print("Enter new Experience: ");
                emp.experience = scanner.nextInt();
                System.out.println("Employee updated successfully.");
                return;
            }
        }
        System.out.println("Employee with ID " + id + " not found.");
    }

    // Delete an employee by ID
    public void deleteEmployee() {
        System.out.print("Enter Employee ID to delete: ");
        int id = scanner.nextInt();
        employees.removeIf(empl -> empl.id == id);
        System.out.println("Employee deleted successfully.");
    }

    // Display all employees
    public void displayAllEmployees() {
        if (employees.isEmpty()) {
            System.out.println("No employees found.");
        } else {
            for (Employee emp : employees) {
                System.out.println(emp);
            }
        }
    }

    // Display employees eligible for promotion (experience >= 5)
    public void displayEligibleForPromotion() {
        boolean found = false;
        for (Employee emp : employees) {
            if (emp.experience >= 5) {
                System.out.println(emp);
                found = true;
            }
        }
        if (!found) {
            System.out.println("No employees are eligible for promotion.");
        }
    }


    public void showMenu() {
        while (true) {
            System.out.println("\nEmployee Management System");
            System.out.println("1. Add Employee");
            System.out.println("2. Update Employee");
            System.out.println("3. Delete Employee");
            System.out.println("4. Display All Employees");
            System.out.println("5. Display Eligible for Promotion");
            System.out.println("6. Exit");
            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    addEmployee();
                    break;
                case 2:
                    updateEmployee();
                    break;
                case 3:
                    deleteEmployee();
                    break;
                case 4:
                    displayAllEmployees();
                    break;
                case 5:
                    displayEligibleForPromotion();
                    break;
                case 6:
                    System.out.println("Exiting...");
                    return;
                default:
                    System.out.println("Invalid option! Please try again.");
            }
        }
    }

    public static void main(String[] args) {
        EmployeeManagementSystem system = new EmployeeManagementSystem();
        system.showMenu();
    }
}






##################################################################################################

##########################  using HashMap (Que-2) ########################################################


package StudentUsingMap;

class Student {
    Integer id;
    String name;
    String course;
    Double marks;

    // Constructor
    public Student(Integer id, String name, String course, Double marks) {
        this.id = id;
        this.name = name;
        this.course = course;
        this.marks = marks;
    }

    // toString method for easy display
    @Override
    public String toString() {
        return "ID: " + id + ", Name: " + name + ", Course: " + course + ", Marks: " + marks;
    }
}




package StudentUsingMap;

import java.util.HashMap;
import java.util.Scanner;

public class StudentManagementSystem {

    HashMap<Integer, Student> studentMap = new HashMap<>();
    Scanner scanner = new Scanner(System.in);


    // Add a new student
    public void addStudent() {
        System.out.print("Enter Student ID: ");
        Integer id = scanner.nextInt();
        scanner.nextLine(); // consume newline
        System.out.print("Enter Student Name: ");
        String name = scanner.nextLine();
        System.out.print("Enter Course: ");
        String course = scanner.nextLine();
        System.out.print("Enter Marks: ");
        Double marks = scanner.nextDouble();

        // Create new Student object and add to HashMap
        Student student = new Student(id, name, course, marks);
        studentMap.put(id, student);
        System.out.println("Student added successfully.");
    }

    // Update a student's details by ID
    public void updateStudent() {
        System.out.print("Enter Student ID to update: ");
        Integer id = scanner.nextInt();
        scanner.nextLine(); // consume newline

        if (studentMap.containsKey(id)) {
            Student student = studentMap.get(id);
            System.out.print("Enter new Name: ");
            student.name = scanner.nextLine();
            System.out.print("Enter new Course: ");
            student.course = scanner.nextLine();
            System.out.print("Enter new Marks: ");
            student.marks = scanner.nextDouble();
            System.out.println("Student details updated successfully.");
        } else {
            System.out.println("Student with ID " + id + " not found.");
        }
    }

    // Delete a student by ID
    public void deleteStudent() {
        System.out.print("Enter Student ID to delete: ");
        Integer id = scanner.nextInt();

        if (studentMap.remove(id) != null) {
            System.out.println("Student removed successfully.");
        } else {
            System.out.println("Student with ID " + id + " not found.");
        }
    }

    // Search for a student by ID
    public void searchStudent() {
        System.out.print("Enter Student ID to search: ");
        Integer id = scanner.nextInt();

        Student student = studentMap.get(id);
        if (student != null) {
            System.out.println(student);
        } else {
            System.out.println("Student with ID " + id + " not found.");
        }
    }

    // Display all students
    public void displayAllStudents() {
        if (studentMap.isEmpty()) {
            System.out.println("No students found.");
        } else {
            for (Student student : studentMap.values()) {
                System.out.println(student);
            }
        }
    }

    // Display students eligible for scholarship (marks >= 85)
    public void getScholarshipEligibleStudents() {
        boolean found = false;
        for (Student student : studentMap.values()) {
            if (student.marks >= 85) {
                System.out.println(student);
                found = true;
            }
        }
        if (!found) {
            System.out.println("No students are eligible for scholarship.");
        }
    }

    // Show menu and handle user input
    public void showMenu() {
        while (true) {
            System.out.println("\nStudent Management System");
            System.out.println("1. Add Student");
            System.out.println("2. Update Student");
            System.out.println("3. Delete Student");
            System.out.println("4. Search Student");
            System.out.println("5. Display All Students");
            System.out.println("6. Display Scholarship Eligible Students");
            System.out.println("7. Exit");
            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    addStudent();
                    break;
                case 2:
                    updateStudent();
                    break;
                case 3:
                    deleteStudent();
                    break;
                case 4:
                    searchStudent();
                    break;
                case 5:
                    displayAllStudents();
                    break;
                case 6:
                    getScholarshipEligibleStudents();
                    break;
                case 7:
                    System.out.println("Exiting...");
                    return;
                default:
                    System.out.println("Invalid option! Please try again.");
            }
        }
    }

    // Main method to start the program
    public static void main(String[] args) {
        StudentManagementSystem system = new StudentManagementSystem();
        system.showMenu();
    }
}






##########################################################################################################

####################################### using File-Handling (Que-3) #############################################


package EmpDataUsingFileHandling;

import java.io.Serializable;

public class Employee {
    int id;
    String name;
    String designation;
    double salary;
    int experience;

    public Employee(int id, String name, String designation, double salary, int experience) {
        this.id = id;
        this.name = name;
        this.designation = designation;
        this.salary = salary;
        this.experience = experience;
    }

    public String toString() {
        return id + " " + name + " " + designation + " " + salary + " " + experience;
    }
}






package EmpDataUsingFileHandling;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class EmployeeManagementSystem {

    static final String FILE_NAME = "employees.txt";

    // Add Employee
    public static void addEmployee(Employee emp) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME, true))) {
            writer.write(emp.toString());
            writer.newLine();
            System.out.println("Employee added successfully.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Update Employee
    public static void updateEmployee(int id, String name, String role, double salary, int experience) {
        List<Employee> employeeList = getAllEmployees();
        boolean found = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME))) {
            for (Employee emp : employeeList) {
                if (emp.id == id) {
                    emp.name = name;
                    emp.designation = role;
                    emp.salary = salary;
                    emp.experience = experience;
                    found = true;
                }
                writer.write(emp.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (found) {
            System.out.println("Employee updated successfully.");
        } else {
            System.out.println("Employee not found.");
        }
    }

    // Delete Employee
    public static void deleteEmployee(int id) {
        List<Employee> employeeList = getAllEmployees();
        boolean removed = employeeList.removeIf(emp -> emp.id == id);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME))) {
            for (Employee emp : employeeList) {
                writer.write(emp.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (removed) {
            System.out.println("Employee deleted successfully.");
        } else {
            System.out.println("Employee not found.");
        }
    }

    // Search Employee
    public static void searchEmployee(int id) {
        List<Employee> employeeList = getAllEmployees();
        for (Employee emp : employeeList) {
            if (emp.id == id) {
                System.out.println(emp);
                return;
            }
        }
        System.out.println("Employee not found.");
    }

    // Display All Employees
    public static void displayAllEmployees() {
        List<Employee> employeeList = getAllEmployees();
        if (employeeList.isEmpty()) {
            System.out.println("No employee records found.");
            return;
        }
        for (Employee emp : employeeList) {
            System.out.println(emp);
        }
    }

    // Get Promotion Eligible Employees
    public static void getPromotionEligibleEmployees() {
        List<Employee> employeeList = getAllEmployees();
        System.out.println("Promotion Eligible Employees:");
        for (Employee emp : employeeList) {
            if (emp.experience >= 5) {
                System.out.println(emp);
            }
        }
    }

    // Read All Employees from File
    public static List<Employee> getAllEmployees() {
        List<Employee> employeeList = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(" ");
                int id = Integer.parseInt(data[0]);
                String name = data[1];
                String role = data[2];
                double salary = Double.parseDouble(data[3]);
                int experience = Integer.parseInt(data[4]);
                employeeList.add(new Employee(id, name, role, salary, experience));
            }
        } catch (FileNotFoundException e) {
            // File not created yet — no action needed
        } catch (IOException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    // Main Method
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("\nEmployee Management System");
            System.out.println("1. Add Employee");
            System.out.println("2. Update Employee");
            System.out.println("3. Delete Employee");
            System.out.println("4. Search Employee");
            System.out.println("5. Display All Employees");
            System.out.println("6. Promotion Eligible Employees");
            System.out.println("7. Exit");
            System.out.print("Enter your choice: ");
            int choice = sc.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Enter ID: ");
                    int id = sc.nextInt();
                    sc.nextLine(); // clear buffer
                    System.out.print("Enter Name: ");
                    String name = sc.nextLine();
                    System.out.print("Enter Role: ");
                    String role = sc.nextLine();
                    System.out.print("Enter Salary: ");
                    double salary = sc.nextDouble();
                    System.out.print("Enter Experience: ");
                    int experience = sc.nextInt();
                    addEmployee(new Employee(id, name, role, salary, experience));
                    break;
                case 2:
                    System.out.print("Enter ID to update: ");
                    int updateId = sc.nextInt();
                    sc.nextLine(); // clear buffer
                    System.out.print("Enter New Name: ");
                    String newName = sc.nextLine();
                    System.out.print("Enter New Role: ");
                    String newRole = sc.nextLine();
                    System.out.print("Enter New Salary: ");
                    double newSalary = sc.nextDouble();
                    System.out.print("Enter New Experience: ");
                    int newExperience = sc.nextInt();
                    updateEmployee(updateId, newName, newRole, newSalary, newExperience);
                    break;
                case 3:
                    System.out.print("Enter ID to delete: ");
                    int deleteId = sc.nextInt();
                    deleteEmployee(deleteId);
                    break;
                case 4:
                    System.out.print("Enter ID to search: ");
                    int searchId = sc.nextInt();
                    searchEmployee(searchId);
                    break;
                case 5:
                    displayAllEmployees();
                    break;
                case 6:
                    getPromotionEligibleEmployees();
                    break;
                case 7:
                    System.out.println("Exiting...");
                    sc.close();
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid choice. Try again.");
            }
        }
    }
}





#################################################################################################

################################# Que 4 (using interface and abstract methods) ####################

package usingAbstractEmpData;

public interface BonusEligibility {
    boolean isEligibleForBonus();
}






package usingAbstractEmpData;

public abstract class Employee {
    public Integer empId;
    public String name;
    public String designation;
    public Double salary;

    // Constructor to initialize Employee attributes
    public Employee(Integer empId, String name, String designation, Double salary) {
        this.empId = empId;
        this.name = name;
        this.designation = designation;
        this.salary = salary;
    }

    // Abstract method to calculate salary
    public abstract void calculateSalary();

    // Getters for Employee attributes
    public Integer getEmpId() {
        return empId;
    }

    public String getName() {
        return name;
    }

    public String getDesignation() {
        return designation;
    }

    public Double getSalary() {
        return salary;
    }

    // Default implementation of isEligibleForBonus (can be overridden by subclasses)
    public boolean isEligibleForBonus() {
        return this.salary > 50000;
    }
}







package usingAbstractEmpData;

public class ContractEmployee extends Employee implements BonusEligibility {
    public Double hourlyRate;
    public Integer hoursWorked;

    // Constructor to initialize ContractEmployee
    public ContractEmployee(Integer empId, String name, String designation, Double hourlyRate, Integer hoursWorked) {
        super(empId, name, designation, 0.0);  // Salary starts at 0 for contract employees
        this.hourlyRate = hourlyRate;
        this.hoursWorked = hoursWorked;
    }

    // Implementing the abstract method from Employee class
    @Override
    public void calculateSalary() {
        this.salary = this.hourlyRate * this.hoursWorked;  // Calculate salary based on hourly rate and hours worked
    }

    // Implementing the isEligibleForBonus method from BonusEligibility interface
    @Override
    public boolean isEligibleForBonus() {
        return this.salary > 50000;
    }

    // Getters for hourly rate and hours worked
    public Double getHourlyRate() {
        return hourlyRate;
    }

    public Integer getHoursWorked() {
        return hoursWorked;
    }
}






package usingAbstractEmpData;

public class PermanentEmployee extends Employee implements BonusEligibility {
    public Double medicalAllowance;

    // Constructor to initialize PermanentEmployee
    public PermanentEmployee(Integer empId, String name, String designation, Double salary, Double medicalAllowance) {
        super(empId, name, designation, salary);
        this.medicalAllowance = medicalAllowance;
    }

    // Implementing the abstract method from Employee class
    @Override
    public void calculateSalary() {
        this.salary += this.medicalAllowance;  // Add medical allowance to salary
    }

    // Implementing the isEligibleForBonus method from BonusEligibility interface
    @Override
    public boolean isEligibleForBonus() {
        return this.salary > 50000;
    }

    // Getter for medical allowance
    public Double getMedicalAllowance() {
        return medicalAllowance;
    }
}






package usingAbstractEmpData;

import java.util.ArrayList;
import java.util.List;

public class PayrollManagement {
    private List<Employee> employees;

    // Constructor to initialize the list of employees
    public PayrollManagement() {
        employees = new ArrayList<>();
    }

    // Add employees to the payroll
    public void addEmployee(Employee employee) {
        employees.add(employee);
    }

    // Method to calculate the total compensation (sum of all salaries)
    public Double calculateTotalCompensation() {
        Double totalCompensation = 0.0;
        for (Employee employee : employees) {
            employee.calculateSalary();
            totalCompensation += employee.getSalary();
        }
        return totalCompensation;
    }

    // Method to get employees eligible for bonus (salary > 50000)
    public void getBonusEligibleEmployees() {
        System.out.println("Employees eligible for bonus:");
        for (Employee employee : employees) {
            if (employee.isEligibleForBonus()) {
                System.out.println("Employee ID: " + employee.getEmpId() + ", Name: " + employee.getName() +
                        ", Salary: " + employee.getSalary());
            }
        }
    }
}





package usingAbstractEmpData;

public class EmployeeManagementSystem {

    public static void main(String[] args) {
        // Create PayrollManagement object
        PayrollManagement payroll = new PayrollManagement();

        // Create PermanentEmployee and ContractEmployee objects
        PermanentEmployee permanentEmployee = new PermanentEmployee(101, "John Doe", "Manager", 60000.0, 5000.0);
        ContractEmployee contractEmployee = new ContractEmployee(102, "Jane Smith", "Developer", 50.0, 120);

        // Add employees to the payroll system
        payroll.addEmployee(permanentEmployee);
        payroll.addEmployee(contractEmployee);

        // Display total compensation for the company
        System.out.println("Total Compensation: " + payroll.calculateTotalCompensation());

        // Display employees eligible for bonus
        payroll.getBonusEligibleEmployees();
    }
}




##################################################################################################
################################### Student Management (using File-handling and ArrayList #######


package StudentDataFileHandling;

class Student {
    int studentId;
    String name;
    String course;
    double marks;

    public Student(int studentId, String name, String course, double marks) {
        this.studentId = studentId;
        this.name = name;
        this.course = course;
        this.marks = marks;
    }

    @Override
    public String toString() {
        return studentId + " " + name + " " + course + " " + marks;
    }
}







package StudentDataFileHandling;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class StudentManagementSystem {
    static final String FILE_NAME = "students.txt";

    // Add Student
    public static void addStudent(Student student) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME, true))) {
            writer.write(student.toString());
            writer.newLine();
            System.out.println("Student added successfully.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Update Student Marks
    public static void updateMarks(int studentId, double newMarks) {
        List<Student> studentList = getAllStudents();
        boolean found = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME))) {
            for (Student student : studentList) {
                if (student.studentId == studentId) {
                    student.marks = newMarks;
                    found = true;
                }
                writer.write(student.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (found) {
            System.out.println("Marks updated successfully.");
        } else {
            System.out.println("Student not found.");
        }
    }

    // Delete Student
    public static void deleteStudent(int studentId) {
        List<Student> studentList = getAllStudents();
        boolean removed = studentList.removeIf(student -> student.studentId == studentId);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME))) {
            for (Student student : studentList) {
                writer.write(student.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (removed) {
            System.out.println("Student deleted successfully.");
        } else {
            System.out.println("Student not found.");
        }
    }

    // Search Student
    public static void searchStudent(int studentId) {
        List<Student> studentList = getAllStudents();
        for (Student student : studentList) {
            if (student.studentId == studentId) {
                System.out.println(student);
                return;
            }
        }
        System.out.println("Student not found.");
    }

    // Display All Students
    public static void displayAllStudents() {
        List<Student> studentList = getAllStudents();
        if (studentList.isEmpty()) {
            System.out.println("No student records found.");
            return;
        }
        for (Student student : studentList) {
            System.out.println(student);
        }
    }

    // Read All Students from File
    public static List<Student> getAllStudents() {
        List<Student> studentList = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(" ");
                int id = Integer.parseInt(data[0]);
                String name = data[1];
                String course = data[2];
                double marks = Double.parseDouble(data[3]);
                studentList.add(new Student(id, name, course, marks));
            }
        } catch (FileNotFoundException e) {
            // File not created yet — no action needed
        } catch (IOException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    // Main Method
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("\nStudent Management System");
            System.out.println("1. Add Student");
            System.out.println("2. Update Marks");
            System.out.println("3. Delete Student");
            System.out.println("4. Search Student");
            System.out.println("5. Display All Students");
            System.out.println("6. Exit");
            System.out.print("Enter your choice: ");
            int choice = sc.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Enter Student ID: ");
                    int id = sc.nextInt();
                    sc.nextLine(); // clear buffer
                    System.out.print("Enter Name: ");
                    String name = sc.nextLine();
                    System.out.print("Enter Course: ");
                    String course = sc.nextLine();
                    System.out.print("Enter Marks: ");
                    double marks = sc.nextDouble();
                    addStudent(new Student(id, name, course, marks));
                    break;

                case 2:
                    System.out.print("Enter Student ID to update marks: ");
                    int updateId = sc.nextInt();
                    System.out.print("Enter New Marks: ");
                    double newMarks = sc.nextDouble();
                    updateMarks(updateId, newMarks);
                    break;

                case 3:
                    System.out.print("Enter Student ID to delete: ");
                    int deleteId = sc.nextInt();
                    deleteStudent(deleteId);
                    break;

                case 4:
                    System.out.print("Enter Student ID to search: ");
                    int searchId = sc.nextInt();
                    searchStudent(searchId);
                    break;

                case 5:
                    displayAllStudents();
                    break;

                case 6:
                    System.out.println("Exiting...");
                    sc.close();
                    System.exit(0);
                    break;

                default:
                    System.out.println("Invalid choice. Try again.");
            }
        }
    }
}






##################################### Sorting Objects ############################################


package ComparablePractice;

public class Emp implements Comparable<Emp> {
    public String name;
    public String phone;
    public int empId;

    public Emp(String name, String phone, int empId) {
        this.name = name;
        this.phone = phone;
        this.empId = empId;
    }


//    public String getName(){  // write this due to Comparable interface for String, float or Double not for int or long
//        return name;
//    }

    @Override
    public int compareTo(Emp o) {
       // return Double.compare(o.empId, this.empId);  // similarly for Float as well (for Descending order)
        return this.empId - o.empId;  // for sorting int (for Descending order)
    }


//    @Override
//    public int compareTo(Emp o) {
//        return o.name.compareTo(this.name);  // for sorting String values (for Descending order)
//    }

    @Override
    public String toString(){
        return "\n name:- " + name + "\n phone:- " + phone + "\n empId:- " + empId;
    }
}







package ComparablePractice;

import java.util.ArrayList;
import java.util.Collections;

public class SortExample {
    public static void main(String[] args) {
        ArrayList<Emp> emps = new ArrayList<>();
        emps.add(new Emp("athena", "8272837383", 2));
        emps.add(new Emp("levinho", "8474840191", 1));
        emps.add(new Emp("mamba", "6293729383", 4));
        emps.add(new Emp("mortal", "029389202", 3));

       // System.out.println("emps sorted are " + emps);

        Collections.sort(emps);

        System.out.println("emps details after sorting are " + emps);
    }
}


###############################################################################################



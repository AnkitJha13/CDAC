## Use Database and Create Collection
# use companyDB

# db.createCollection("employees")


# To insert multiple data

db.employees.insertMany([
 {
   "emp_id": 101,
   "first_name": "Amit",
   "last_name": "Sharma",
   "email": "amit.sharma@company.in",
   "hire_date": "2020-06-15",
   "salary": 75000,
   "department": "IT"
 },
 {
   "emp_id": 102,
   "first_name": "Priya",
   "last_name": "Verma",
   "email": "priya.verma@company.in",
   "hire_date": "2019-04-20",
   "salary": 62000,
   "department": "HR"
 },
 {
   "emp_id": 103,
   "first_name": "Rohit",
   "last_name": "Patel",
   "email": "rohit.patel@company.in",
   "hire_date": "2021-01-10",
   "salary": 85000,
   "department": "Finance"
 },
 {
   "emp_id": 104,
   "first_name": "Sneha",
   "last_name": "Iyer",
   "email": "sneha.iyer@company.in",
   "hire_date": "2018-09-25",
   "salary": 90000,
   "department": "IT"
 },
 {
   "emp_id": 105,
   "first_name": "Vikram",
   "last_name": "Singh",
   "email": "vikram.singh@company.in",
   "hire_date": "2023-02-10",
   "salary": 55000,
   "department": null
 }
])




# To insert only a single data
- db.employees.insertOne({
  emp_id: 106,
  first_name: "Rahul",
  last_name: "Nair",
  email: "rahul.nair@company.in",
  hire_date: "2022-05-01",
  salary: 65000,
  department: "Marketing"
})




# To display all the data in employees
- db.employees.find()




# To search an employee data based on name
- db.employees.find({ first_name: "Amit" })






# Increase salary by 10% (for emp_id 103)
- db.employees.updateOne(
  { emp_id: 103 },
  { $mul: { salary: 1.10 } }  // increase by 10%
)




# Decrease salary by 10% (for emp_id 103)
- db.employees.updateOne(
  { emp_id: 103 },
  { $mul: { salary: 0.90 } }  // decrease salary by 10%
)



# Add 5000 to salary (for emp_id 103)
- db.employees.updateOne(
  { emp_id: 103 },
  { $inc: { salary: 5000 } } // add 5000 to salary
)



# Subtract 5000 from salary (for emp_id 103)
- db.employees.updateOne(
  { emp_id: 103 },
  { $inc: { salary: -5000 } } // subtract 5000 from salary
)




# To increment the salary of a particular department 
- db.employee.updateMany(
  { department: "IT" },
  { $inc: { salary: 3000 } }
)




# Delete Employee with emp_id = 105
- db.employees.deleteOne({ emp_id: 105 })




# Find data based on IT department
- db.employees.find({ department: "IT" }) 



# Find data based on last name Singh
- db.employees.find({ last_name : "Singh" }) 




# To find based on salary greater than 80000
- db.employees.find({ salary: { $gt: 80000 } })  // similarly for less than use $lt



# Sort Employees by Salary (Descending)
- db.employees.find().sort({ salary: -1 })  // for Ascending write salary: 1



# Find Oldest Employee (Earliest hire_date)
- db.employees.find().sort({ hire_date: 1 }).limit(1)  // for finding latest employee -> hire_date: -1



# First Name Starts With 'V' and Last Name Ends With 'h'
- db.employees.find({
  first_name: { $regex: /^V/i },
  last_name: { $regex: /h$/i }     // Output - Vikram Singh complete data will be printed
})





# BSON date format for MongoDB (Using ISODATE for date)
- db.employees.insertOne({
  emp_id: 107,
  first_name: "Riya",
  last_name: "Mishra",
  email: "riya.mishra@company.in",
  hire_date: ISODate("2023-04-01"),
  salary: 72000,
  department: "Finance"
})





# UPSERT (Update + Insert if not exists) 
- db.employees.updateOne(
  { emp_id: 108 },     // if this emp_id is not availaible it will insert otherwise update the existing data
  {
    $set: {
      first_name: "Virat",
      last_name: "Kohli",
      email: "virat.kohli@company.in",
      hire_date: "2022-03-18",
      salary: 78000,
      department: "IT"
    }
  },
  { upsert: true }
)









# Find using $and (Example: Finance dept with salary > 70000)
db.employees.find({
  $and: [
    { department: "Finance" },
    { salary: { $gt: 70000 } }
  ]
})




# Find using $or (Example: HR or salary < 65000)
db.employees.find({
  $or: [
    { department: "HR" },
    { salary: { $lt: 65000 } }
  ]
})





# Create index on department (improves query speed)
- db.employees.createIndex({ department: 1 })



# Create compound index on salary (desc) + department
- db.employees.createIndex({ salary: -1, department: 1 })



# View all indexes
- db.employees.getIndexes()



# Drop index on department
- db.employees.dropIndex({ department: 1 })



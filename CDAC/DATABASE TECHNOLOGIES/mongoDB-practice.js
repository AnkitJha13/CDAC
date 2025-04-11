## Use Database and Create Collection
# use companyDB (selects/creates the database)


# db.createCollection("employees") (creates the employees collection)


# To insert multiple data (insertMany - bulk insert)
- db.employees.insertMany([
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



# To insert only a single data (insertOne)
- db.employees.insertOne({
  emp_id: 106,
  first_name: "Rahul",
  last_name: "Nair",
  email: "rahul.nair@company.in",
  hire_date: "2022-05-01",
  salary: 65000,
  department: "Marketing"
})



# To display all the data in employees (display all)
- db.employees.find()



# To search an employee data based on name (filter by name)
- db.employees.find({ first_name: "Amit" })



# Increase salary by 10% (use $mul for multiplication)
- db.employees.updateOne(
  { emp_id: 103 },
  { $mul: { salary: 1.10 } }
)



# Decrease salary by 10% (use $mul to decrease)
- db.employees.updateOne(
  { emp_id: 103 },
  { $mul: { salary: 0.90 } }
)



# Add 5000 to salary (use $inc to increment)
- db.employees.updateOne(
  { emp_id: 103 },
  { $inc: { salary: 5000 } }
)



# Subtract 5000 from salary (use $inc with negative value)
- db.employees.updateOne(
  { emp_id: 103 },
  { $inc: { salary: -5000 } }
)



# Increment salary of IT department (updateMany on filter)
- db.employees.updateMany(
  { department: "IT" },
  { $inc: { salary: 3000 } }
)



# Delete Employee with emp_id = 105 (deleteOne)
- db.employees.deleteOne({ emp_id: 105 })



# Find data based on IT department (filter by department)
- db.employees.find({ department: "IT" }) 



# Find data based on last name Singh (filter by last name)
- db.employees.find({ last_name : "Singh" }) 



# To find based on salary greater than 80000 (comparison operator $gt)
- db.employees.find({ salary: { $gt: 80000 } })



# Sort Employees by Salary Descending (sort -1)
- db.employees.find().sort({ salary: -1 })



# Find Oldest Employee (sort by hire_date ascending, limit 1)
- db.employees.find().sort({ hire_date: 1 }).limit(1)



# First Name Starts With 'V' and Last Name Ends With 'h' (regex query)
- db.employees.find({
  first_name: { $regex: /^V/i },
  last_name: { $regex: /h$/i }
})



# BSON date format for MongoDB (using ISODate for proper date storage)
- db.employees.insertOne({
  emp_id: 107,
  first_name: "Riya",
  last_name: "Mishra",
  email: "riya.mishra@company.in",
  hire_date: ISODate("2023-04-01"),
  salary: 72000,
  department: "Finance"
})



# UPSERT (Update if exists, else Insert - updateOne with upsert)
- db.employees.updateOne(
  { emp_id: 108 },
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



# Find using $and (filter using multiple conditions)
- db.employees.find({
  $and: [
    { department: "Finance" },
    { salary: { $gt: 70000 } }
  ]
})



# Find using $or (match any condition)
- db.employees.find({
  $or: [
    { department: "HR" },
    { salary: { $lt: 65000 } }
  ]
})



# Create index on department (single field index for faster query)
- db.employees.createIndex({ department: 1 })



# Create compound index (index on salary descending and department)
- db.employees.createIndex({ salary: -1, department: 1 })



# View all indexes (getIndexes)
- db.employees.getIndexes()



# Drop index on department (dropIndex)
- db.employees.dropIndex({ department: 1 })



## Aggregate and Group By (aggregation queries)

# Total salary of all employees (aggregation + $sum - group all)
- db.employees.aggregate([
  { $group: { _id: null, totalSalary: { $sum: "$salary" } } }
])



# Count of employees in each department ($group by department + $sum)
- db.employees.aggregate([
  { $group: { _id: "$department", count: { $sum: 1 } } }
])



# Average salary by department ($group + $avg)
- db.employees.aggregate([
  { $group: { _id: "$department", avgSalary: { $avg: "$salary" } } }
])



# Max salary in each department ($group + $max)
- db.employees.aggregate([
  { $group: { _id: "$department", maxSalary: { $max: "$salary" } } }
])



# List employees with only selected fields (projection using $project)
- db.employees.aggregate([
  { $project: { _id: 0, Name: { $concat: ["$first_name", " ", "$last_name"] }, Department: "$department", Salary: "$salary" } }
])



# Find employees hired after 2020 and group by department ($match + $group)
- db.employees.aggregate([
  { $match: { hire_date: { $gt: "2020-01-01" } } },
  { $group: { _id: "$department", count: { $sum: 1 } } }
])



# Sort by salary in aggregation pipeline ($sort)
- db.employees.aggregate([
  { $sort: { salary: -1 } }
])



# Count of employees per year of hiring (extract year using $project + $group)
- db.employees.aggregate([
  {
    $project: {
      hire_year: { $substr: ["$hire_date", 0, 4] }
    }
  },
  {
    $group: {
      _id: "$hire_year",
      total: { $sum: 1 }
    }
  },
  { $sort: { _id: 1 } }
])



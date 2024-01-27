


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous" />
  <style>
    body {
      background-color: #f5f5f5;
    }
    h1 {
      color: #337ab7;
      margin-bottom: 50px;
    }
    .form-group label {
      font-weight: bold;
    }
    button[type="submit"] {
      margin-top: 20px;
    }
    button[type="submit"]:hover {
      background-color: #337ab7;
      border-color: #337ab7;
    }
    .card {
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 30px;
      margin-bottom: 50px;
    }
  </style>
</head>
<body>
  <%
  
  if (session.getAttribute("username") == null) {
  response.sendRedirect("login.jsp"); }
  
  response.setHeader("Cache-Control","no-cache");
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader ("Expires", 0);

	

  
  
  
  
  %>

  <div class="container">
    <center>
      <h1><u>ADMIN</u></h1>
    </center>

    <div class="row justify-content-center">
      <div class="col-sm-5">
        <div class="card">
          <h2>Add New Course</h2>
          <hr>
          <form action="AddNewCourse" method="post">
            <div class="form-group">
              <label for="course_id">Course ID</label>
              <input type="text" name="course_id" required class="form-control"/>
            </div>

            <div class="form-group">
              <label for="course_name">Course Name</label>
              <input type="text" name="course_name" required class="form-control"/>
            </div>

            <div class="form-group">
  				<label for="course_desc">Course Description</label>
 				 <textarea name="course_desc" required class="form-control"></textarea>
			</div>
            

            <div class="text-center">
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </form>
        </div>
      </div>


      <div class="col-sm-5">
        <div class="card">
          <h2>Assign a Course to a Teacher</h2>
          <hr>
          <form action="AssignCourse" method="post">
            <div class="form-group">
              <label for="course_id">Course ID</label>
              <input type="text" name="course_id" required class="form-control"/>
            </div>

            <div class="form-group">
              <label for="username">Teacher's username</label>
              <input type="text" name="username" required class="form-control"/>
            </div>

            <div class="text-center">
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </form>
                </div>
    </div>

    <div class="text-center mt-4">
      <form action="Logout">
        <button type="submit" class="btn btn-secondary">Logout</button>
      </form>
    </div>
  </div>

  <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
          crossorigin="anonymous"></script>
</body>
</html>
          
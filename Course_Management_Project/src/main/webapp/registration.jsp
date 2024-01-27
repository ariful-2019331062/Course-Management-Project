<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Registration</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous" />
		<script
			defer
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		<style>
			body{
				//background-image: linear-gradient(45deg,#8b5aed 0%,#78ebfc 100%);
				background: linear-gradient(#642B73, #C6426E);
				
				
			}
			.card {
				max-width: 480px;
				margin: auto;
			}
			.form-floating {
				margin-bottom: 1rem;
			}
			.btn-grad {
            background-image: linear-gradient(to right, #AA076B 0%, #61045F  51%, #AA076B  100%);
            margin: 10px;
            margin-left:140px;
            margin-top:0px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
          }

          .btn-grad:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
          
          		
		.form-group {
		  position:relative;  
		
		  & + .form-group {
		    margin-top: 30px;
		  }
		}
		
		.form-label {
		  position: absolute;
		  left: 0;
		  top: 10px;
		  color: #999;
		  background-color: #fff;
		  z-index: 10;
		  transition: transform 150ms ease-out, font-size 150ms ease-out;
		}
		
		.focused .form-label {
		  transform: translateY(-125%);
		  font-size: .75em;
		}
		
		.form-input {
		  position: relative;
		  padding: 12px 0px 5px 0;
		  width: 100%;
		  outline: 0;
		  border: 0;
		  box-shadow: 0 1px 0 0 #e5e5e5;
		  transition: box-shadow 150ms ease-out;
		  
		  &:focus {
		    box-shadow: 0 2px 0 0 blue;
		  }
		}
		
		.form-input.filled {
		  box-shadow: 0 2px 0 0 lightgreen;
		}
		</style>

	</head>
	<body>
		<div class="container mt-5">
			<h1 style="max-width: 480px; margin: auto; color:white">Registration</h1>
			<br />

			<div class="card-group">
				<div class="card">
					<div class="card-body">
						<form action="Registration" method="post">
							<div class="form-group">
								<input
									type="text"
									name="username"
									placeholder="Username/Registration No."
									class="form-input"
									required />
								<label for="username" class="form-label">
								</label>
							</div>

							<div class="form-group">
								<input
									type="email"
									name="email"
									placeholder="email"
									class="form-input"
									required />
								<label for="email" class="form-label"></label>
							</div>
							
							<div class="form-group">
								<input
									type="text"
									name="name"
									placeholder="name"
									class="form-input"
									required />
								<label for="name" class="form-label"></label>
							</div>

							<div class="form-group">
								<input
									type="password"
									name="password"
									placeholder="Password"
									class="form-input"
									required />
								<label for="password" class="form-label"></label>
							</div>

							<div class="form-group">
								<input
									type="password"
									name="confirmPassword"
									placeholder="Confirm Password"
									class="form-input"
									required />
								<label for="confirmPassword" class="form-label">
						
								</label>
							</div>

							<div class="form-group">
								<select id="roles" name="role" class="form-input">
									<option value="student">Student</option>
									<option value="teacher">Teacher</option>
								</select>
								
							</div>
							
							<br/>
										
							<input type="submit" value="Register" class="btn btn-grad" />
						</form>
					</div>
				</div>
			</div>
		</div>
		<br/>
		<br/>
		<br/>
	</body>
</html>
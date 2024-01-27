<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Login</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
		<style>
			body {
				/*background-color: #f5f5f5;*/
				/*background-image: linear-gradient(45deg,#8b5aed ,#78ebfc );*/
				//background: linear-gradient(#2193b0, #6dd5ed);
				//background: linear-gradient(#02AAB0, #00CDAC);
				//background: linear-gradient(#457fca, #5691c8);
				//background: linear-gradient(#56CCF2, #2F80ED);
				background: linear-gradient(#642B73, #C6426E);
				background-size: cover;
			}

			.container {
				max-width: 480px;
				margin: auto;
				background-color: #fff;
				padding: 20px;
				border-radius: 10px;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
				//text-align:center;
			}
			
			.form-wrapper {
			  max-width: 30%;
			  min-width: 300px;
			  padding: 50px 30px 50px 30px;
			  margin: 50px auto;   
			  background-color: #ffffff;
			  border-radius: 5px;
			  box-shadow: 0 15px 35px rgba(50,50,93,.1),0 5px 15px rgba(0,0,0,.07);
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
          
          a {
			font-family: Poppins-Regular;
			font-size: 15px;
			line-height: 1.7;
			color: #AA076B;
			margin: 0px;
			transition: all 0.4s;
			-webkit-transition: all 0.4s;
		    -o-transition: all 0.4s;
		    -moz-transition: all 0.4s;
		}
		
		a:focus {
			outline: none !important;
		}
		
		a:hover {
		  text-decoration: none;
		  color: #61045F;
		  color: -webkit-linear-gradient(left, #21d4fd, #b721ff);
		  color: -o-linear-gradient(left, #21d4fd, #b721ff);
		  color: -moz-linear-gradient(left, #21d4fd, #b721ff);
		  color: linear-gradient(left, #21d4fd, #b721ff);
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
	<br/>
	<br/>
	<h1 style="max-width: 480px; margin: auto; color:white">Login</h1>
		<div class="container mt-5">

			<form action="Login" method="post" class="form" novalidate>
				<div class="form-group">
					<input type="text" name="username" placeholder="UserName" class="form-input" required />
					<label class="form-label" for="username"></label>
				</div>

				<br />

				<div class="form-group">
					<input type="password" name="password" placeholder="Password" class="form-input" required />
					<label class="form-label" for="password"></label>
				</div>

				<br />

				<!-- <label class="form-label" for="roles">Role:</label> -->
				<select id="roles" name="role" class="form-input">
					<option value="student">Student</option>
					<option value="teacher">Teacher</option>
					<option value="admin">Admin</option>
				</select>

				<br /><br />

				<div class="mt-3">
					<input type="submit" value="Login" class="btn btn-grad" />
					<!-- 
					<button onclick="window.location.href='registration.jsp'" class="btn btn-grad">Signup</button>
					 -->
				</div>
				<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="#" onclick="window.location.href='registration.jsp'">
							Sign Up
						</a>
					</div>
				<br/>
			</form>
		</div>
		<br/>
		<script>
		
			const form = document.querySelector("form");
			form.addEventListener("submit", (e) => {
				if (!form.checkValidity()) {
					e.preventDefault();
				}

				form.classList.add("was-validated");
			});
		</script>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
	</body>
</html>
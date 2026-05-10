<!DOCTYPE html>
<html>
<head>
<title>Signup</title>

<style>

body{
font-family:Arial;
background:#0f172a;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

form{
background:white;
padding:40px;
border-radius:15px;
width:350px;
}

input{
width:100%;
padding:12px;
margin:10px 0;
}

button{
width:100%;
padding:12px;
background:#2563eb;
color:white;
border:none;
cursor:pointer;
}

a{
text-decoration:none;
}

</style>
</head>

<body>

<form action="signup" method="post">

<h2>Create Account</h2>

<input type="text" name="username" placeholder="Username" required>

<input type="email" name="email" placeholder="Email" required>

<input type="password" name="password" placeholder="Password" required>

<button type="submit">Signup</button>

<br><br>

<a href="index.jsp">Already have account? Login</a>

</form>

</body>
</html>

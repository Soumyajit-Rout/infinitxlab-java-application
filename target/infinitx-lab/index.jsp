<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>InfinitX Login Portal</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins',sans-serif;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);
    overflow:hidden;
}

/* Animated Background */

body::before{
    content:'';
    position:absolute;
    width:500px;
    height:500px;
    background:rgba(255,255,255,0.08);
    border-radius:50%;
    top:-150px;
    left:-150px;
    animation:float 6s ease-in-out infinite;
}

body::after{
    content:'';
    position:absolute;
    width:400px;
    height:400px;
    background:rgba(255,255,255,0.05);
    border-radius:50%;
    bottom:-120px;
    right:-120px;
    animation:float 8s ease-in-out infinite;
}

@keyframes float{
    0%{
        transform:translateY(0px);
    }
    50%{
        transform:translateY(20px);
    }
    100%{
        transform:translateY(0px);
    }
}

/* Login Card */

.login-container{
    position:relative;
    z-index:10;
    width:400px;
    max-width:90%;
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(15px);
    border:1px solid rgba(255,255,255,0.2);
    border-radius:25px;
    padding:40px 35px;
    box-shadow:0 10px 40px rgba(0,0,0,0.3);
    animation:fadeIn 1s ease;
}

@keyframes fadeIn{
    from{
        opacity:0;
        transform:translateY(30px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

.logo-section{
    text-align:center;
    margin-bottom:25px;
}

.logo-section img{
    width:100px;
    height:100px;
    border-radius:50%;
    object-fit:cover;
    border:4px solid rgba(255,255,255,0.3);
    box-shadow:0 0 20px rgba(255,255,255,0.3);
}

.logo-section h1{
    color:#fff;
    margin-top:15px;
    font-size:28px;
    font-weight:600;
}

.logo-section p{
    color:#dbeafe;
    font-size:14px;
    margin-top:5px;
}

/* Input Fields */

.input-group{
    margin-bottom:20px;
}

.input-group label{
    display:block;
    color:#fff;
    margin-bottom:8px;
    font-size:14px;
    font-weight:500;
}

.input-group input{
    width:100%;
    padding:14px 16px;
    border:none;
    outline:none;
    border-radius:12px;
    background:rgba(255,255,255,0.15);
    color:#fff;
    font-size:15px;
    transition:0.3s ease;
}

.input-group input::placeholder{
    color:#d1d5db;
}

.input-group input:focus{
    background:rgba(255,255,255,0.22);
    transform:scale(1.02);
    box-shadow:0 0 10px rgba(255,255,255,0.3);
}

/* Remember */

.options{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
    color:#fff;
    font-size:14px;
}

.options a{
    color:#bfdbfe;
    text-decoration:none;
}

.options a:hover{
    text-decoration:underline;
}

/* Button */

.login-btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:12px;
    background:linear-gradient(90deg,#06b6d4,#3b82f6);
    color:#fff;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s ease;
}

.login-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 20px rgba(0,0,0,0.25);
}

/* Footer */

.footer{
    text-align:center;
    margin-top:25px;
    color:#dbeafe;
    font-size:13px;
}

/* Responsive */

@media(max-width:500px){

    .login-container{
        padding:30px 25px;
    }

    .logo-section h1{
        font-size:24px;
    }

}

</style>
</head>

<body>

<div class="login-container">

    <div class="logo-section">
        <img src="InfinitX-img.png" alt="Logo">
        <h1>InfinitX Portal</h1>
        <p>Secure DevOps Application Login</p>
    </div>

    <form action="login" method="post">

        <div class="input-group">
            <label>Username</label>
            <input type="text" name="username" placeholder="Enter your username" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter your password" required>
        </div>

        <div class="options">
            <label>
                <input type="checkbox">
                Remember me
            </label>

            <a href="forgot.jsp">Forgot Password?</a>
        </div>

        <button type="submit" class="login-btn">
            Login Now
        </button>
	<p style="text-align:center;margin-top:15px;">
        Don't have account?
        <a href="signup.jsp" style="color:white;">Signup</a>
       </p>

    </form>

    <div class="footer">
        © 2026 InfinitX Lab | AWS DevOps Project
    </div>

</div>

</body>
</html>

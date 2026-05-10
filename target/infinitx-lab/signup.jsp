<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Signup | InfinitX Portal</title>

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
    background:linear-gradient(135deg,#071739,#0b2c68,#2563eb);
    overflow:hidden;
    position:relative;
}

/* Animated Background */

body::before{
    content:'';
    position:absolute;
    width:500px;
    height:500px;
    background:rgba(255,255,255,0.06);
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

/* Signup Card */

.signup-container{
    position:relative;
    z-index:10;
    width:420px;
    max-width:90%;
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(15px);
    border:1px solid rgba(255,255,255,0.2);
    border-radius:25px;
    padding:40px 35px;
    box-shadow:0 10px 40px rgba(0,0,0,0.35);
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

/* Logo */

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
    box-shadow:0 0 20px rgba(255,255,255,0.25);
}

.logo-section h1{
    color:#fff;
    margin-top:15px;
    font-size:30px;
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

/* Signup Button */

.signup-btn{
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

.signup-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 20px rgba(0,0,0,0.25);
}

/* Footer */

.footer{
    text-align:center;
    margin-top:22px;
    color:#dbeafe;
    font-size:14px;
}

.footer a{
    color:#ffffff;
    text-decoration:none;
    font-weight:500;
}

.footer a:hover{
    text-decoration:underline;
}

/* Responsive */

@media(max-width:500px){

    .signup-container{
        padding:30px 25px;
    }

    .logo-section h1{
        font-size:24px;
    }

}

</style>
</head>

<body>

<div class="signup-container">

    <div class="logo-section">

        <img src="InfinitX-img.png" alt="InfinitX Logo">

        <h1>Create Account</h1>

        <p>Join InfinitX DevOps Portal</p>

    </div>

    <form action="signup" method="post">

        <div class="input-group">

            <label>Username</label>

            <input type="text"
                   name="username"
                   placeholder="Enter your username"
                   required>

        </div>

        <div class="input-group">

            <label>Email Address</label>

            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

        </div>

        <div class="input-group">

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Create strong password"
                   required>

        </div>

        <button type="submit" class="signup-btn">
            Create Account
        </button>

    </form>

    <div class="footer">

        Already have an account?
        <a href="index.jsp">Login</a>

    </div>

</div>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sess = request.getSession(false);
    String username = (sess != null) ? (String) sess.getAttribute("username") : null;
    if(username == null){
        username = "User";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>InfinitX Lab - Dashboard</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        body{
            background: radial-gradient(circle at top left, #0b1a33, #050b17);
            color: white;
            overflow-x:hidden;
        }

        /* NAVBAR */
        .navbar{
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:15px 60px;
            background:rgba(15, 23, 42, 0.85);
            backdrop-filter: blur(12px);
            position:sticky;
            top:0;
            z-index:999;
            border-bottom:1px solid rgba(255,255,255,0.08);
        }

        .logo{
            display:flex;
            align-items:center;
            gap:12px;
        }

        .logo img{
            height:50px;
            width:auto;
        }

        .logo h2{
            font-size:22px;
            color:#38bdf8;
            font-weight:800;
            letter-spacing:1px;
        }

        .nav-links{
            display:flex;
            align-items:center;
            gap:30px;
        }

        .nav-links a{
            text-decoration:none;
            color:#e2e8f0;
            font-size:15px;
            font-weight:600;
            transition:0.3s;
        }

        .nav-links a:hover{
            color:#38bdf8;
        }

        /* Dropdown */
        .dropdown{
            position:relative;
        }

        .dropdown button{
            background:transparent;
            border:none;
            color:#e2e8f0;
            font-size:15px;
            font-weight:600;
            cursor:pointer;
        }

        .dropdown button:hover{
            color:#38bdf8;
        }

        .dropdown-content{
            display:none;
            position:absolute;
            top:40px;
            left:-80px;
            background:rgba(30, 41, 59, 0.95);
            backdrop-filter: blur(12px);
            min-width:300px;
            border-radius:18px;
            overflow:hidden;
            box-shadow:0px 8px 30px rgba(0,0,0,0.7);
            padding:12px;
            border:1px solid rgba(255,255,255,0.08);
        }

        .dropdown-content a{
            display:block;
            padding:12px 14px;
            border-radius:12px;
            font-size:14px;
            color:#cbd5e1;
            text-decoration:none;
            transition:0.3s;
        }

        .dropdown-content a:hover{
            background:#0f172a;
            color:#38bdf8;
        }

        .dropdown:hover .dropdown-content{
            display:block;
        }

        .user-area{
            display:flex;
            align-items:center;
            gap:15px;
        }

        .user-area span{
            font-size:14px;
            color:#a5b4fc;
            font-weight:700;
        }

        .logout-btn{
            background: linear-gradient(90deg, #ef4444, #dc2626);
            border:none;
            padding:10px 18px;
            border-radius:12px;
            color:white;
            cursor:pointer;
            font-weight:bold;
            transition:0.3s;
            box-shadow:0px 4px 12px rgba(239,68,68,0.3);
        }

        .logout-btn:hover{
            transform: scale(1.05);
        }

        /* HERO */
        .hero{
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:90px 70px;
            gap:40px;
        }

        .hero-left{
            max-width:650px;
        }

        .hero-left h1{
            font-size:56px;
            font-weight:900;
            margin-bottom:20px;
            line-height:1.2;
        }

        .hero-left h1 span{
            color:#38bdf8;
        }

        .hero-left p{
            font-size:18px;
            color:#cbd5e1;
            line-height:1.7;
        }

        .hero-buttons{
            margin-top:30px;
            display:flex;
            gap:15px;
        }

        .btn-primary{
            background: linear-gradient(90deg, #38bdf8, #2563eb);
            padding:14px 22px;
            border-radius:14px;
            color:white;
            font-weight:700;
            border:none;
            cursor:pointer;
            text-decoration:none;
            transition:0.3s;
        }

        .btn-primary:hover{
            transform: translateY(-4px);
        }

        .btn-secondary{
            background: rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.1);
            padding:14px 22px;
            border-radius:14px;
            color:white;
            font-weight:700;
            cursor:pointer;
            text-decoration:none;
            transition:0.3s;
        }

        .btn-secondary:hover{
            border:1px solid #38bdf8;
        }

        .hero-right{
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .hero-right img{
            width:380px;
            max-width:100%;
            filter: drop-shadow(0px 0px 20px rgba(56,189,248,0.3));
            border-radius:25px;
        }

        /* SECTION */
        .section{
            padding:80px 70px;
        }

        .section h2{
            text-align:center;
            font-size:38px;
            margin-bottom:50px;
            font-weight:900;
        }

        .section h2 span{
            color:#38bdf8;
        }

        /* COURSES */
        .courses-grid{
            display:grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap:25px;
        }

        .course-card{
            background:rgba(30, 41, 59, 0.75);
            border:1px solid rgba(255,255,255,0.08);
            padding:28px;
            border-radius:22px;
            box-shadow:0px 10px 25px rgba(0,0,0,0.5);
            transition:0.3s;
            backdrop-filter: blur(10px);
        }

        .course-card:hover{
            transform:translateY(-10px);
            border:1px solid rgba(56,189,248,0.6);
        }

        .course-card h3{
            color:#38bdf8;
            margin-bottom:12px;
            font-size:18px;
            font-weight:800;
        }

        .course-card p{
            font-size:14px;
            color:#cbd5e1;
            line-height:1.6;
        }

        /* TRAINERS */
        .trainers-grid{
            display:grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap:25px;
        }

        .trainer-card{
            background:rgba(30, 41, 59, 0.75);
            border:1px solid rgba(255,255,255,0.08);
            padding:30px;
            border-radius:22px;
            text-align:center;
            box-shadow:0px 10px 25px rgba(0,0,0,0.5);
            transition:0.3s;
            backdrop-filter: blur(10px);
        }

        .trainer-card:hover{
            transform:translateY(-10px);
            border:1px solid rgba(250,204,21,0.7);
        }

        .trainer-card img{
            height:110px;
            width:110px;
            border-radius:50%;
            margin-bottom:15px;
            border:4px solid #38bdf8;
        }

        .trainer-card h3{
            font-size:18px;
            margin-bottom:10px;
            color:#f8fafc;
            font-weight:900;
        }

        .trainer-card p{
            font-size:14px;
            color:#cbd5e1;
        }

        /* ABOUT + CONTACT */
        .info-box{
            background:rgba(30, 41, 59, 0.75);
            border:1px solid rgba(255,255,255,0.08);
            padding:45px;
            border-radius:22px;
            max-width:950px;
            margin:auto;
            text-align:center;
            line-height:1.9;
            color:#cbd5e1;
            box-shadow:0px 10px 25px rgba(0,0,0,0.5);
            backdrop-filter: blur(10px);
        }

        .info-box a{
            color:#38bdf8;
            text-decoration:none;
            font-weight:bold;
        }

        /* FOOTER */
        footer{
            margin-top:70px;
            background:rgba(15, 23, 42, 0.9);
            border-top:1px solid rgba(255,255,255,0.08);
            text-align:center;
            padding:25px;
            color:#cbd5e1;
            font-size:14px;
        }

        footer strong{
            color:#38bdf8;
        }

        /* Responsive */
        @media(max-width:900px){
            .hero{
                flex-direction:column;
                text-align:center;
            }
            .navbar{
                padding:15px 20px;
            }
            .section{
                padding:60px 20px;
            }
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">
        <img src="InfinitX-img.png" alt="InfinitX Logo">
        <h2>InfinitX Lab</h2>
    </div>

    <div class="nav-links">
        <a href="#about">About</a>
        <a href="#contact">Contact</a>

        <div class="dropdown">
            <button>Courses ▾</button>
            <div class="dropdown-content">
                <a href="#courses">AWS</a>
                <a href="#courses">DevOps</a>
                <a href="#courses">Git</a>
                <a href="#courses">GitHub</a>
                <a href="#courses">Maven</a>
                <a href="#courses">Nexus</a>
                <a href="#courses">Jenkins</a>
                <a href="#courses">Ansible</a>
                <a href="#courses">Docker</a>
                <a href="#courses">Kubernetes</a>
                <a href="#courses">Terraform</a>
                <a href="#courses">SonarQube</a>
                <a href="#courses">Prometheus & Grafana</a>
                <a href="#courses">Trivy</a>
                <a href="#courses">GitOps</a>
                <a href="#courses">AI / ML</a>
                <a href="#courses">Java Testing</a>
                <a href="#courses">Python Testing</a>
            </div>
        </div>
    </div>

    <div class="user-area">
        <span>Welcome, <%= username %></span>

        <form action="logout.jsp" method="get">
    <button class="logout-btn">Logout</button>
    </form>
    </div>
</div>

<!-- HERO SECTION -->
<div class="hero">
    <div class="hero-left">
        <h1>Hi, <span><%= username %></span> 👋 <br> Welcome to <span>InfinitX Lab</span></h1>

<p style="margin-top:10px; font-size:16px; color:#facc15; font-weight:600;">
    "We keep your hand infinitely — guiding you from learning to mastery."
</p>

<p style="margin-top:20px;">
    Your gateway to mastering <b>Cloud</b>, <b>DevOps</b>, <b>Automation</b>, <b>Testing</b>,
    <b>Monitoring</b>, <b>Security Tools</b> and <b>AI/ML</b> with real industry projects.
</p>

        <div class="hero-buttons">
            <a class="btn-primary" href="#courses">Explore Courses</a>
            <a class="btn-secondary" href="#trainers">Meet Trainers</a>
        </div>
    </div>

    <div class="hero-right">
        <img src="InfinitX-img.png" alt="InfinitX Banner">
    </div>
</div>

<!-- COURSES -->
<div class="section" id="courses">
    <h2>Our <span>Popular Courses</span></h2>

    <div class="courses-grid">
        <div class="course-card"><h3>AWS Cloud</h3><p>EC2, S3, IAM, VPC, Auto Scaling, Load Balancer & Cloud deployments.</p></div>
        <div class="course-card"><h3>DevOps Engineering</h3><p>CI/CD pipelines, automation, deployments, production DevOps projects.</p></div>
        <div class="course-card"><h3>Git</h3><p>Version control, branching, merging, rebasing, conflict resolution.</p></div>
        <div class="course-card"><h3>GitHub</h3><p>Pull Requests, GitHub Actions, workflows, repositories & collaboration.</p></div>
        <div class="course-card"><h3>Maven</h3><p>Build lifecycle, packaging, dependencies and Java project automation.</p></div>
        <div class="course-card"><h3>Nexus</h3><p>Artifact repository manager for Maven, Docker images and releases.</p></div>
        <div class="course-card"><h3>Jenkins</h3><p>Jenkinsfile, pipelines, CI/CD automation and production deployment.</p></div>
        <div class="course-card"><h3>Ansible</h3><p>Playbooks, roles, automation scripts and configuration management.</p></div>
        <div class="course-card"><h3>Docker</h3><p>Dockerfile, images, containers, compose and real-time deployments.</p></div>
        <div class="course-card"><h3>Kubernetes</h3><p>Pods, Deployments, Services, Ingress, Helm charts & scaling.</p></div>
        <div class="course-card"><h3>Terraform</h3><p>Infrastructure as Code (IaC) with Terraform modules for AWS.</p></div>
        <div class="course-card"><h3>SonarQube</h3><p>Code quality analysis, vulnerability scan and code review automation.</p></div>
        <div class="course-card"><h3>Prometheus & Grafana</h3><p>Monitoring, metrics, dashboards, alerting rules and exporters.</p></div>
        <div class="course-card"><h3>Trivy</h3><p>Container vulnerability scanning, reports and security best practices.</p></div>
        <div class="course-card"><h3>GitOps</h3><p>Modern deployments using Git-based automation and Kubernetes GitOps.</p></div>
        <div class="course-card"><h3>AI / ML</h3><p>AI and Machine Learning fundamentals with practical industry approach.</p></div>
        <div class="course-card"><h3>Java Testing</h3><p>Manual + automation testing, test case writing, CI integration.</p></div>
        <div class="course-card"><h3>Python Testing</h3><p>Pytest, unit testing, automation testing and QA best practices.</p></div>
    </div>
</div>

<!-- TRAINERS -->
<div class="section" id="trainers">
    <h2>Meet Our <span>Trainers</span></h2>

    <div class="trainers-grid">

        <div class="trainer-card">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Trainer">
            <h3>Soumyajit Rout</h3>
            <p>Senior DevOps Engineer</p>
        </div>

        <div class="trainer-card">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Trainer">
            <h3>Satyajit Rout</h3>
            <p>Senior Software Engineer (19+ Years Experience)</p>
        </div>

        <div class="trainer-card">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Trainer">
            <h3>Soumya Priyadarsini Rout</h3>
            <p>Python AQ / Testing Engineer</p>
        </div>

        <div class="trainer-card">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Trainer">
            <h3>Smruti Sahu</h3>
            <p>Java Testing Engineer</p>
        </div>

    </div>
</div>

<!-- ABOUT -->
<div class="section" id="about">
    <h2>About <span>InfinitX Lab</span></h2>
    <div class="info-box">
        InfinitX Lab is a professional learning platform designed for students and working professionals.
        We provide hands-on training on Cloud, DevOps, Automation, Testing, Monitoring, Security tools and AI/ML.
        <br><br>
        Our mission is to make you industry-ready with real-time projects, mentorship and job-oriented training.
    </div>
</div>

<!-- CONTACT -->
<div class="section" id="contact">
    <h2>Contact <span>Us</span></h2>

    <div class="info-box">
        📞 Contact: <strong>9337789240</strong> <br>
        📧 Mail: <a href="mailto:infinitxlab@gmail.com">infinitxlab@gmail.com</a> <br>
        📸 Instagram: <a href="https://instagram.com/infintx_lab" target="_blank">@infintx_lab</a> <br>
        🌐 Website: <strong>infinitxlab.com</strong>
    </div>
</div>

<!-- FOOTER -->
<footer>
    © 2026 <strong>InfinitX Lab</strong> | Website: infinitxlab.com |
    Contact: 9337789240 | Mail: infinitxlab@gmail.com | Instagram: @infintx_lab
</footer>

</body>
</html>

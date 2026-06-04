<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #3b82f6;
            --secondary: #8b5cf6;
            --text-dark: #0f172a;
            --text-muted: #64748b;
        }
        body {
            margin: 0;
            font-family: 'Outfit', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('images/library-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        body::before {
            content: '';
            position: absolute; top:0; left:0; width:100%; height:100%;
            background: rgba(255, 255, 255, 0.6); 
            backdrop-filter: blur(12px);
            z-index: 0;
        }
        .login-container {
            position: relative;
            display: flex;
            width: 900px;
            max-width: 95%;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.5);
            z-index: 1;
            color: var(--text-dark);
        }
        .login-left {
            flex: 1;
            background: url('images/library-side.jpg') no-repeat center center;
            background-size: cover;
            display: flex; flex-direction: column; justify-content: center; align-items: center;
            padding: 40px; position: relative;
        }
        .login-left::before {
            content: ''; position: absolute; top:0; left:0; width:100%; height:100%;
            background: linear-gradient(to bottom, rgba(59,130,246,0.3), rgba(139,92,246,0.6));
        }
        .login-left-content { position: relative; text-align: center; }
        .login-left h2 { font-size: 36px; margin-bottom: 20px; font-weight: 800; color: #fff; text-shadow: 0 2px 4px rgba(0,0,0,0.2); }
        .login-left p { font-size: 16px; color: #f8fafc; line-height: 1.6; text-shadow: 0 1px 2px rgba(0,0,0,0.2); }
        
        .login-right {
            flex: 1; padding: 50px 40px; display: flex; flex-direction: column; justify-content: center;
            background: rgba(255, 255, 255, 0.95);
        }
        .login-right h2 { text-align: center; margin-bottom: 25px; font-weight: 700; color: var(--text-dark); }
        .login-right h2 i { background: linear-gradient(to right, var(--primary), var(--secondary)); -webkit-background-clip: text; color: transparent; margin-right: 10px; }
        
        .login-type-selector { margin-bottom: 20px; }
        .login-type-selector label { display: block; margin-bottom: 8px; font-weight: 600; color: var(--text-muted); }
        .login-type-select {
            width: 100%; padding: 12px 15px; border: 1px solid #cbd5e1; border-radius: 10px;
            background-color: #f8fafc; color: var(--text-dark); cursor: pointer; transition: all 0.3s;
            font-family: 'Outfit', sans-serif;
            font-weight: 500;
        }
        .login-type-select option { background: #fff; color: var(--text-dark); }
        .login-type-select:focus { outline: none; border-color: var(--primary); box-shadow: 0 0 0 3px rgba(59,130,246,0.1); background-color: #fff; }
        
        .input-icon { position: relative; margin-bottom: 20px; }
        .input-icon i { position: absolute; top: 50%; left: 15px; transform: translateY(-50%); color: var(--primary); }
        .form-control {
            border-radius: 10px; padding: 12px 15px 12px 45px; border: 1px solid #cbd5e1;
            background: #f8fafc; color: var(--text-dark); width: 100%; transition: all 0.3s;
            font-family: 'Outfit', sans-serif;
            font-weight: 500;
        }
        .form-control:focus { background: #fff; border-color: var(--primary); box-shadow: 0 0 0 3px rgba(59,130,246,0.1); color: var(--text-dark); }
        .form-control::placeholder { color: #94a3b8; }
        
        .btn-primary {
            width: 100%; padding: 14px; background: linear-gradient(45deg, var(--primary), var(--secondary));
            border: none; color: #fff; font-size: 16px; font-weight: 600; border-radius: 10px; cursor: pointer; transition: 0.3s;
            font-family: 'Outfit', sans-serif;
        }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 10px 20px rgba(59,130,246,0.3); background: linear-gradient(45deg, var(--primary), var(--secondary)); }
        
        .text-center { margin-top: 20px; color: var(--text-muted); }
        .text-center a { color: var(--primary); font-weight: 600; text-decoration: none; transition: 0.3s; }
        .text-center a:hover { color: var(--secondary); text-decoration: underline; }
        
        .alert { border-radius: 10px; padding: 12px 20px; margin-bottom: 20px; border: none; }
        .alert-success { background: #d1fae5; color: #059669; }
        .alert-danger { background: #fee2e2; color: #dc2626; }
        
        @media (max-width: 900px) { 
            .login-container { flex-direction: column; } 
            .login-left { height: 200px; padding: 20px; } 
            .login-right { padding: 30px 20px; } 
        }
    </style>
</head>
<body>

<div class="login-container">
    <!-- Left Panel -->
    <div class="login-left">
        <div class="login-left-content">
            <h2>Welcome Back!</h2>
            <p>Access library services, manage your requests, and stay connected.</p>
        </div>
    </div>

    <!-- Right Panel -->
    <div class="login-right">
        <h2><i class="fas fa-book-reader"></i> Student Login</h2>

        <div class="login-type-selector">
            <label for="loginType">Login as:</label>
            <select id="loginType" class="login-type-select">
                <option value="student" selected>Student</option>
                <option value="staff">Staff</option>
                <option value="admin">Admin</option>
            </select>
        </div>

        <% String success = request.getParameter("success");
            if (success != null) { %>
        <div class="alert alert-success"><%= success %></div>
        <% } %>

        <% String error = request.getParameter("error");
            if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="input-icon">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" class="form-control" placeholder="Email" required>
            </div>
            <div class="input-icon">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="d-grid mb-3">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>

        <div class="text-center">
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const loginTypeSelect = document.getElementById('loginType');
        const loginTitle = document.querySelector('.login-right h2');

        loginTypeSelect.addEventListener('change', function() {
            const selectedType = this.value;

            switch(selectedType) {
                case 'admin':
                    window.location.href = 'adminlogin.jsp';
                    break;
                case 'staff':
                    window.location.href = 'stafflogin.jsp';
                    break;
                default:
                    loginTitle.innerHTML = '<i class="fas fa-book-reader"></i> Student Login';
                    break;
            }
        });
    });
</script>

</body>
</html>
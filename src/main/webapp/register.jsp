<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('images/library-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            padding: 40px 20px;
        }
        body::before {
            content: '';
            position: absolute; top:0; left:0; width:100%; height:100%;
            background: rgba(255, 255, 255, 0.6); 
            backdrop-filter: blur(12px);
            z-index: 0;
        }
        .card {
            position: relative;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.5);
            color: var(--text-dark);
            padding: 40px 40px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
            transition: transform 0.3s, box-shadow 0.3s;
            z-index: 1;
        }
        .card:hover {
            box-shadow: 0 25px 50px rgba(0,0,0,0.15);
        }

        .card h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 800;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            color: transparent;
        }

        .form-control {
            background: #f8fafc;
            border: 1px solid #cbd5e1;
            color: var(--text-dark);
            border-radius: 10px;
            padding: 12px 15px 12px 45px;
            margin-bottom: 20px;
            font-family: 'Outfit', sans-serif;
            font-weight: 500;
            transition: all 0.3s;
        }
        .form-control:focus {
            background: #fff;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.1);
            border-color: var(--primary);
            color: var(--text-dark);
        }
        .form-control::placeholder { color: #94a3b8; }

        .input-icon {
            position: relative;
        }
        .input-icon i {
            position: absolute;
            top: 40%;
            left: 15px;
            transform: translateY(-50%);
            color: var(--primary);
        }

        select.form-control option { background: #fff; color: var(--text-dark); }

        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            border: none;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.3s;
            font-family: 'Outfit', sans-serif;
            margin-top: 10px;
        }
        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(59,130,246,0.3);
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
            border-radius: 10px;
            padding: 12px 20px;
            background: #fef3c7;
            color: #d97706;
            border: none;
        }

        .text-center { margin-top: 25px; color: var(--text-muted); }
        .text-center a {
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
            transition: 0.3s;
        }
        .text-center a:hover {
            color: var(--secondary);
            text-decoration: underline;
        }

        @media (max-width: 500px) {
            .card {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
<div class="card">
    <h2><i class="fas fa-user-plus" style="color:var(--primary); -webkit-text-fill-color: initial;"></i> Register</h2>

    <% String message = (String) request.getAttribute("message");
        if (message != null) { %>
    <div class="alert alert-warning message"><%= message %></div>
    <% } %>

    <form action="RegisterServlet" method="post">
        <div class="input-icon">
            <i class="fas fa-user"></i>
            <input type="text" name="firstName" class="form-control" placeholder="First Name" required>
        </div>
        <div class="input-icon">
            <i class="fas fa-user"></i>
            <input type="text" name="lastName" class="form-control" placeholder="Last Name" required>
        </div>
        <div class="input-icon">
            <i class="fas fa-envelope"></i>
            <input type="email" name="email" class="form-control" placeholder="Email" required>
        </div>
        <div class="input-icon">
            <i class="fas fa-calendar"></i>
            <input type="number" name="age" class="form-control" placeholder="Age" required>
        </div>
        <div class="input-icon">
            <i class="fas fa-phone"></i>
            <input type="text" name="phoneNumber" class="form-control" placeholder="Telephone" required>
        </div>
        <div class="input-icon">
            <i class="fas fa-home"></i>
            <input type="text" name="hometown" class="form-control" placeholder="Hometown" required>
        </div>
        <div class="input-icon">
            <i class="fas fa-venus-mars"></i>
            <select name="gender" class="form-control" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="input-icon">
            <i class="fas fa-lock"></i>
            <input type="password" name="password" class="form-control" placeholder="Password" required>
        </div>
        <div class="input-icon">
            <i class="fas fa-lock"></i>
            <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm Password" required>
        </div>

        <input type="hidden" name="role" value="Member">

        <button type="submit">Register</button>
    </form>

    <div class="text-center mt-3">
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</div>
</body>
</html>

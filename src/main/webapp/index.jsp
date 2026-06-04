<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Portal - Welcome</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <style>
        body, html {
            margin: 0; padding: 0; width: 100%; height: 100%;
            font-family: 'Outfit', sans-serif;
            background: #ffffff; color: #1e293b; overflow: hidden;
        }
        .bg-gradient {
            position: absolute; top: 0; left: 0; width: 100%; height: 100%;
            background: radial-gradient(circle at top left, rgba(59, 130, 246, 0.1), transparent 40%),
                        radial-gradient(circle at bottom right, rgba(139, 92, 246, 0.1), transparent 40%);
            z-index: -1;
            filter: blur(40px);
            opacity: 1;
            animation: pulse 10s infinite alternate;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            100% { transform: scale(1.1); }
        }
        .container {
            display: flex; flex-direction: column; align-items: center; justify-content: center;
            height: 100vh; text-align: center;
            z-index: 10; position: relative;
        }
        h1 {
            font-size: 5rem; font-weight: 800; margin-bottom: 20px;
            background: linear-gradient(to right, #2563eb, #9333ea);
            -webkit-background-clip: text; -webkit-text-fill-color: transparent;
            animation: fadeUp 1s ease-out;
        }
        p {
            font-size: 1.5rem; color: #64748b; max-width: 600px; margin-bottom: 40px;
            animation: fadeUp 1.2s ease-out;
        }
        .btn {
            padding: 15px 40px; font-size: 1.2rem; font-weight: 600;
            color: #ffffff; background: linear-gradient(45deg, #3b82f6, #8b5cf6);
            border: none;
            border-radius: 50px; text-decoration: none;
            box-shadow: 0 10px 20px rgba(59, 130, 246, 0.2);
            transition: all 0.3s ease;
            animation: fadeUp 1.4s ease-out; cursor: pointer;
        }
        .btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(59, 130, 246, 0.3);
        }
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="bg-gradient"></div>
    <div class="container">
        <h1>Aurora Library</h1>
        <p>Discover a world of knowledge in a modern, immersive digital environment designed just for you.</p>
        <a href="mainpage.jsp" class="btn">Enter Library</a>
    </div>
</body>
</html>

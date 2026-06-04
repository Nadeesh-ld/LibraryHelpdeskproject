<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aurora Library - Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        :root {
            --primary: #3b82f6;
            --secondary: #8b5cf6;
            --bg-light: #f8fafc;
            --text-dark: #0f172a;
            --text-muted: #64748b;
            --glass-bg: rgba(255, 255, 255, 0.8);
            --glass-border: rgba(0, 0, 0, 0.05);
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Outfit', sans-serif; 
            background: #fff;
            color: var(--text-dark);
            overflow-x: hidden;
            position: relative;
        }
        
        .main-header {
            background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.6)), url('https://images.unsplash.com/photo-1521587760476-6c12a4b040da?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') no-repeat center center;
            background-size: cover;
            background-attachment: fixed;
            position: relative;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        /* Navbar */
        nav {
            display: flex; justify-content: space-between; align-items: center;
            padding: 30px 50px; background: transparent;
            z-index: 100;
        }
        .logo { font-size: 1.8rem; font-weight: 800; display: flex; align-items: center; gap: 10px; color: #fff; }
        .nav-links { display: flex; gap: 30px; }
        .nav-links a {
            color: #fff; text-decoration: none; font-weight: 500; font-size: 1rem;
            transition: opacity 0.3s;
        }
        .nav-links a:hover { opacity: 0.8; }
        .nav-actions { display: flex; gap: 15px; }
        .nav-actions .btn {
            padding: 10px 25px; border-radius: 8px; background: var(--primary);
            color: white; text-decoration: none; font-weight: 600; font-size: 1rem; transition: background 0.3s; display: inline-block;
        }
        .nav-actions .btn:hover { background: #2563eb; }

        /* Hero */
        .hero {
            flex: 1; display: flex; flex-direction: column; justify-content: center; align-items: center;
            text-align: center; padding: 50px;
        }
        .hero h1 { font-size: 5rem; font-weight: 800; margin-bottom: 20px; line-height: 1.1; color: #fff; }
        .hero p { font-size: 1.2rem; color: rgba(255,255,255,0.9); max-width: 800px; margin-bottom: 40px; }
        
        /* Features */
        .features {
            display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px; padding: 50px; max-width: 1200px; margin: 0 auto;
        }
        .card {
            background: var(--glass-bg); backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border); border-radius: 20px;
            padding: 40px; text-align: left; transition: transform 0.4s ease, box-shadow 0.4s ease;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }
        .card:hover {
            transform: translateY(-10px); box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        .card i { font-size: 2.5rem; margin-bottom: 20px; background: linear-gradient(45deg, var(--primary), var(--secondary)); -webkit-background-clip: text; color: transparent; }
        .card h3 { font-size: 1.5rem; margin-bottom: 15px; color: var(--text-dark); }
        .card p { color: var(--text-muted); line-height: 1.6; }

        /* Gallery/Books */
        .section-title { text-align: center; font-size: 3rem; font-weight: 800; margin: 50px 0; color: var(--text-dark); }
        .slideshow-container {
            position: relative; max-width: 1200px; margin: 0 auto 50px auto;
            padding: 20px 50px; overflow: hidden;
        }
        .gallery-slider {
            display: flex; gap: 20px; transition: transform 0.5s ease;
        }
        .slider-btn {
            position: absolute; top: 50%; transform: translateY(-50%);
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            color: white; border: none; width: 45px; height: 45px; border-radius: 50%;
            cursor: pointer; z-index: 100; font-size: 1.2rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2); display: flex; align-items: center; justify-content: center;
            transition: transform 0.3s;
        }
        .slider-btn:hover { transform: translateY(-50%) scale(1.1); }
        .slider-btn.prev { left: 10px; }
        .slider-btn.next { right: 10px; }
        .book-item {
            min-width: 250px; height: 350px; border-radius: 15px;
            background: #fff; position: relative; overflow: hidden;
            transition: transform 0.3s; flex-shrink: 0;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
        }
        .book-item:hover { transform: scale(1.05); z-index: 10; box-shadow: 0 15px 30px rgba(0,0,0,0.15); }
        .book-item img { width: 100%; height: 100%; object-fit: cover; opacity: 0.9; transition: opacity 0.3s; }
        .book-item:hover img { opacity: 1; }
        .book-info {
            position: absolute; bottom: 0; left: 0; width: 100%; padding: 20px;
            background: linear-gradient(transparent, rgba(255,255,255,0.95) 40%);
        }
        .book-info h4 { margin-bottom: 5px; font-size: 1.2rem; color: var(--text-dark); }
        .book-info p { font-size: 0.9rem; color: var(--primary); font-weight: 600; }

        /* Footer */
        footer {
            margin-top: 100px; padding: 40px 50px; text-align: center;
            border-top: 1px solid var(--glass-border); color: var(--text-muted);
            background: #fff;
        }
        
        @media (max-width: 768px) {
            .nav-links { display: none; }
            .hero h1 { font-size: 3.5rem; }
            .gallery { padding: 20px; }
        }
    </style>
</head>
<body>
    <header class="main-header">
        <nav>
            <div class="logo"><i class="fas fa-headset"></i> Library Help Desk</div>
            <div class="nav-links">
                <a href="#home">Home</a>
                <a href="#services">Services</a>
                <a href="#topics">Support Topics</a>
                <a href="about.jsp">About</a>
            </div>
            <div class="nav-actions">
                <a href="login.jsp" class="btn">Login</a>
                <a href="register.jsp" class="btn">Join Now</a>
            </div>
        </nav>

        <div class="hero" id="home">
            <h1>Welcome to the<br>Library Help Desk</h1>
            <p>Your one-stop destination for instant support, managing library tickets, browsing FAQs, and getting technical assistance seamlessly.</p>
        </div>
    </header>

    <div class="features" id="services">
        <div class="card">
            <i class="fas fa-ticket-alt"></i>
            <h3>Submit Tickets</h3>
            <p>Encountered an issue? Quickly submit a support ticket and our team will assist you in resolving it promptly.</p>
        </div>
        <div class="card">
            <i class="fas fa-question-circle"></i>
            <h3>Knowledge Base</h3>
            <p>Browse through our extensive collection of Frequently Asked Questions (FAQs) to find instant answers to common problems.</p>
        </div>
        <div class="card">
            <i class="fas fa-comments"></i>
            <h3>Feedback & Requests</h3>
            <p>Have a suggestion or need to request a specific book or resource? Easily submit requests directly to library staff.</p>
        </div>
    </div>

    <div class="section-title" id="topics">Popular Support Topics</div>
    <div class="slideshow-container">
        <button class="slider-btn prev" onclick="moveSlide(-1)"><i class="fas fa-chevron-left"></i></button>
        <button class="slider-btn next" onclick="moveSlide(1)"><i class="fas fa-chevron-right"></i></button>
        <div class="gallery-slider">
            <div class="book-item">
                <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Support 1">
                <div class="book-info">
                    <h4>Account Recovery</h4>
                    <p>Login & Access</p>
                </div>
            </div>
            <div class="book-item">
                <img src="https://images.unsplash.com/photo-1589829085413-56de8ae18c73?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Support 2">
                <div class="book-info">
                    <h4>Book Returns & Renewals</h4>
                    <p>Circulation Desk</p>
                </div>
            </div>
            <div class="book-item">
                <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Support 3">
                <div class="book-info">
                    <h4>Wi-Fi & Lab Computers</h4>
                    <p>Technical Support</p>
                </div>
            </div>
            <div class="book-item">
                <img src="https://images.unsplash.com/photo-1495640388908-05fa85288e61?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Support 4">
                <div class="book-info">
                    <h4>E-Resources Access</h4>
                    <p>Digital Library</p>
                </div>
            </div>
            <div class="book-item">
                <img src="https://images.unsplash.com/photo-1532012197267-da84d127e2d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Support 5">
                <div class="book-info">
                    <h4>Study Room Booking</h4>
                    <p>Facilities</p>
                </div>
            </div>
            <!-- Duplicated for slideshow effect -->
            <div class="book-item">
                <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Support 6">
                <div class="book-info">
                    <h4>Account Recovery</h4>
                    <p>Login & Access</p>
                </div>
            </div>
            <div class="book-item">
                <img src="https://images.unsplash.com/photo-1589829085413-56de8ae18c73?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Support 7">
                <div class="book-info">
                    <h4>Book Returns & Renewals</h4>
                    <p>Circulation Desk</p>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 Library Help Desk. Crafted with modern aesthetics.</p>
    </footer>

    <script>
        let currentSlide = 0;
        const slider = document.querySelector('.gallery-slider');
        const items = document.querySelectorAll('.book-item');
        
        function moveSlide(dir) {
            const itemWidth = items[0].offsetWidth + 20; // width + gap
            const containerWidth = document.querySelector('.slideshow-container').offsetWidth - 100; // minus padding
            const visibleItems = Math.floor(containerWidth / itemWidth);
            const maxSlides = items.length - visibleItems;
            
            currentSlide += dir;
            if (currentSlide < 0) currentSlide = 0;
            if (currentSlide > maxSlides) currentSlide = maxSlides;
            
            slider.style.transform = `translateX(-${currentSlide * itemWidth}px)`;
        }
    </script>
</body>
</html>
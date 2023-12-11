<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/styles/global.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/styles/auth.css">
    <title>Registration</title>
</head>
<body style="margin: 0">
<div class="wrapper">
    <form action="${pageContext.servletContext.contextPath}/auth/signup" method="post" class="form">
        <h1 class="header">Registration</h1>
        <div class="element">
            <label for="name">Full name:</label>
            <input type="text" id="name" name="name" placeholder="John Smith" required/>
        </div>
        <div class="element">
            <label for="email">Email address:</label>
            <input type="email" id="email" name="email" placeholder="john.smith@mail.ru" required/>
        </div>
        <div class="element">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="johnsmith1974" required/>
        </div>
        <div class="element">
            <label for="re_password">Repeat password:</label>
            <input type="password" id="re_password" name="re_password" placeholder="johnsmith1974" required/>
        </div>
        <div class="error">${error}</div>
        <div class="success">${message}</div>
        <button type="submit" class="submit">
            Create account
        </button>
        <div class="link">
            <span>Already have an account?</span>
            <a href="${pageContext.servletContext.contextPath}/auth/login">
                Sign In
            </a>
        </div>
    </form>
</div>
</body>
</html>

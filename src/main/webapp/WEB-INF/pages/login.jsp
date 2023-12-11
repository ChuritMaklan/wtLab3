<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/styles/global.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/styles/auth.css">
    <title>Login</title>
</head>
<body style="margin: 0">
<div class="wrapper">
    <form action="${pageContext.servletContext.contextPath}/auth/login" method="post" class="form">
        <h1 class="header">Login</h1>
        <div class="element">
            <label for="email">Email address:</label>
            <input type="email" id="email" name="email" placeholder="john.smith@mail.ru" required/>
        </div>
        <div class="element">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="johnsmith1974" required/>
        </div>
        <div class="error">${error}</div>
        <button type="submit" class="submit">
            Login
        </button>
        <div class="link">
            <span>Don't have an account?</span>
            <a href="${pageContext.servletContext.contextPath}/auth/signup" class="link">
                Sing Up
            </a>
        </div>
    </form>
</div>
</body>
</html>

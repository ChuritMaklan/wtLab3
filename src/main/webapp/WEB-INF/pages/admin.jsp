<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value='${sessionScope["user"]}' var="user"/>
<body>
<div class="wrapper">
<%--    <%@ include file="/header.jsp" %>--%>
    <main class="content">
        <a class="back" href="${pageContext.servletContext.contextPath}/films"><</a>
        <table class="table">
            <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Rating</th>
                <th>Ban/Unban</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="userInfo" items="${users}">
                <tr>
                    <td>${userInfo.getName()}</td>
                    <td>${userInfo.getEmail()}</td>
                    <td>
                        <div class="rating-wrapper">
                            <form action="${pageContext.servletContext.contextPath}/users/${userInfo.getId()}" method="POST">
                                <input type="hidden" name="id" value="${userInfo.getId()}">
                                <input type="hidden" name="rating" value="${userInfo.getRating() - 1}">
                                <input type="hidden" name="isBanned" value="${userInfo.isBanned()}">
                                <button class="rating-operation" type="submit">-</button>
                            </form>
                                ${userInfo.getRating()}
                            <form action="${pageContext.servletContext.contextPath}/users/${userInfo.getId()}" method="POST">
                                <input type="hidden" name="id" value="${userInfo.getId()}">
                                <input type="hidden" name="rating" value="${userInfo.getRating() + 1}">
                                <input type="hidden" name="isBanned" value="${userInfo.isBanned()}">
                                <button class="rating-operation" type="submit">+</button>
                            </form>
                        </div>
                    </td>
                    <td style="width: 10%; text-align: center">
                        <form action="${pageContext.servletContext.contextPath}/users/${userInfo.getId()}" method="POST">
                            <input type="hidden" name="id" value="${userInfo.getId()}">
                            <input type="hidden" name="rating" value="${userInfo.getRating()}">
                            <input type="hidden" name="isBanned" value="${!userInfo.isBanned()}">
                            <button class="ban" type="submit">${userInfo.isBanned() ? "Unban" : "Ban"}</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </main>
</div>
</body>
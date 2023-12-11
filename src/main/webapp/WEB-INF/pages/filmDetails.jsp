<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value='${sessionScope["user"]}' var="user"/>
<body>
<div class="wrapper">
    <%--    <%@ include file="/header.jsp" %>--%>
    <main class="content">
        <a class="back" href="${pageContext.servletContext.contextPath}/films"><</a>
        <div class="film-details">
            <div class="film-details-left">
                <img src="${film.getImg()}" alt="${film.getName()}" class="poster">
                <div class="btn-wrapper">
                    <c:choose>
                        <c:when test="${reviews.size() > 0 && reviews.get(0).getUserId() == user.getId()}">
                            <button class="btn-add-review" disabled="disabled">
                                <span>+</span>
                                Add review
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn-add-review" onclick="openReviewModal()">
                                <span>+</span>
                                Add review
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="film-details-right">
                <div class="film-name">
                    ${film.getName()}
                    <span class="film-rating">${film.getRating()}</span>
                </div>
                <div class="film-description">${film.getDescription()}</div>
                <div class="film-reviews">
                    <h2 class="reviews-header">Reviews</h2>
                    <c:forEach var="review" items="${reviews}">
                        <div class="review">
                            <div class="review-top">
                                <p class="user">${review.getUserName()}</p>
                                <p class="user-rating ${review.getUserRole() == "admin" ? "cyan" : review.getUserRating() >= 0 ? "green" : "red"}">
                                        ${review.getUserRole() == "admin" ?
                                        "ADMIN" :
                                        (review.getUserRating() > 0 ? '+' : '').concat(review.getUserRating())}
                                </p>
                                <p class="review-rating">${review.getRating()}</p>
                                <c:if test="${user.getName() == review.getUserName()}">
                                    <form action="${pageContext.servletContext.contextPath}/films/review/delete"
                                          method="post" style="margin-left: auto">
                                        <input type="hidden" name="filmId" value="${film.getId()}">
                                        <input type="hidden" name="reviewId" value="${review.getId()}">
                                        <button class="delete-button">Delete</button>
                                    </form>
                                </c:if>

                            </div>
                            <p class="text">${review.getText()}</p>
                        </div>
                    </c:forEach>
                </div>
                <div class="modal-wrapper" id="reviewModal">
                    <div class="modal-form">
                        <h2 class="modal-header">Add review</h2>
                        <form action="${pageContext.servletContext.contextPath}/films/review/add" method="post">
                            <input type="hidden" name="filmId" value="${film.getId()}">
                            <label for="userRating">Rating:</label>
                            <input
                                    id="userRating"
                                    type="number"
                                    name="rating"
                                    value="10"
                                    min="1"
                                    max="10"
                                    step="0.1"
                                    required
                            >
                            <label for="reviewText">Review:</label>
                            <textarea name="text" id="reviewText" required></textarea>
                            <button class="modal-submit" type="submit">Submit Review</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<script>
    openReviewModal = () => {
        const modal = document.getElementById("reviewModal");
        modal.style.display = "flex";
    }

    window.onclick = (event) => {
        const modal = document.getElementById("reviewModal");
        if (event.target === modal) {
            const userRatingInput = document.getElementById("userRating");
            const reviewTextInput = document.getElementById("reviewText");
            userRatingInput.value = 10;
            reviewTextInput.value = '';
            modal.style.display = "none";
        }
    }
</script>
</body>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value='${sessionScope["user"]}' var="user"/>
<body>
<div class="wrapper">
    <main class="content">
        <div class="content-top">
            <c:if test="${user.getRole() == 'admin'}">
                <button class="add" onclick="openAddFilmModal()">
                    <span>+</span>
                    Add new film
                </button>
            </c:if>
        </div>
        <div class="films">
            <c:forEach var="film" items="${films}">
                <div class="film">
                    <a href="${pageContext.servletContext.contextPath}/films/${film.getId()}">
                        <img src="${film.getImg()}" alt="${film.getName()}" class="poster">
                        <div class="rating">${film.getRating()}</div>
                        <div class="name">${film.getName()}</div>
                    </a>
                    <c:if test="${user.getRole() == 'admin'}">
                        <button class="add edit"
                                onclick="openEditFilmModal(`${film.getId()}`, `${film.getName()}`, `${film.getDescription()}`, `${film.getImg()}`)">
                            Edit film
                        </button>
                    </c:if>
                </div>
            </c:forEach>
        </div>
        <div class="modal-wrapper" id="addFilmModal">
            <div class="modal-form">
                <h2 class="modal-header">Add new film</h2>
                <form action="${pageContext.servletContext.contextPath}/films/add" method="post">
                    <label for="addFilmTitle">Film Title:</label>
                    <input type="text" name="title" id="addFilmTitle" required>

                    <label for="addFilmDescription">Film Description:</label>
                    <textarea name="description" id="addFilmDescription" required></textarea>

                    <label for="addFilmImgUrl">Film Image URL:</label>
                    <input type="text" name="imgUrl" id="addFilmImgUrl" required>

                    <button class="modal-submit" type="submit">
                        Add
                    </button>
                </form>
            </div>
        </div>
        <div class="modal-wrapper" id="editFilmModal">
            <div class="modal-form">
                <h2 class="modal-header">Edit film</h2>
                <form action="${pageContext.servletContext.contextPath}/films/edit" method="post">
                    <input type="hidden" name="filmId" id="editFilmId" value="">
                    <label for="editFilmTitle">Film Title:</label>
                    <input type="text" name="title" id="editFilmTitle" required>

                    <label for="editFilmDescription">Film Description:</label>
                    <textarea name="description" id="editFilmDescription" required></textarea>

                    <label for="editFilmImgUrl">Film Image URL:</label>
                    <input type="text" name="imgUrl" id="editFilmImgUrl" required>

                    <button class="modal-submit" type="submit">
                        Confirm
                    </button>
                </form>
            </div>
        </div>
    </main>
</div>
<script>
    openAddFilmModal = () => {
        const modal = document.getElementById("addFilmModal");
        modal.style.display = "flex";
    }

    openEditFilmModal = (filmId, filmTitle, filmDescription, imgUrl) => {
        const modal = document.getElementById("editFilmModal");
        modal.style.display = "flex";
        document.getElementById("editFilmId").value = filmId;
        document.getElementById("editFilmTitle").value = filmTitle;
        document.getElementById("editFilmDescription").value = filmDescription;
        document.getElementById("editFilmImgUrl").value = imgUrl;
    }

    window.onclick = (event) => {
        const addModal = document.getElementById("addFilmModal");
        const editModal = document.getElementById("editFilmModal");
        if (event.target === addModal) {
            addModal.style.display = "none";
        }
        if (event.target === editModal) {
            editModal.style.display = "none";
        }
    }
</script>
</body>

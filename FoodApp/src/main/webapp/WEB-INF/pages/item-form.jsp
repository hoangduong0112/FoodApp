<%-- 
    Document   : item-form
    Created on : May 2, 2023, 8:03:59 PM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/partner/my-store/item/save" var="action" />
<form:form method="post" action="${action}" modelAttribute="item" enctype="multipart/form-data" >

    <div class="mb-3">
        <label for="NameInput" class="form-label">Tên sản phẩm:</label>
        <form:input type="text" class="form-control" id="name" name="name" path="name" />
        <div class="form-text">
            Tên sản phẩm của cửa hàng
        </div>
    </div>

    <div class="mb-3">
        <label for="PriceInput" class="form-label">Giá tiền:</label>
        <form:input type="number" class="form-control" id="price" name="price" path="price" />
        <div class="form-text">
            Giá của sản phẩm
        </div>
    </div>
    <div class="mb-3">
        <label for="NameInput" class="form-label">Menu:</label>
        <form:select class="form-select mb-3" id="menuId" name="menuId" path="menuId">
            <c:forEach items="${menus}" var="m">
                <c:choose>
                    <c:when test="${m.id == item.menuId.id}">
                        <option value="${m.id}" selected>${m.name}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${m.id}">${m.name}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <div class="form-text">
            Menu chứa sản phẩm
        </div>
    </div>
    <c:choose>
        <c:when test="${item.id > 0}">
            <form:hidden path="id" />
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </c:when>
        <c:otherwise>
            <button type="submit" class="btn btn-primary">Thêm</button>
        </c:otherwise>
    </c:choose>



</form:form>

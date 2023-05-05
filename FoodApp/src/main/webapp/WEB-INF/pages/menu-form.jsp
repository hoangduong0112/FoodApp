<%-- 
    Document   : menu-form
    Created on : May 2, 2023, 8:03:05 PM
    Author     : Duong Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/partner/my-store/menu/save" var="action"/>
<form:form method="post" action="${action}" modelAttribute="menu"  accept-charset="UTF-8" enctype="multipart/form-data">
     <form:errors path="*" element="div" cssClass="alert alert-danger"/>
    <div class="mb-3">
        <label for="NameInput" class="form-label">Tên menu:</label>
        <form:input type="text" class="form-control" id="name" name="name" path="name" />
        <div class="form-text">
            Tên loại menu của cửa hàng
        </div>
    </div>
    <div class="form-floating my-3">
        <c:choose>
            <c:when test="${menu.id > 0}">
                <form:hidden path="id" />
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </c:when>
            <c:otherwise>
                <button type="submit" class="btn btn-primary">Thêm</button>
            </c:otherwise>
        </c:choose>
    </div>
</form:form>
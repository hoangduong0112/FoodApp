<%-- 
    Document   : form-store
    Created on : Apr 23, 2023, 2:07:13 PM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form method="post" action="${action}" modelAttribute="store" enctype="multipart/form-data">
    <div class="form-floating mb-3">
        <form:input type="text" class="form-control" id="name" placeholder="Tên cửa hàng" name="name" path="name"/>
        <label for="name">Tên cửa hàng:</label>
    </div>
    <div class="form-floating mb-3">
        <form:input type="text" class="form-control" id="address" placeholder="Nhập địa chỉ" name="address" path="address"/>
        <label for="address">Địa chỉ:</label>
    </div>
    <div class="form-floating mb-3">
        <form:input type="sdt" class="form-control" id="sdt" placeholder="Nhập số điện thoại" name="sdt" path="sdt"/>
        <label for="sdt">Số điện thoại:</label>
    </div>
    <div class="form-floating">
        <form:select class="form-select" id="categoryId" name="categoryId" path="categoryId">
            <c:forEach items="${categories}" var="c">
                <c:choose>
                    <c:when test="${store.categoryId.id == c.id}">
                        <option value="${c.id}" selected>${c.name}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${c.id}">${c.name}</option>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
        </form:select>
        <label for="categoryId" class="form-label">Danh mục sản phẩm:</label>
    </div>
    <div class="form-floating mt-3">
        <c:if test="${store.image == null && store.image == ''}">
            <img src="${store.image}" width="200">
        </c:if>
        <form:input type="file" class="form-control" id="file" name="file" path="file"/>
        <label for="file">Ảnh cửa hàng:</label>
    </div>
    <div class="form-floating my-3">
        <c:choose>
            <c:when test="${store.id > 0}">
                <form:hidden path="id" />
                <form:hidden path="image" />
                <input type="submit" value="Cập nhật Cửa hàng" class="btn btn-success" />
            </c:when>
            <c:otherwise>
                <input type="submit" value="Tạo Cửa hàng" class="btn btn-danger"/>
            </c:otherwise>
        </c:choose>

    </form:form>

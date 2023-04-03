<%-- 
    Document   : stores
    Created on : Apr 3, 2023, 3:43:35 AM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
        <h2 class="font-weight-semi-bold text-uppercase mb-3">Contact Us</h1>
    </div>
</div>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">${errMsg}</div>
</c:if>
<c:url value="/admin/stores" var="action"/>
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
                <option value="${c.id}">${c.name}</option>
            </c:forEach>
        </form:select>
        <label for="categoryId" class="form-label">Danh mục sản phẩm:</label>
    </div>
    <div class="form-floating mt-3">
        <form:input type="file" class="form-control" id="file" name="file" path="file"/>
        <label for="file">Ảnh cửa hàng:</label>
    </div>
    <div class="form-floating my-3">
        <input type="submit" value="Tạo Cửa hàng" class="btn btn-danger"/>
    </div>
</form:form>
<%-- 
    Document   : stores
    Created on : Apr 3, 2023, 3:43:35 AM
    Author     : Duong Hoang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center text-dark" style="min-height: 100px">
        <h2 class="font-weight-semi-bold text-uppercase mb-3">List of stores</h1>
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

    <div class="col-12">
        <div class="bg-light rounded h-100 p-4">
            <h6 class="mb-4">Danh sách cửa hàng</h6>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr id="store${s.id}">
                            <th scope="col">id</th>
                            <th scope="col">tên</th>
                            <th scope="col">image</th>
                            <th scope="col">cate</th>
                            <th scope="col">user</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${stores}" var="s">
                            <tr>
                                <th scope="row">${s.id}</th>
                                <td>${s.name}</td>
                                <td>
                                    <img src="${s.image}" width="90" />
                                </td>
                                <td>${s.categoryId.name}</td>
                                <td>${s.userId.username}</td>
                                <td>
                                    <c:url value="/api/stores/${s.id}" var="endpoint" />
                                    <input  type="button" onclick="deleteProduct('${endpoint}', ${s.id})" value="Xóa" class="btn btn-sm btn-danger" />
                                    <a href="<c:url value="/admin/stores/${s.id}" />" class="btn btn-sm btn-primary">Cập nhật</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
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
<c:url value="/admin/stores/add" var="add"/>
<a href="${add}">Tạo mới 1 cửa hàng</a>

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
                        <tr id="store${s.id}">
                            <th scope="row">${s.id}</th>
                            <td>${s.name}</td>
                            <td>
                                <img src="${s.image}" width="90" />
                            </td>
                            <td>${s.categoryId.name}</td>
                            <td>${s.userId.username}</td>
                            <td>
                                
                                <a href="javascript:;" class="text-danger mx-3" data-bs-toggle="modal" data-bs-target="#confirmDeleteStore${s.id}">
                                    Xóa
                                </a>

                                <!-- Confirmation modal -->
                                <div class="modal fade" id="confirmDeleteStore${s.id}" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Deletion</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Bạn có chắc chắn xóa cửa hàng này không, nó sẽ xóa toàn bộ menu và item của cửa hàng ?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>

                                                <c:url value="/api/stores/${s.id}" var="endpoint" />
                                                <button type="button" class="btn btn-danger" onclick="deleteStore('${endpoint}',${s.id})">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <a href="<c:url value="/admin/stores/${s.id}" />" class="btn btn-sm btn-primary">Cập nhật</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
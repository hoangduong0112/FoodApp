<%-- 
    Document   : my-store
    Created on : Apr 18, 2023, 9:12:07 PM
    Author     : Duong Hoang
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">${errMsg}</div>
</c:if>
<c:if test="${errMsg == null}">
    <div class="container-fluid pt-4 px-4">
        <div class="row vh-10 bg-light rounded justify-content-center mx-0">
            <div class="bg-light rounded h-100 p-4">
                <h3 class="mb-4">Bạn đang quản trị cửa hàng:<mark class="bg-info">${myStore.name}</mark></h6>
                    <dl class="row mb-0">
                        <dt class="col-sm-4">Địa chỉ:</dt>
                        <dd class="col-sm-8">${myStore.address}</dd>

                        <dt class="col-sm-4">Số điện thoại:</dt>
                        <dd class="col-sm-8">${myStore.sdt}</dd>

                        <dt class="col-sm-4">Danh mục:</dt>
                        <dd class="col-sm-8">${myStore.categoryId.name}</dd>

                        <dt class="col-sm-4">Hình ảnh minh họa cửa hàng:</dt>
                        <dd class="col-sm-8">
                            <img src="${myStore.image}" width="250" />
                        </dd>

                    </dl>
            </div>
            <div class="d-flex align-items-center mb-4">
                <c:url value="/partner/my-store/menu/add" var="addMenu"/>
                <a href="${addMenu}" class="mr-3">Thêm 1 loại menu</a>
                <!-- Modal -->
                <c:url value="/partner/my-store/item/add" var="addItem"/>        
                <a href="${addItem}" class="mx-3">Thêm 1 sản phẩm cho cửa hàng</a>     
                <a href="<c:url value="/partner/my-store/edit"/>" class="mx-3">Chỉnh sửa</a>
            </div>
            <c:if test="${errMsg != null}">
                <div class="alert alert-danger">${errMsg}</div>
            </c:if>
        </div>
    </div>
    <c:forEach items="${menus}" var="menu">
        <div class="container-fluid pt-4 px-4" id="menu${menu.id}">
            <div class="row vh-10 bg-light rounded justify-content-center mx-0">
                <div class="bg-light rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">${menu.name}</h6>

                        <div class="justify-content-end">

                            <!-- Button to trigger the confirmation modal -->
                            <a href="javascript:;" class="text-danger mx-3" data-bs-toggle="modal" data-bs-target="#confirmDeleteMenu${menu.id}">
                                Xóa
                            </a>

                            <!-- Confirmation modal -->
                            <div class="modal fade" id="confirmDeleteMenu${menu.id}" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Deletion</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Are you sure you want to delete this menu?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>

                                            <c:url value="/api/deleteMenu/${menu.id}" var="endpoint"/>
                                            <button type="button" class="btn btn-danger" onclick="deleteMenu('${endpoint}',${menu.id})" data-bs-dismiss="modal">Delete</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="<c:url value="/partner/my-store/menu/${menu.id}" />" class="mx-3">Chỉnh sửa Menu</a>              
                        </div>
                    </div>

                    <div class="table-responsive">

                        <table class="table text-start align-middle table-bordered mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th>Tên món</th>
                                    <th>Giá tiền</th> 
                                    <th>Tình trạng</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${menuItems}" var="items">
                                    <c:if test="${items[0].menuId.id == menu.id}">
                                        <c:forEach items="${items}" var="item">
                                            <tr id="item${item.id}">
                                                <td style="min-width: 250px">${item.name}</td>
                                                <td>${item.price}</td>
                                                <td>
                                                    <c:if test="${item.active}">
                                                        <p class="text-success">Đang mở bán</p>
                                                    </c:if>
                                                    <c:if test="${!item.active}">
                                                        <p class="text-danger">Không mở bán</p>
                                                    </c:if>

                                                </td>
                                                <td style="max-width: 125px">
                                                    <div class="d-flex">
                                                        <a href="<c:url value="/partner/my-store/item/${item.id}" />" class="mx-3 btn btn-sm btn-primary">Cập nhật</a>

                                                        <a href="javascript:;" class="btn btn-sm btn-danger mx-3" data-bs-toggle="modal"  data-bs-target="#confirmDeleteItem${item.id}">
                                                            Xóa
                                                        </a>
                                                        <div class="modal fade" id="confirmDeleteItem${item.id}" tabindex="-1" aria-labelledby="confirmDeleteItemLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="confirmDeleteItemLabel">Confirm Deletion</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Are you sure you want to delete this menu?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                        <c:url value="/api/deleteItem/${item.id}" var="endpoint"/>
                                                                        <button type="button" class="btn btn-danger" onclick="deleteMenuItem('${endpoint}',${item.id})" data-bs-dismiss="modal">Delete</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
<%-- 
    Document   : my-store
    Created on : Apr 18, 2023, 9:12:07 PM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <a href="javascript:;" class="mr-3" data-bs-toggle="modal" data-bs-target="#AddNewMenu">Thêm 1 loại menu</a>
            <!-- Modal -->
            <c:url value="/partner/my-store" var="addmenu"/>
            <form:form method="post" action="${addmenu}" modelAttribute="menu" >
                <div class="modal fade" id="AddNewMenu" tabindex="-1" aria-labelledby="addMenuLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addMenuLabel">Modal title</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <div class="mb-3">
                                    <label for="NameInput" class="form-label">Tên menuL</label>
                                    <form:input type="text" class="form-control" id="name" name="name" path="name" />
                                    <div class="form-text">
                                        Tên loại menu
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-primary">Tạo</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
            <a href="javascript:;" class="mx-3" data-bs-toggle="modal" data-bs-target="#addItem">Thêm 1 sản phẩm cho Menu ${menu.name}</a>
            <!-- Modal -->
            <c:url value="/partner/my-store/item" var="additem" />
            <form:form method="post" action="${additem}" modelAttribute="item" >
                <div class="modal fade" id="addItem" tabindex="-1" aria-labelledby="AddItemLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="AddItemLabel">Thêm 1 sản phẩm vào</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <div class="mb-3">
                                    <label for="NameInput" class="form-label">Tên sản phẩm:</label>
                                    <form:input type="text" class="form-control" id="name" name="name" path="name" />
                                    <div class="form-text">
                                        Tên sản phẩm của cửa hàng
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="NameInput" class="form-label">Giá tiền:</label>
                                    <form:input type="number" class="form-control" id="price" name="price" path="price" />
                                    <div class="form-text">
                                        Giá của sản phẩm
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="NameInput" class="form-label">Menu:</label>
                                    <form:select class="form-select mb-3" id="menuId" name="menuId" path="menuId">
                                        <c:forEach items="${menus}" var="m">

                                            <option value="${m.id}">${m.name}</option>


                                        </c:forEach>
                                    </form:select>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-primary">Tạo</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
            <a href="" class="mx-3">Chỉnh sửa</a>
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
                                        <button type="button" class="btn btn-danger" onclick="deleteMenu('${endpoint}',${menu.id})">Delete</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a href="javascript:;" class="mx-3" data-bs-toggle="modal" data-bs-target="#UpdateMenu${menu.id}">Chỉnh sửa Menu</a>
                        <!-- Modal -->
                        <c:url value="/partner/my-store/${menu.id}" var="updatemenu"/>
                        <form:form method="post" action="${updatemenu}" modelAttribute="menu" >
                            <div class="modal fade" id="UpdateMenu${menu.id}" tabindex="-1" aria-labelledby="UpdateMenuLabel${menu.id}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="UpdateMenuLabel${menu.id}">Menu</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">

                                            <div class="mb-3">
                                                <label for="NameInput" class="form-label">Tên menu</label>
                                                <form:input type="text" class="form-control" id="name" name="name" path="name" />
                                                <div class="form-text">
                                                    Tên loại menu
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <form:hidden path="id" />
                                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>

                    </div>
                </div>

                <div class="table-responsive">

                    <table class="table text-start align-middle table-bordered mb-0">
                        <thead>
                            <tr class="text-dark">
                                <th>Tên món</th>
                                <th>Giá tiền</th>                      
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
                                            <td style="max-width: 100px">
                                                <div class="d-flex">
                                                    <a href="javascript:;" class="mx-3 btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#updateItem${item.id}">Detail</a>
                                                    <!-- Modal -->
                                                    <c:url value="/partner/my-store/item/${item.id}" var="updateitem" />
                                                    <form:form method="post" action="${updateitem}" modelAttribute="item" >
                                                        <div class="modal fade" id="updateItem${item.id}" tabindex="-1" aria-labelledby="UpdateItemLabel${item.id}" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="UpdateItemLabel${item.id}">Thêm 1 sản phẩm vào</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <div class="mb-3">
                                                                            <label for="NameInput" class="form-label">Tên sản phẩm:</label>
                                                                            <c:choose>
                                                                                        <c:when test="${m.name != null}">
                                                                                            <form:input type="text" class="form-control" id="name" name="name" path="name" defaultValue="${m.name}"/>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <form:input type="text" class="form-control" id="name" name="name" path="name" />
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                            
                                                                            <div class="form-text">
                                                                                Tên sản phẩm của cửa hàng
                                                                            </div>
                                                                        </div>

                                                                        <div class="mb-3">
                                                                            <label for="NameInput" class="form-label">Giá tiền:</label>
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

                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                        <form:hidden path="id" />
                                                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </form:form>
                                                    <a href="javascript:;" class="btn btn-sm btn-danger mx-3" data-bs-toggle="modal"  data-bs-target="#confirmDeleteItem${item.id}">
                                                        Xóa
                                                    </a>

                                                    <!-- Confirmation modal -->
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
                                                                    <button type="button" class="btn btn-danger" onclick="deleteMenuItem('${endpoint}',${item.id})">Delete</button>
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

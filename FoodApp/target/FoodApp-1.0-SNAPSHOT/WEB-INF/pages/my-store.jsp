<%-- 
    Document   : my-store
    Created on : Apr 18, 2023, 9:12:07 PM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <div class="row vh-10 bg-light rounded justify-content-center mx-0">
        <div>
            <h3>Bạn đang quản trị cửa hàng: ${store.name}</h3>
                
        </div>
        
    </div>
    <div class="bg-light text-center rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h6 class="mb-0">Menu hiện tại</h6>
            <a href="">Tạo mới  l menu</a>
        </div>
        <div class="table-responsive">
            <table class="table text-start align-middle table-bordered table-hover mb-0">
                <thead>
                    <tr class="text-dark">
                        <th scope="col">Tên loại menu</th>
                        <th scope="col">Giờ bắt đầu bán</th>
                        <th scope="col">Giờ kết thúc bán</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="menus" items="${menus}">
                        <tr>
                            <td>${menus.name}</td>
                            <td>0:00</td>
                            <td>23:59</td>
                            <td>
                                <
                                <a class="btn btn-sm btn-primary">Detail</a></td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


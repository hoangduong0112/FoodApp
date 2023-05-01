<%-- 
    Document   : checkout
    Created on : Apr 28, 2023, 8:44:59 PM
    Author     : Duong Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-12">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">Đơn hàng ${orderSale.id}</h6>
        <p>${orderSale.totalAmount}</p>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr id="">
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Giá tiền</th>
                        <th scope="col">Cửa hàng</th>                      
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${items}" var="s">
                        <tr>
                            <th scope="row">${s.itemId.name}</th>
                            <td>${s.price}</td>
                            <td>${s.quantity}</td>
                            <td>test</td>
                            <td>
                                
                               
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
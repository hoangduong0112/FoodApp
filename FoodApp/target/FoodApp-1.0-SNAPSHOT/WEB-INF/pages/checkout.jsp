<%-- 
    Document   : checkout
    Created on : Apr 28, 2023, 8:44:59 PM
    Author     : Duong Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-md-3">
    <div class="row" style="margin-top: 4rem; width: 100%; height: 100%">
        <div class="col-md-6">
            <div class="card" >
                <div class="card-body ">
                    <h6 class="card-subtitle mb-2 text-muted text-center">
                        Cảm ơn Quý khách đặt hàng
                    </h6>
                    <p class="card-text text-white bg-dark text-center" style="padding: .4rem; margin-top: 2rem">
                        Đơn hàng của quý khách đang được xử lý
                    </p>
                    <div class="card-text text-white text-center bg-primary" style="padding: 1rem">
                        Mã đặt hàng của Quý khách là:<br>
                        <h4 style="margin: 0; margin-top: .5rem; padding: 0">${result.id}</h4>
                    </div>
                    <div class="card-text text-center" style="font-size: small; margin-top: 1rem">
                        <div class="col-lg-8 table-responsive mb-5">
                            <table class="table table-bordered text-center mb-0">
                                <thead class="bg-secondary text-dark">
                                    <tr>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng</th>
                                    </tr>
                                </thead>
                                <tbody class="align-middle" id="cart-body">
                                    <c:forEach items="${items}" var="c">
                                        <c:url value="/api/cart/${c.id}" var="endpoint" />
                                        <tr>
                                            <td class="align-middle"> ${c.itemId.name}</td>
                                            <td class="align-middle">${c.itemId.price}</td>
                                            <td class="align-middle">  ${c.quantity}                                     
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- 
    Document   : detail.jsp
    Created on : Mar 28, 2023, 11:55:53 PM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/api/cart" var="endpoint" />
<div class="row px-xl-5 justify-content-center">
    <div class="col-lg-5 pb-5">

        <img class="w-100 h-100" src="${store.image}" alt="${store.name}">

    </div>

    <div class="col-lg-5 pb-5">
        <h4 class="font-weight-semi-bold">${store.name}</h4>
        <h5 style="display:inline">Địa chỉ:</h5> <span class="mb-4"> ${store.address}
        </span>

        <div class="d-flex pt-2">
            <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
            <div class="d-inline-flex">
                <a class="text-dark px-2" href="">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-twitter"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-pinterest"></i>
                </a>
            </div>
        </div>
    </div>        
</div>
<div class="row px-xl-5 justify-content-center">
    <div class="col-lg-8 pb-5">
        <c:forEach items="${menus}" var="menu">
            <h4>>${menu.name}</h4>
            <div class="table-responsive">
                <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Price</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${menuItemsList}" var="items">
                            <c:if test="${items[0].menuId.id == menu.id}">
                                <c:forEach items="${items}" var="item">
                                    <tr>
                                        <td style="width: 50%;">${item.name}</td>
                                        <td style="width: 30%;">${item.price}đ</td>
                                        <td style="width: 20%;">
                                            <a href="javascript:;" onclick="addToCart('${endpoint}', ${item.id}, '${item.name}', ${item.price})" class="btn-sm btn-primary rounded">Add to cart</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:forEach>
    </div>
</div>
<script src="<c:url value="/js/cart.js" />"></script>
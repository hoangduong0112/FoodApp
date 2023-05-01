<%-- 
    Document   : cart
    Created on : Apr 27, 2023, 2:33:50 PM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/api/cart/${c.id}" var="endpoint" />

<c:if test="${carts != null}">  

    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Đơn giá </th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle" id="cart-body">
                        <c:forEach items="${carts.values()}" var="c">
                            <c:url value="/api/cart/${c.id}" var="endpoint" />
                            <tr id="cart${c.id}">
                                <td class="align-middle"> ${c.id}</td>
                                <td class="align-middle">${c.name}</td>
                                <td class="align-middle">
                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                        <!--                                        <div class="input-group-btn">
                                                                                    <button class="btn btn-sm btn-primary btn-minus" >
                                                                                        <i class="fa fa-minus"></i>
                                                                                    </button>
                                                                                </div>
                                                                                <input type="text" class="form-control form-control-sm bg-secondary text-center" value="${c.quantity}">
                                                                                <div class="input-group-btn">
                                                                                    <button class="btn btn-sm btn-primary btn-plus">
                                                                                        <i class="fa fa-plus"></i>
                                                                                    </button>
                                                                                </div>-->
                                        <input type="number" value="${c.quantity}"
                                               onblur="updateItem('${endpoint}', this)"
                                               class="form-control" />
                                    </div>
                                </td>
                                <td class="align-middle">${c.price}</td>
                                <td class="align-middle"><button onclick="deleteItem('${endpoint}', ${c.id})" class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <!--            <form class="mb-5" action="">
                                <div class="input-group">
                                    <input type="text" class="form-control p-4" placeholder="Coupon Code">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary">Apply Coupon</button>
                                    </div>
                                </div>
                            </form>-->
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <!--                        <div class="d-flex justify-content-between mb-3 pt-1">
                                                    <h6 class="font-weight-medium">Subtotal</h6>
                                                    <h6 class="font-weight-medium">$150</h6>
                                                </div>-->
                        <!--                    <div class="d-flex justify-content-between">
                                                <h6 class="font-weight-medium">Shipping</h6>
                                                <h6 class="font-weight-medium">$10</h6>
                                            </div>-->
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">${cartStats.totalAmount}</h5>
                        </div>
                        <c:choose>
                            <c:when test="${pageContext.request.userPrincipal.name == null}">
                                <c:url value="/login" var="login"/>
                                <a href="${login}" class="btn btn-block btn-primary my-3 py-3">Đăng nhập để thanh toán</a>
                            </c:when>
                            <c:when test="${pageContext.request.userPrincipal.name != null}">
                                <c:url value="/api/pay" var="payUrl" />
                                <button onclick="pay('${payUrl}')" class="btn btn-block btn-primary my-3 py-3">Thanh toán</button>
                            </c:when>
                        </c:choose>         

                    </div>
                </div>
            </div>
        </div>
    </div>

</c:if>
<script src="<c:url value="/js/cart.js" />"></script>
<%-- 
    Document   : order-items
    Created on : May 3, 2023, 1:13:53 AM
    Author     : Duong Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center text-white" style="min-height: 100px">
        <h2 class="font-weight-semi-bold text-uppercase mb-3">Danh sách đặt hàng</h1>
    </div>
</div>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">${errMsg}</div>
</c:if>
<div class="container-fluid mb-5">
    <form class="my-2">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="status" id="status-all" value="" checked>
            <label class="form-check-label" for="status-all">Tất cả</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="status" id="status-waiting" value="WAITING" <c:if test="${status == 'WAITING'}">checked </c:if>>
                <label class="form-check-label" for="status-waiting">Đang chờ xác nhận</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="status" id="status-accept" value="ACCEPT" <c:if test="${status == 'ACCEPT'}">checked</c:if>>
                <label class="form-check-label" for="status-accept">Đã xác nhận</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="status" id="status-decline" value="DECLINE" <c:if test="${status == 'DECLINE'}">checked</c:if>>
                <label class="form-check-label" for="status-decline">Đã từ chối</label>
            </div>
            <button type="submit" class="btn btn-primary">Lọc</button>
        </form>
        <div class="container-fluid bg-secondary mb-5">
            <div class="row">
                <div class="bg-light rounded h-100 p-4">
                    <h6 class="mb-4"></h6>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Mã Đơn hàng</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Ngày đặt hàng</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orderItems}" var="i">
                                <tr id="orderItem-${i.id}">
                                    <th scope="row">${i.itemId.name}</th>
                                    <td>${i.quantity}</td>
                                    <td>${i.orderId.id}</td>
                                    <td class="status">${i.status}</td>
                                    <td>${i.orderId.createdDate}</td>
                                    <c:if test="${i.status eq 'WAITING'}">
                                        <td>
    <!--                                        <button class="btn btn-sm btn-primary btn-accept" data-order-item-id="${i.id}" onclick="acceptOrderItem(${i.id})">Xác nhận</button>-->
                                            <a href="<c:url value="/partner/order/${i.id}/accept" />" class="btn btn-sm btn-primary">Đồng ý</a>

                                        </td>
                                        <td>                     
                                            <a href="<c:url value="/partner/order/${i.id}/decline" />" class="btn btn-sm btn-danger">Từ chối</a>

                                        </td>
                                    </c:if>
                                    <c:if test="${i.status ne 'WAITING'}">
                                        <td colspan="2">
                                            <h5 class="text-success text-sm-start">Đã xử lý</h5>
                                        </td>
                            </c:if>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>


    function acceptOrderItem(orderItemId) {
        $.ajax({
            url: "/api/orderItems/accept/" + orderItemId,
            type: "PUT",
            success: function (result) {
                $('.status[data-order-item-id="' + orderItemId + '"]').text('Đã xác nhận');
                $('.btn-accept[data-order-item-id="' + orderItemId + '"]').prop('disabled', true);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error accepting order item: " + errorThrown);
            }
        });
    }

</script>
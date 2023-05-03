<%-- 
    Document   : order-items
    Created on : May 3, 2023, 1:13:53 AM
    Author     : Duong Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:csrfMetaTags />
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center text-white" style="min-height: 100px">
        <h2 class="font-weight-semi-bold text-uppercase mb-3">Danh sách đặt hàng</h1>
    </div>
</div>
<form class="my-2">
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="status" id="status-all" value="" checked>
        <label class="form-check-label" for="status-all">Tất cả</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="status" id="status-pending" value="WAITING" <c:if test="${status == 'WAITING'}">checked </c:if>>
            <label class="form-check-label" for="status-waiting">Đang chờ xác nhận</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="status" id="status-processed" value="ACCEPT" <c:if test="${status == 'ACCEPT'}">checked</c:if>>
            <label class="form-check-label" for="status-accept">Đã xác nhận</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="status" id="status-processed" value="DECLINE" <c:if test="${status == 'DECLINE'}">checked</c:if>>
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
                                <td>
                                    <button class="btn btn-sm btn-primary btn-accept" data-order-item-id="${i.id}" onclick="acceptOrderItem(${i.id})">Xác nhận</button>
                                </td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<!--    <script type="text/javascript">
        var csrfParameter = '${_csrf.parameterName}';
        var csrfToken = '${_csrf.token}';
    </script>
    <script>
        var jsonParams = {};
        jsonParams['parentId'] = 1;
        jsonParams[csrfParameter] = csrfToken;
        function acceptOrderItem(orderItemId) {
            $.ajax({
                url: '/order/accept/' + orderItemId,
                type: 'PUT',
                success: function (result) {
                    $('.status[data-order-item-id="' + orderItemId + '"]').text('Đã xác nhận');
                    $('.btn-accept[data-order-item-id="' + orderItemId + '"]').prop('disabled', true);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log('Error accepting order item: ' + errorThrown);
                }
            });
        }
    </script>-->
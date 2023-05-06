<%-- 
    Document   : adminSidebar
    Created on : Apr 19, 2023, 1:31:52 PM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <a href="" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="${pageContext.session.getAttribute("currentUser").avatar}" alt="avatar" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">${pageContext.session.getAttribute("currentUser").hoten}e</h6>
                <span>${pageContext.session.getAttribute("currentUser").userRole}</span>
            </div>
        </div>
        <hr />
        <div class="navbar-nav w-100">

            <sec:authorize access="hasRole('ROLE_PARTNER')">
                <a href="<c:url value='/partner/my-store' />" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Cửa hàng của tôi</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a href="<c:url value='/admin/stores' />" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Quản lý cửa hàng</a>
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_PARTNER')">
                <a href="<c:url value="/partner/order" />" class="nav-item nav-link"><i class="fa fa-laptop me-2"></i>Đơn hàng</a>    
            </sec:authorize>
            <a href="<sec:authorize access="hasRole('ROLE_PARTNER')"><c:url value='/partner/stats' /></sec:authorize>
               <sec:authorize access="hasRole('ROLE_ADMIN')"><c:url value='/admin/stats' /></sec:authorize>" 
               class="nav-item nav-link">
                <i class="fa fa-chart-bar me-2"></i>Thống kê
            </a>
        </div>
    </nav>
</div>
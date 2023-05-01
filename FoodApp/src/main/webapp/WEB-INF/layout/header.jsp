<%-- 
    Document   : header
    Created on : Mar 27, 2023, 2:16:44 PM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container-fluid">
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <div class="row bg-secondary py-2 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark" href="">FAQs</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Help</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Support</a>
            </div>
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
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
                    <i class="fab fa-instagram"></i>
                </a>
                <a class="text-dark pl-2" href="">
                    <i class="fab fa-youtube"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <c:url value="/" var="action" />
            <form action="${action}">
                <div class="input-group">
                    <input type="text" class="form-control" name="kw" placeholder="Search for products">
                    <div class="input-group-append">
                        <span class="input-group-text bg-transparent text-primary">
                            <i class="fa fa-search"></i>
                        </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-3 col-6 text-right">
            <a href="" class="btn border">
                <i class="fas fa-heart text-primary"></i>
                <span class="badge" style="color:black">0</span>
            </a>
            <a href="<c:url value="/cart" />" class="btn border">               
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge cart-counter" style="color:black">${cartStats.totalQuantity}</span>
            </a>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid mb-5">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block mx-auto my-2">
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal.name == null}">
                    <a href="#" class="nav-item nav-link text-danger">Trở thành đối tác</a>
                </c:when>
                <c:when test="${pageContext.request.userPrincipal.name != null}">
                    <c:url value="/partner/" var="partner"/>
                    <a href="${partner}" class="nav-item nav-link text-dark">Quản lý cửa hàng</a>
                </c:when>
            </c:choose>    
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <div>
                            <c:url value="/" var="action" />
                            <a href="${action}" class="nav-item nav-link active">Home</a>
                        </div>
                        <c:forEach items="${categories}" var="c">
                            <c:url value="/" var="url">
                                <c:param name="categoryId" value="${c.id}" />
                            </c:url>
                            <a href="${url}" class="nav-item nav-link">${c.name}</a>
                        </c:forEach>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        <c:choose>
                            <c:when test="${pageContext.request.userPrincipal.name == null}">
                                <c:url value="/login" var="login"/>
                                <a href="${login}" class="nav-item nav-link">Login</a>
                                <c:url value="/register" var="register"/>
                                <a href="${register}" class="nav-item nav-link">Register</a>
                            </c:when>
                            <c:when test="${pageContext.request.userPrincipal.name != null}">
                                <a href="javascript:;" class="nav-link">
                                    <img class="rounded-circle me-lg-2" src="${pageContext.session.getAttribute("currentUser").avatar}" alt="" style="width: 40px; height: 40px;">
                                    <span class="d-none d-lg-inline-flex">John Doe</span>
                                </a>
                                <a href="<c:url value="/logout" />" class="nav-item nav-link">Log out</a>
                            </c:when>
                        </c:choose>                   
                    </div>
                </div>
            </nav>

        </div>
    </div>
</div>
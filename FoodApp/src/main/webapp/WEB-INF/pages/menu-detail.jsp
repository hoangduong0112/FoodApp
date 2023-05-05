<%-- 
    Document   : detail.jsp
    Created on : Mar 28, 2023, 11:55:53 PM
    Author     : Duong Hoang
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<c:url value="/api/stores/${store.id}/comments" var="addcomment" />
<sec:authorize access="isAuthenticated()">
    <div>
        <textarea class="form-control" rows="5" id="content" name="content"></textarea>
        <input type="button" value="Them binh luan" onclick="addComment('${url}')" class="btn btn-danger m-1" />
    </div>
</sec:authorize>
<div class="spinner-grow text-primary LoadCommentSpinner" style="display:none"></div>
<div id="comments">

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/cart.js" />"></script>
<script src="<c:url value="/js/comment.js" />"></script>
<script>
            window.onload = function () {
                loadComments('${addcomment}');
            };
</script>
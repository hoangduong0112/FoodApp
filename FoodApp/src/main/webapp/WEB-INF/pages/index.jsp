<%-- 
    Document   : index
    Created on : Mar 20, 2023, 8:14:14 AM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="row px-xl-5 pb-3">
    <c:forEach items="${stores}" var="s">
        <c:url value="/stores/${s.id}" var="detail"/>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" src="${s.image}" alt="">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3 mx-1">${s.name}</h6>
                    <div class="d-flex justify-content-center">
                        <p>${s.address}</h6><h6 class="text-muted ml-2"></p>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="${detail}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i> Xem chi tiết</a>

                    <c:choose>
                        <c:when test="${not empty currentUser}">
                            <c:set var="followed" value="false"/>
                            <c:forEach items="${followedStores}" var="fs">
                                <c:if test="${fs.storeId.id == s.id}">
                                    <c:set var="followed" value="true"/>
                                </c:if>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${followed}">
                                    <c:url value='/api/stores/${s.id}/unfollow' var="unfollowStore" />
                                    <a onclick="UnfollowStore('${unfollowStore}')"class="btn btn-sm text-dark p-0"><i class="fas fa-heart text-danger"></i> Unfollow</a>
                                </c:when>
                                <c:otherwise>
                                    <c:url value='/api/stores/${s.id}/follow' var="followStore" />
                                    <a onclick="FollowStore('${followStore}')" class="btn btn-sm text-dark p-0"><i class="fas fa-heart text-primary"></i> Theo dõi</a>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value="/login" />" class="btn btn-sm text-dark p-0"><i class="fas fa-heart text-primary"></i> Theo dõi</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </c:forEach>

</div>


<%-- 
    Document   : register
    Created on : Apr 3, 2023, 5:22:01 PM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">    
    <c:if test="${errMsg != null}">
        <div class="alert alert-danger">${errMsg}</div>
    </c:if>
    <div class="row">
        <section class="offset-md-3 col-md-6">

            <div class="card shadow p-5">
                <c:url value="/register" var="action"/>
                <h3 class="text-center mb-3 font-time"> Register </h3>
                <form:form method="POST" action="${action}" modelAttribute="user" enctype="multipart/form-data">
                    <form:errors path="*" element="div" cssClass="alert alert-danger"/>
                    <div class="form-group">
                        <form:input path="username" type="text" name="username" id="username" class="form-control rounded-pill" placeholder="Username" />

                    </div>

                    <div class="form-group">
                        <form:input type="password" path="password" name="password" id="password" class="form-control rounded-pill" placeholder="Password" />
                    </div>

                    <div class="form-group">
                        <form:input type="password" path="confirmPassword" name="confirmPassword" id="confirmPassword" class="form-control rounded-pill" placeholder="Confirm password" />
                    </div>

                    <div class="form-group">
                        <form:input type="text" path="hoten" name="hoten" id="hoten" class="form-control rounded-pill" placeholder="Họ và tên" />
                    </div>
                    <div class="form-group">
                        <form:input type="text" path="email" name="email" id="email" class="form-control rounded-pill" placeholder="Email" />
                    </div>
                    <div class="form-group">
                        <form:input type="file" class="form-control" id="file" name="file" path="file"/>
                        <label for="file">Ảnh cửa hàng:</label>
                    </div>
                </div>
                <button class="btn btn-block btn-info rounded-pill" type="submit">Register</button>

            </form:form>

    </div>

</section>
</div>
</div>

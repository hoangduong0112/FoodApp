<%-- 
    Document   : login
    Created on : Apr 3, 2023, 1:25:45 AM
    Author     : Duong Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
  <div class="row" id="loginForm">
    <section class="offset-md-3 col-md-6">

      <div class="card shadow p-5">
        <h3 class="text-center mb-3 font-time"> Đăng nhập </h3>
        <c:if test="${accessDenied != null}"></c:if>
            <h6 class="alert alert-danger">${accessDenied}</h6>
        <c:url value="/login" var="action" />
            <form method="post" action="${action}">

          <div class="form-group">
            <input type="text" name="username" id="username" class="form-control rounded-pill" placeholder="Enter Your Username" />
          </div>

          <div class="form-group">
            <input type="password" name="password" id="password" class="form-control rounded-pill" placeholder="Enter Your Password" />
          </div>

          <div class="form-group">
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="customCheck">
              <label class="custom-control-label" for="customCheck">Remember Me</label>
            </div>
          </div>

          <button class="btn btn-block btn-info rounded-pill" id="submit">Login</button>

        </form>
        <hr>

        <a href="index.html" class="btn btn-danger rounded-pill btn-block">
          <i class="fab fa-google fa-fw"></i> Login with Google
        </a>
        <a href="index.html" class="btn rounded-pill btn-block" style="background-color: blue; color:white">
          <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
        </a>

        <hr>
        <div class="text-center">
          <a class="font-time" href="#">Forgot Password?</a>
        </div>
        <div class="text-center">
          <a class="font-time" href="#">Create an Account!</a>
        </div>

      </div>

    </section>
  </div>
</div>
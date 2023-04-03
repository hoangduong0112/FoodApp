<%-- 
    Document   : register
    Created on : Apr 3, 2023, 5:22:01 PM
    Author     : Duong Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">
    <div class="row">
        <section class="offset-md-3 col-md-6">

            <div class="card shadow p-5">
                <h3 class="text-center mb-3 font-time"> Register </h3>
                <form:form method="POST" action="/register" modelAttribute="user">

                    <div class="form-group">
                        <form:input path="username" type="text" name="username" id="username" class="form-control rounded-pill" placeholder="Enter Your Username" />
                        
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

                    <button class="btn btn-block btn-info rounded-pill" id="submit" onclick="return validate();">Login</button>

                </form:form>

            </div>

        </section>
    </div>
</div>

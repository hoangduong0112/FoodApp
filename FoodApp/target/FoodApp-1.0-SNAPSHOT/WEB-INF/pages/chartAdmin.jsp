<%-- 
    Document   : chartAdmin
    Created on : May 1, 2023, 3:28:49 PM
    Author     : Duong Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-md-7">
        <table class="table table-hover">
            <tr>
                <th>Id</th>
                <th>Tên cửa hàng</th>
                <th>Số lượng sản phẩm</th>
            </tr>
            <c:forEach items="${statsStores}" var="c">
                <tr>
                    <td>${c[0]}</td>
                    <td>${c[1]}</td>
                    <td>${c[2]}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-5">
         <canvas id="myCateChart"></canvas>
    </div>
</div>

<hr />

<div class="row">
    <div class="col-md-7">
        <table class="table table-hover">
            <tr>
                <th>Id</th>
                <th>Tên cửa hàng</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${revenues}" var="r">
                <tr>
                    <td>${r[0]}</td>
                    <td>${r[1]}</td>
                    <td>${r[2]} VNĐ</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-5">
         <canvas id="myRevenueChart"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    let data1 = [], label1 = [];
    <c:forEach items="${statsStores}" var="c">
        label1.push('${c[1]}')
        data1.push(${c[2]});
    </c:forEach>

   let data2 = [], label2 = [];
    <c:forEach items="${revenues}" var="c">
        label2.push('${c[1]}')
        data2.push(${c[2]});
    </c:forEach>
    
    window.onload = function() {
        drawChart(data1, label1, "Số lượng", "bar");
        drawChart(data2, label2, "Doanh thu", "line", "myRevenueChart");
    }
</script>

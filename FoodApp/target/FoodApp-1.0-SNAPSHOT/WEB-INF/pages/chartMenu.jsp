<%-- 
    Document   : chart
    Created on : Apr 29, 2023, 1:47:19 PM
    Author     : Duong Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${revenues != null}" >
    <div class="row">
        <div class="col-md-7">
            <table class="table table-hover">
                <tr>
                    <th>Id</th>
                    <th>Menu</th>
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

        <c:url value="/partner/stats/${id}" var="action">
            <c:param name="fromDate" value="${fromDate}" />
            <c:param name="toDate" value="${toDate}" />
        </c:url>

        <form action="${action}">
            <div class="input-group">
                <label for="fromDate">From:</label>
                <input type="date" id="fromDate" name="fromDate" value="${fromDate}">

                <label for="toDate">To:</label>
                <input type="date" id="toDate" name="toDate" value="${toDate}">
                <input type="submit" value="Submit">
            </div>
        </form>
    </div>
</c:if>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    let data2 = [], label2 = [];
    <c:forEach items="${revenues}" var="c">
    label2.push('${c[1]}')
    data2.push(${c[2]});
    </c:forEach>

    window.onload = function () {
        drawChart(data2, label2, "Doanh thu", "bar", "myRevenueChart");
    }
</script>

<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Tic-Tac-Toe</title>
    <link rel="stylesheet" href="static/main.css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
</head>
<body>
<div class="container">
    <table>

        <h1>Tic-Tac-Toe</h1>
        <tr>
            <td onclick="window.location='/logic?click=0'" class="cell1">${data.get(0).getSign()}</td>
            <td onclick="window.location='/logic?click=1'" class="cell1">${data.get(1).getSign()}</td>
            <td onclick="window.location='/logic?click=2'" class="cell1">${data.get(2).getSign()}</td>
        </tr>
        <tr>
            <td onclick="window.location='/logic?click=3'" class="cell2">${data.get(3).getSign()}</td>
            <td onclick="window.location='/logic?click=4'" class="cell2">${data.get(4).getSign()}</td>
            <td onclick="window.location='/logic?click=5'" class="cell2">${data.get(5).getSign()}</td>
        </tr>
        <tr>
            <td onclick="window.location='/logic?click=6'" class="cell1">${data.get(6).getSign()}</td>
            <td onclick="window.location='/logic?click=7'" class="cell1">${data.get(7).getSign()}</td>
            <td onclick="window.location='/logic?click=8'" class="cell1">${data.get(8).getSign()}</td>
        </tr>

    </table>
    <c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
    <c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

    <c:if test="${winner == CROSSES}">
        <h1>CROSSES WIN!</h1>
        <button onclick="restart()" class="button">Start again</button>
    </c:if>
    <c:if test="${winner == NOUGHTS}">
        <h1>NOUGHTS WIN!</h1>
        <button onclick="restart()" class="button">Start again</button>
    </c:if>
    <c:if test="${draw}">
        <h1>IT'S A DRAW</h1>
        <br>
        <button onclick="restart()" class="button">Start again</button>
    </c:if>
</div>

<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>

</body>
</html>
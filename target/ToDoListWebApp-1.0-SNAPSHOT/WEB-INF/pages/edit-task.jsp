<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page import="com.softserve.itacademy.model.Priority" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit existing Task</title>

    <style>
        <%@include file="../styles/main.css"%>
        <%@include file="../styles/edit-task.css"%>
    </style>

</head>
<body>
<%@include file="../pages/header.html" %>

<form action="<c:url value="/edit-task"/>" method="post">
    <%
        Task task = (Task) request.getAttribute("task");
    %>

    <h2>Edit existing Task</h2>
    <%--TODO css--%>
    <p>${message}</p>

    <table>
        <tr>
            <th>
                <label for="id">Id: </label>
            </th>
            <th>
                <input type="text" id="id" name="idValue" value="<%=task.getId()%>" disabled>
            </th>
        </tr>

        <tr>
            <td>
                <label for="title">Title: </label>
            </td>
            <td>
                <input type="text" id="title" name="title" value="<%=task.getTitle()%>">
            </td>
        </tr>

        <tr>
            <td>
                <label for="priority">Priority: </label>
            </td>
            <td>
                <select id="priority" name="priority">
                    <c:forEach var="priority" items="${Priority.values()}">
                        <option value="${priority}" ${priority == task.priority ? 'selected="selected"' : ''}>${priority}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>

        <tr>
            <td>
                <input type="submit" value="Update">
            </td>
            <td>
                <input type="reset" value="Reset">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
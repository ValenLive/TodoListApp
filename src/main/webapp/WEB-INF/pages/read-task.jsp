<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read existing Task</title>

    <style>
        <%@include file="../styles/main.css"%>
        <%@include file="../styles/read-task.css"%>
    </style>

</head>

<body>
<%@include file="../pages/header.html" %>

<%Task task = (Task) request.getAttribute("task");%>

<h2>Read existing Task</h2>

<table>
    <thead>
    <tr>
        <th>Id:<%=task.getId()%></th>
    </tr>
    </thead>

    <tbody>
    <tr>
        <td>
            Title: <p><%=task.getTitle()%></p>
        </td>
    </tr>

    <tr>
        <td>
            Priority: <p><%=task.getPriority()%></p>
        </td>
    </tr>
    </tbody>
</table>

</body>
</html>
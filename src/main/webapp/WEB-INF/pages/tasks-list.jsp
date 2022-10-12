<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        <%@include file="../styles/main.css"%>
        <%@include file="../styles/task-list.css"%>
    </style>
</head>
<body>
<%@include file="../pages/header.html" %>
<h1>List of Tasks</h1>
<table>
    <tr>
        <th>No.</th>
        <th>Name</th>
        <th>Priority</th>
        <th colspan="3">Operation</th>
    </tr>
    <% for (Task task : (List<Task>) request.getAttribute("tasks")) {
    %>
    <tr>
        <td><%=task.getId() %>
        </td>
        <td><%=task.getTitle() %>
        </td>
        <td><%=task.getPriority() %>
        </td>
        <td>
            <a href="/read-task?id=<%=task.getId()%>">Read</a>
        </td>
        <td>
            <a href="/edit-task?id=<%=task.getId()%>">Edit</a>
        </td>
        <td>
            <a href="/delete-task?id=<%=task.getId()%>">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
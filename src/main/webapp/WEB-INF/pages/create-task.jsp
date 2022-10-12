<%@ page import="com.softserve.itacademy.model.Priority" %>
<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Task</title>
    <style>
        <%@include file="../styles/main.css"%>
        <%@include file="../styles/create-task.css"%>
    </style>
</head>
<body>
<%@include file="../pages/header.html" %>

<form action="/create-task" method="post">

    <h2>Create new task</h2>
    <p>${errorMessage}</p>

    <table>
        <tr>
            <td>
                <label for="title"> Name: </label>
            </td>
            <td>
                <input type="text" id="title" name="title" value="${titleVar}">
            </td>
        </tr>

        <tr>
            <td>
                <label> Priority: </label>
            </td>
            <td>
                <select name="priority">
                    <option value="LOW" ${prioritySelected}>Low</option>
                    <option value="MEDIUM" ${prioritySelected}>Medium</option>
                    <option value="HIGH" ${prioritySelected}>High</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>
                <input type="submit" value="Create">
            </td>
            <td>
                <input type="reset" value="Clear">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
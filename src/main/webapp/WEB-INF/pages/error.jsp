<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>

</head>
<body>
<%@include file="../pages/header.html"%>
<br>
<h1>Task with ID '${id}' not found in To-Do List!</h1>
<br>
<h2>url: ${url}</h2>

</body>
</html>
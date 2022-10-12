package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Priority;
import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/edit-task")
public class UpdateTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;
    private Task task;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        task = taskRepository.read(Integer.parseInt(request.getParameter("id")));
        if(task!=null) {
            request.setAttribute("task", task);
            request.getRequestDispatcher("WEB-INF/pages/edit-task.jsp").forward(request, response);
        }
        else {
            response.setStatus(response.SC_NOT_FOUND);
            request.setAttribute("id", request.getParameter("id"));
            request.setAttribute("url","/edit-task");
            request.getRequestDispatcher("WEB-INF/pages//error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        task.setTitle(request.getParameter("title"));
        task.setPriority(Priority.valueOf(request.getParameter("priority")));
        if (taskRepository.update(task)) {
            response.sendRedirect("/tasks-list");
        } else {
            request.setAttribute("message", "Task with a given name already exists!");
            request.setAttribute("task", task);
            request.getRequestDispatcher("/WEB-INF/pages/edit-task.jsp").forward(request, response);
        }
    }
}

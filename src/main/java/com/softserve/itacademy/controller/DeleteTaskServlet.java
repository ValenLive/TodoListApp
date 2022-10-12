package com.softserve.itacademy.controller;

import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/delete-task"})
public class DeleteTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;

    @Override
    public void init()  {
        taskRepository = TaskRepository.getTaskRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean isDeleted = taskRepository.delete(id);
            if (isDeleted) {
                response.sendRedirect("/tasks-list");
            } else {
                throw new IllegalArgumentException("no such id");
            }
        } catch (IllegalArgumentException e) {
            response.setStatus(response.SC_NOT_FOUND);
            request.setAttribute("id", request.getParameter("id"));
            request.setAttribute("url","/delete-task");
            request.getRequestDispatcher("WEB-INF/pages/error.jsp").forward(request, response);
        }
    }

}

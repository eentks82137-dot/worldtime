package com.homework;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j // Lombok을 사용하여 로그 객체 자동 생성
@WebServlet("/index")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("🐸🐸 /index ");

        // JSP로 포워딩
        req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
    }
}

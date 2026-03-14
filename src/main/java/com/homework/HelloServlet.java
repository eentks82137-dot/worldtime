package com.homework;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j // Lombok을 사용하여 로그 객체 자동 생성
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("🐸🐸 /index ");

        // JSP로 포워딩
        resp.setContentType("text/html;charset=UTF-8"); // 응답의 Content-Type 설정
        req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
    }
}

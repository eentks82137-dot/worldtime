package com.homework;

import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WorldTime extends HttpServlet {
    private int requestCount = 0;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        requestCount++;
        req.setAttribute("requestCount", requestCount);

        String locale = req.getParameter("locale");
        if (locale == null || locale.isEmpty()) {
            locale = "ko-KR"; // 기본값 설정
        }
        String timezone = req.getParameter("timezone");
        if (timezone == null || timezone.isEmpty()) {
            timezone = "Asia/Seoul"; // 기본값 설정
        }

        ZoneId zoneId;

        try {
            zoneId = ZoneId.of(timezone); // 타임존을 ZoneId 객체로 변환하여 유효성 검사
        } catch (Exception e) {
            zoneId = ZoneId.of("Asia/Seoul"); // 유효하지 않은 타임존인 경우 기본값으로 설정
        }

        ZonedDateTime currentTime = ZonedDateTime.now(zoneId); // 현재 시간을 해당 타임존으로 가져오기
        currentTime = currentTime.withNano(0); // 초 단위까지만 표시하기 위해 나노초 제거
        String formattedTime = currentTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); // 원하는 형식으로 포맷팅

        // JSP로 전달
        req.setAttribute("locale", locale);
        req.setAttribute("timezone", timezone);
        req.setAttribute("currentTime", formattedTime);

        // JSP로 포워딩
        req.getRequestDispatcher("/WEB-INF/views/worldtime.jsp").forward(req, resp);
    }
}

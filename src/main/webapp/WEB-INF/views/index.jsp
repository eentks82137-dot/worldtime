<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <title>World Time</title>
</head>
<body class="min-h-screen bg-[radial-gradient(circle_at_top_left,_rgba(251,191,36,0.28),_transparent_28%),linear-gradient(135deg,_#fffaf0_0%,_#f8fafc_45%,_#e2e8f0_100%)] text-slate-900">
    <main class="mx-auto flex min-h-screen w-full max-w-6xl items-center px-6 py-10">
        <section class="grid w-full gap-10 lg:grid-cols-[1.15fr_0.85fr] lg:items-center">
            <div class="space-y-6">
                <p class="text-sm font-semibold uppercase tracking-[0.45em] text-amber-700">Global Time Guide</p>
                <div class="space-y-4">
                    <h1 class="max-w-2xl text-5xl font-black tracking-tight text-slate-950 sm:text-6xl">원하는 도시의 현재 시간을 깔끔하게 확인하세요</h1>
                    <p class="max-w-xl text-base leading-7 text-slate-600 sm:text-lg">언어와 시간대를 선택하면 현재 시각을 바로 확인할 수 있는 간단한 월드타임 페이지입니다.</p>
                </div>
                <div class="flex flex-wrap gap-3 text-sm text-slate-600">
                    <span class="rounded-full border border-slate-300/80 bg-white/70 px-4 py-2">서울</span>
                    <span class="rounded-full border border-slate-300/80 bg-white/70 px-4 py-2">뉴욕</span>
                    <span class="rounded-full border border-slate-300/80 bg-white/70 px-4 py-2">도쿄</span>
                </div>
            </div>

            <div class="relative">
                <div class="absolute -left-6 top-8 h-32 w-32 rounded-full bg-amber-300/40 blur-3xl"></div>
                <div class="absolute -right-6 bottom-0 h-40 w-40 rounded-full bg-sky-300/30 blur-3xl"></div>
                <div class="relative">
                    <%@ include file="select.jsp" %>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
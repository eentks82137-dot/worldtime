<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <title>World Time</title>
</head>
<body class="min-h-screen bg-[radial-gradient(circle_at_top,_rgba(56,189,248,0.18),_transparent_30%),linear-gradient(160deg,_#fff7ed_0%,_#ffffff_45%,_#e2e8f0_100%)] text-slate-900">
    <main class="mx-auto flex min-h-screen w-full max-w-6xl items-center px-6 py-10">
        <section class="grid w-full gap-8 lg:grid-cols-[0.95fr_1.05fr] lg:items-center">
            <div class="rounded-[32px] border border-white/60 bg-slate-950 p-8 text-white shadow-[0_30px_90px_rgba(15,23,42,0.24)]">
                <p class="text-xs font-semibold uppercase tracking-[0.35em] text-amber-300">Current Snapshot</p>
                <h1 class="mt-4 text-4xl font-black tracking-tight">World Time</h1>
                <p class="mt-3 text-sm leading-6 text-slate-300">선택한 언어와 시간대를 기준으로 현재 시간을 표시합니다.</p>

                <div class="mt-8 space-y-4">
                    <div class="rounded-2xl border border-white/10 bg-white/5 p-4">
                        <p class="text-xs uppercase tracking-[0.28em] text-slate-400">Locale</p>
                        <p class="mt-2 text-lg font-semibold text-white">${locale}</p>
                    </div>
                    <div class="rounded-2xl border border-white/10 bg-white/5 p-4">
                        <p class="text-xs uppercase tracking-[0.28em] text-slate-400">Timezone</p>
                        <p class="mt-2 text-lg font-semibold text-white">${timezone}</p>
                    </div>
                    <div class="rounded-2xl border border-amber-300/20 bg-amber-300/10 p-4">
                        <p class="text-sm uppercase tracking-[0.28em] text-amber-200">Current Time</p>
                        <p class="mt-2 text-md font-black tracking-tight text-white">${currentTime}</p>
                    </div>
                </div>

                <a href="index" class="mt-8 inline-flex rounded-full border border-white/15 px-5 py-3 text-sm font-semibold text-white transition hover:border-amber-300 hover:text-amber-200">
                    Back to Index
                </a>
            </div>

            <div class="relative">
                <div class="absolute -right-6 -top-4 h-32 w-32 rounded-full bg-amber-300/40 blur-3xl"></div>
                <div class="absolute -left-8 bottom-0 h-40 w-40 rounded-full bg-sky-300/30 blur-3xl"></div>
                <div class="relative">
                    <%@ include file="select.jsp" %>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
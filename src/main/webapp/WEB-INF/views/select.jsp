<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="rounded-[28px] border border-white/60 bg-white/75 p-7 shadow-[0_24px_80px_rgba(15,23,42,0.12)] backdrop-blur">
    <div class="mb-8">
        <p class="text-xs font-semibold uppercase tracking-[0.35em] text-amber-600">World Clock</p>
        <h2 class="mt-3 text-3xl font-black tracking-tight text-slate-900">도시와 언어를 선택하세요</h2>
        <p class="mt-2 text-sm leading-6 text-slate-600">원하는 지역의 현재 시간을 바로 확인할 수 있습니다.</p>
        <p class="mt-2 text-sm leading-6 text-slate-600">요청 수: ${requestCount}</p>
    </div>

    <form action="worldtime" method="get" class="space-y-5">
        <div>
            <label for="locale" class="mb-2 block text-sm font-semibold text-slate-700">Language / Locale</label>
            <div class="rounded-2xl border border-slate-200 bg-slate-50/80 px-4 py-1 shadow-inner shadow-white/80">
                <select name="locale" id="locale"
                    class="w-full bg-transparent py-3 text-sm font-medium text-slate-900 outline-none">
                    <option value="ko_KR">한국어 (ko_KR)</option>
                    <option value="en_US">영어 (en_US)</option>
                    <option value="ja_JP">일본어 (ja_JP)</option>
                </select>
            </div>
        </div>

        <div>
            <label for="timezone" class="mb-2 block text-sm font-semibold text-slate-700">Timezone</label>
            <div class="rounded-2xl border border-slate-200 bg-slate-50/80 px-4 py-1 shadow-inner shadow-white/80">
                <select name="timezone" id="timezone"
                    class="w-full bg-transparent py-3 text-sm font-medium text-slate-900 outline-none"
                    >
                    <option value="Asia/Seoul1">서울1 (Asia/Seoul)</option>
                    <option value="America/New_York">뉴욕 (America/New_York)</option>
                    <option value="Asia/Tokyo">도쿄 (Asia/Tokyo)</option>
                    <option value="Europe/London">런던 (Europe/London)</option>
                    <option value="Australia/Sydney">시드니 (Australia/Sydney)</option>
                    <option value="Europe/Paris">파리 (Europe/Paris)</option>
                    <option value="America/Los_Angeles">로스앤젤레스 (America/Los_Angeles)</option>
                    <option value="Asia/Shanghai">상하이 (Asia/Shanghai)</option>

                </select>
            </div>
        </div>

        <button type="submit"
            class="w-full rounded-2xl bg-slate-950 px-4 py-3 text-sm font-semibold text-white shadow-[0_16px_40px_rgba(15,23,42,0.28)] transition duration-150 hover:-translate-y-0.5 hover:bg-amber-600 active:translate-y-0">
            Check Time Now
        </button>
    </form>
</div>
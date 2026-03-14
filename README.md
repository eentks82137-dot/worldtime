# World Time Service

(2026-03-15)

---

## **에러 만들어보기**

### **실험 1: 서블릿 이름 불일치**

> - 조건: web.xml의 `<servlet>` 안에 있는 `<servlet-name>`과 `<servlet-mapping>` 안에 있는 > `<servlet-name>`이 같은 이름으로 연결되어 있다.
> - 행동: `<servlet-mapping>` 안에 있는 `<servlet-name>`만 다른 이름으로 바꾼다. (예: "worldtime" → "asdflkj")
> - 관찰: 서버를 재시작하고 /worldtime 경로로 접속한다.
> - 어떤 응답이 오는가?
> - 브라우저에 표시되는 HTTP 상태 코드는 무엇인가?
> - 핵심 질문
> - web.xml에서 `<servlet>`과 `<servlet-mapping>`은 무엇을 기준으로 연결되는가?

---

- 변경 내용:
- 예상 결과:
- 관찰 결과:
- 원인 분석:

---

### **실험 2: Content-Type 제거**

> - 조건: WorldTimeServlet에 `response.setContentType("text/html;charset=UTF-8")` 코드가 있다.
> - 행동: 이 줄을 주석 처리한다.
> - 관찰: 로케일을 한국어(ko_KR)로 선택하고 결과를 확인한다.
> - 한글이 정상적으로 표시되는가?
> - 브라우저의 개발자 도구(F12) > Network 탭에서 Response Headers의 Content-Type 값은 무엇인가?
> - 핵심 질문:
> - Content-Type 헤더가 없으면 브라우저는 응답의 인코딩을 어떻게 판단하는가?
> - Day 1에서 겪었던 한글 깨짐 문제와 연결해 생각해보자.

---

- 변경 내용:
- 예상 결과:
- 관찰 결과:
- 원인 분석:

---

### **실험 3: GET을 POST로 변경**

> - 조건: index.html의 form이 GET 방식이고, WorldTimeServlet은 doGet()으로 요청을 처리한다.
> - 행동: index.html의 `<form method="GET">`을 `<form method="POST">`로 바꾼다. 서블릿 코드는 그대로 둔다.
> - 관찰: 폼에서 로케일과 타임존을 선택하고 제출한다.
>   - 어떤 응답이 오는가?
>   - HTTP 상태 코드는 무엇인가?
> - 핵심 질문
>   - 폼의 method와 서블릿의 doGet()/doPost()는 어떤 관계인가?
>   - 브라우저 주소창에서 직접 URL을 입력하는 것은 GET인가 POST인가?

---

- 변경 내용:
- 예상 결과:
- 관찰 결과:
- 원인 분석:

---

### **실험 4: 존재하지 않는 타임존**

> - 조건: 사용자가 timezone 파라미터로 유효한 타임존 ID를 보낸다.
> - 행동: index.html의 select option 중 하나의 value를 존재하지 않는 타임존으로 바꾼다.
>   (예: "Asia/Seoul" → "Asia/Busan")
> - 관찰: 해당 옵션을 선택하고 제출한다.
> - 에러가 발생하는가? 에러가 발생하지 않는다면,
> - 어떤 시간이 표시되는가?
> - Java의 ZoneId.of()는 잘못된 타임존을 어떻게 처리하는가?
> - 핵심 질문
> - 사용자 입력을 신뢰할 수 있는가?
> - 서블릿에서 파라미터 값을 검증해야 하는 이유는 무엇인가?

---

- 변경 내용:
- 예상 결과:
- 관찰 결과:
- 원인 분석:

---

### **실험 5: 서블릿 인스턴스 관찰**

> - 조건: WorldTimeServlet이 요청을 처리하고 있다.
> - 행동: WorldTimeServlet 클래스에 `private int requestCount = 0;` 필드를 추가한다.
> - doGet() 메서드 시작 부분에서 `requestCount++`를 실행하고,
>   응답 HTML에 현재 requestCount 값을 함께 출력한다.
> - 관찰: 여러 번 새로고침한다.
> - requestCount가 계속 증가하는가, 매번 1로 초기화되는가?
> - 서로 다른 브라우저(또는 시크릿 창)에서 접속하면 같은 카운트를 공유하는가?
> - 핵심 질문
> - 서블릿 객체는 요청마다 새로 생성되는가, 하나의 객체가 재사용되는가?
> - 이것이 의미하는 것은 무엇인가? (Day 4에서 다룰 서블릿 생명주기와 연결)

---

- 변경 내용:
- 예상 결과:
- 관찰 결과:
- 원인 분석:

---

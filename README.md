# World Time Service

(2026-03-15)

---

## **에러 만들어보기**

### **실험 1: 서블릿 이름 불일치**

> - 조건: web.xml의 `<servlet>` 안에 있는 `<servlet-name>`과 `<servlet-mapping>` 안에 있는 > `<servlet-name>`이 같은 이름으로 연결되어 있다.
> - 행동: `<servlet-mapping>` 안에 있는 `<servlet-name>`만 다른 이름으로 바꾼다. (예: "worldtime" → "asdflkj")
> - 관찰: 서버를 재시작하고 /worldtime 경로로 접속한다.
>   - 어떤 응답이 오는가?
>   - 브라우저에 표시되는 HTTP 상태 코드는 무엇인가?
> - 핵심 질문
>   - web.xml에서 `<servlet>`과 `<servlet-mapping>`은 무엇을 기준으로 연결되는가?

---

- 변경 내용: 서블릿 매핑 안에 있는 서블릿 이름을 worldTimeServlet1로 변경
- 예상 결과: 404에러가 출력된다
- 관찰 결과: HTTP 상태 404 – 찾을 수 없음 | Origin 서버가 대상 리소스를 위한 현재의 representation을 찾지 못했거나, 그것이 존재하는지를 밝히려 하지 않습니다.
- 원인 분석: servlet에 설정한 이름을 매핑 해줘야 하는데 servlet-mapping에 일치하는 이름이 없어서 찾을 수 없다고 하는것같음

---

### **실험 2: Content-Type 제거**

> - 조건: WorldTimeServlet에 `response.setContentType("text/html;charset=UTF-8")` 코드가 있다.
> - 행동: 이 줄을 주석 처리한다.
> - 관찰: 로케일을 한국어(ko_KR)로 선택하고 결과를 확인한다.
>   - 한글이 정상적으로 표시되는가?
>   - 브라우저의 개발자 도구(F12) > Network 탭에서 Response Headers의 Content-Type 값은 무엇인가?
> - 핵심 질문:
>   - Content-Type 헤더가 없으면 브라우저는 응답의 인코딩을 어떻게 판단하는가?
>   - Day 1에서 겪었던 한글 깨짐 문제와 연결해 생각해보자.

---

- 변경 내용: Content-Type 제거.
- 예상 결과: 한글이 정상적으로 출력되지 않는다.
- 관찰 결과: 한글이 정상적으로 출력되지 않는다.
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

- 변경 내용: get을 post로 변경
- 예상 결과: post 요청을 처리할 수 없다고 표시
- 관찰 결과: HTTP 상태 405 – 허용되지 않는 메소드. 요청 행에 포함된 해당 메소드는, origin 서버에 의해 인지되었으나, 대상 리소스에 의해 지원되지 않습니다.
- 원인 분석: get으로 들어오는 요청을 처리하는 로직만 구현 해놔서 post로 들어온 요청을 거부함. 서버에서 요청을 인지했으나 해당 요청에 응답하지 않는다고 함. pom의 method는 요청 타입을 정하고, doGet()/doPost()는 각 타입으로 들어오는 요청을 처리한다. 브라우저에서 직접 URL을 입력하는 것은 GET 요청이다.

---

### **실험 4: 존재하지 않는 타임존**

> - 조건: 사용자가 timezone 파라미터로 유효한 타임존 ID를 보낸다.
> - 행동: index.html의 select option 중 하나의 value를 존재하지 않는 타임존으로 바꾼다.
>   (예: "Asia/Seoul" → "Asia/Busan")
> - 관찰: 해당 옵션을 선택하고 제출한다.
>   - 에러가 발생하는가? 에러가 발생하지 않는다면,
>   - 어떤 시간이 표시되는가?
>   - Java의 ZoneId.of()는 잘못된 타임존을 어떻게 처리하는가?
> - 핵심 질문
>   - 사용자 입력을 신뢰할 수 있는가?
>   - 서블릿에서 파라미터 값을 검증해야 하는 이유는 무엇인가?

---

- 변경 내용: 유효하지 않은 타임존을 검사하는 구문 주석 처리
- 예상 결과: 500에러 발생
- 관찰 결과: HTTP 상태 500 – 내부 서버 오류. Unknown time-zone ID: Asia/Seoul1. 서버가, 해당 요청을 충족시키지 못하게 하는 예기치 않은 조건을 맞닥뜨렸습니다.

```java
java.time.zone.ZoneRulesException: Unknown time-zone ID: Asia/Seoul1
    java.base/java.time.zone.ZoneRulesProvider.getProvider(ZoneRulesProvider.java:281)
    java.base/java.time.zone.ZoneRulesProvider.getRules(ZoneRulesProvider.java:236)
    java.base/java.time.ZoneRegion.ofId(ZoneRegion.java:121)
    java.base/java.time.ZoneId.of(ZoneId.java:411)
    java.base/java.time.ZoneId.of(ZoneId.java:359)
    com.homework.WorldTime.doGet(WorldTime.java:25)
    jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)
    jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)
    org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)
```

- 원인 분석: 존재하지 않는 타임존을 ZoneId.of()에 전달해서 ZoneRulesException이 발생했다. ZoneId.of()으로 타임존을 반환할 때 try catch로 감싸서 예외가 발생하면 기본값으로 설정하도록 수정해야 한다. 사용자 입력은 신뢰할 수 없기 때문에 항상 검증해야 한다.

---

### **실험 5: 서블릿 인스턴스 관찰**

> - 조건: WorldTimeServlet이 요청을 처리하고 있다.
> - 행동: WorldTimeServlet 클래스에 `private int requestCount = 0;` 필드를 추가한다.
>   - doGet() 메서드 시작 부분에서 `requestCount++`를 실행하고,
>     응답 HTML에 현재 requestCount 값을 함께 출력한다.
> - 관찰: 여러 번 새로고침한다.
>   - requestCount가 계속 증가하는가, 매번 1로 초기화되는가?
>   - 서로 다른 브라우저(또는 시크릿 창)에서 접속하면 같은 카운트를 공유하는가?
> - 핵심 질문
>   - 서블릿 객체는 요청마다 새로 생성되는가, 하나의 객체가 재사용되는가?
>   - 이것이 의미하는 것은 무엇인가? (Day 4에서 다룰 서블릿 생명주기와 연결)

---

- 변경 내용: requestCount 필드 추가, doGet()에서 requestCount 증가 및 출력
- 예상 결과: requestCount가 계속 증가한다. 서로 다른 브라우저에서도 같은 카운트를 공유한다.
- 관찰 결과: requestCount가 계속 증가하며, 서로 다른 브라우저에서도 같은 카운트를 공유한다.
- 원인 분석: 서블릿 객체는 요청마다 새로 생성되지 않고, 하나의 객체가 재사용된다. 서블릿 생명 주기에서 서블릿이 처음 요청을 받을 때 인스턴스가 생성되고, 이후 모든 요청은 같은 인스턴스에서 처리된다. 따라서 requestCount는 모든 요청에서 공유되는 상태가 된다.

---

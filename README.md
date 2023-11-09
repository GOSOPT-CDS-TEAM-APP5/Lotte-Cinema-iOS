# Lotte-Cinema-iOS
아요가 좋아요 🍎
```
합동세미나 5조 iOS : 🎥 Lotte-Cinema 
```

- `Reference`

# 🍎아요 파트원

<img width="284" alt="스크린샷 2023-11-09 오후 5 18 51" src="https://github.com/GOSOPT-CDS-TEAM-APP5/Lotte-Cinema-iOS/assets/105866831/6c48a30d-de25-4721-a6e4-0fa9f32f93bc">

**박익범**

💌 pibum@naver.com

**고영민**

💌 osgneb8359@naver.com

**이지희**

💌 mam07065@naver.com

# 👩‍💻 역할 분배

[역할 분배](https://www.notion.so/c5ac3b03f4144a0a8e434ab9123e9791?pvs=21)

[합동 세미나 - Lotte Cinema](https://www.notion.so/Lotte-Cinema-dcb0248895514232b3d4a776833c812a?pvs=21) 

# 프로젝트 진행 방향

---

## 🎯 준비 상태

### 1️⃣ .gitignore
    

### 2️⃣ 라이브러리 종속성

`SPM` 사용

### 3️⃣ 프로젝트 구조

```swift
Lotte-Cinema-iOS
	│
  |── Source
  |   |── Global
  │   |── Extension
  │   |── Models
  │   |── Services
  │   |── Scenes
  |   |   |── SceneName
	│	  │      |── VCs
	│	  |	     |── Cells
	│	  |		   └── Components
  │		│		  
  │   └── Supports
	│			    |── AppDelegate.swift
	│					└── SceneDelegate.swift
  └── Resource
     |── Literals
     |-- Font
     |── Assets.xcassets
     |── LaunchScreen.storyboard
     └── Info.plist
```

# 🤝 컨벤션

## ⭐️ **커밋 컨벤션**

### 1️⃣ **git flow**

**branch**

- `main`
- `develop`
- `feat`

### 2️⃣ issue name

<aside>
💡 [`type`] `이슈 제목`

</aside>

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/acf7f70c-c7d7-4cd6-bc1a-1948262f2712/Untitled.png)

### 3️⃣ **branch name**

- issue를 통해서 해당 기능 구현에 대해 설명하 issue 넘버와 branch를 일치시킴

<aside>
🎋 {`type`}/{`이슈넘버`}

</aside>

**ex**. type: `feat` , 이슈 넘버: `#1`

```
feat/#1
```

### 4️⃣ C**ommit message**

<aside>
💬 {`type`}{`이슈넘버`} : - {`커밋내용`}

</aside>

```swift

ex) #1 homeView layout 구현
    feat/#1
브랜치 이름 : {type}/{이슈넘버}

commit -> feat: #1 - ㅇㅇ 컴포넌트 생성
{type}{이슈넘버} : - {커밋내용}
feat#1: ㅇㅇ 컴포넌트 생
```

### 5️⃣ **Commit Type**

- `feat🪄` - 기능추가시

<aside>
💡 feat#1: 홈 섹션 레이아웃 구현

</aside>

- `fix🛠️` - 버그 수정

<aside>
💡 fix#1: 홈 화면 재사용 이슈 해결

</aside>

- `style🎨` - 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우

<aside>
💡 style#1: 컨벤션과 안맞는 부분 수정

</aside>

- `chore💫` - 빌드 업무 수정, 패키지 매니저 수정

<aside>
💡 chore#1: pod 버전 업데이트 진행

</aside>

- `add➕` - Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시

<aside>
💡 add#1: appicon 추가

</aside>

## ⭐ PR 컨벤션

### 1️⃣ 제목

<aside>
💡 [`브랜치 이름`] `이슈제목`

</aside>

ex. 브랜치 `feat/#1`

```
[FEAT #1] 영화 선택 뷰 구현
```

### 2️⃣ 내용

```
📌 Summary #PR 요약
---

🔥 Test #Test 화면, gif 파일 권장
---

💡 Reason #PR 이유
---

✍️ Description #PR에 대한 자세한 설명
이슈 티켓 :
피그마 :

📚 Reference #참고 자료 / 링크
```

## ⭐️ **코딩 컨벤션**

### 1️⃣ **Class 이름**

- 클래스 이름은 UpperCamelCase 사용하기
    - ViewController : VC
    - CollectionViewCell, TableViewCell : CVC, TVC

```python
ex. HomeViewController.swift
```

### 2️⃣ **Protocol 사용 시**

- 프로토콜을 채택해서 사용하는 경우 extension으로 분리해서 작성하기

```swift
extension HomeViewController: UITableViewDelegate { ... }
extension HomeViewController: UITableViewDatasource { ... }
...
```

### 3️⃣ **변수 및 상수 이름**

- 변수 및 상수 이름은 lowerCamelCase를 사용하기

```swift
@IBOutlet weak var tableView: UITableView!

var phoneNumberList: [String] = []
```

### 4️⃣ **함수 이름**

- 함수 이름은 lowerCamelCase를 사용하기
- 동작과 관련된 함수(ex. IBActions)는 최대한 자세하게 동사의 형태로 기술하기

```swift
@IBAction func loginButtonClicked() { ... }
@IBAction func backButtonTapped() { ... }
@objc func increaseButtonClicked() { ... }
```

### 5️⃣ **생명주기(Life Cycle)**

- viewDidLoad, viewWillAppear 등 생명 주기에는 최대한 코드를 간단하게 작성하기 → 함수 호출 정도로 제한

```swift
override func viewDidLoad() {
	super.viewDidLoad()

	// 간단하게 함수 호출
	configureUI()    // UI 세팅
	tableViewSetup() // 테이블뷰 세팅
	...
}
```

### 6️⃣ **주석 작성**

- `// MARK:` : 주석 다는 것은 영역 구분

```swift
// MARK: - Properties
// MARK: - Life Cycle
// MARK: - Custom Function
// MARK: - TableView Datasource
```

- `/** */` : 함수에 대한 상세 내용 → description으로

```
/** UI 스타일 지정 */
```

### Rule‼️ (규칙은 추후 더 추가해보자~)

추가 해봐요~

# 🔫 트러블 슈팅

### 익범

[박익범의 트러블메이커~ ](https://www.notion.so/ded633f5a78a4d7c90d1d0a6c1277b58?pvs=21)

### 지희

[합동 세미나 - Lotte Cinema](https://www.notion.so/Lotte-Cinema-dcb0248895514232b3d4a776833c812a?pvs=21)

### 영민

[합동세미나 트러블 슈팅과 챌린지](https://www.notion.so/75b70fb4e2f447b3907fbf3da9bc3844?pvs=21)

## 일정 공유

[📆 일정 공유](https://www.notion.so/3ad2626056b0429c90a1c28f86734ba5?pvs=21)

## 참고 자료 및 이슈 공유

---

[Extension 모음](https://www.notion.so/Extension-cbb2e12e9614484ebcb22e0fafa1455b?pvs=21)

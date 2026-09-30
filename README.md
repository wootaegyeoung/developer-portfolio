# developer-portfolio
본 계정 소유자의 포트폴리오

## 직접 수정하고 배포하기

이 저장소의 `index.html`을 편집기로 수정하고 저장합니다.
파일을 Chrome으로 열면 게시 전 내용을 확인할 수 있습니다.

저장소 폴더의 PowerShell에서 실행합니다.

```powershell
.\deploy.ps1 -Message "포트폴리오 업데이트"
```

스크립트는 변경 사항을 커밋하고 GitHub의 `main` 브랜치에 올립니다.
GitHub 인증이 필요할 수 있습니다. 원격 변경으로 push가 거절되면 먼저
원격 변경 사항을 확인하고 병합하세요. 강제 push는 하지 않습니다.

직접 Git 명령을 사용해도 됩니다.

```powershell
git add index.html
git commit -m "Update portfolio"
git push origin main
```

## 최초 한 번: GitHub Pages 설정

저장소의 **Settings → Pages → Build and deployment**에서 설정합니다.

- Source: **Deploy from a branch**
- Branch: **main**
- Folder: **/(root)**
- **Save** 클릭

이 설정 이후에는 `main`에 변경을 올릴 때마다 자동 배포됩니다.
진행 상태는 저장소의 **Actions** 탭에서 확인합니다.

배포 주소: https://wootaegyeoung.github.io/developer-portfolio/

PC를 꺼도 GitHub에서 사이트를 제공합니다. 파일 저장만으로 배포되지는 않으며,
GitHub에 push한 내용이 반영됩니다. GitHub 웹에서 `index.html`을 직접 편집하고
커밋해도 배포됩니다. 웹에서 편집한 뒤 로컬 작업을 이어가려면 먼저 `git pull --ff-only`로 받으세요.

기존 ChatGPT Sites와는 별도 배포입니다. GitHub에 올려도 기존 Sites 주소는 갱신되지 않습니다.

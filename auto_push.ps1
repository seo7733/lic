# 소방설비기사 공부사이트 자동 커밋·푸시 스크립트
Set-Location "C:\Users\jkseo\Desktop\lic"

# 원본 → index.html 동기화
Copy-Item "소방설비기사_전기실기_공부사이트.html" "index.html" -Force

# 변경사항 확인
$status = git status --porcelain
if (-not $status) {
    Write-Host "✅ 변경사항 없음 - 이미 최신 상태입니다." -ForegroundColor Green
    exit 0
}

# 커밋 메시지 (현재 날짜시간 포함)
$msg = "공부사이트 업데이트 - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"

git add index.html 기출_이미지/
git commit -m $msg
git push origin master

Write-Host "✅ GitHub 푸시 완료: $msg" -ForegroundColor Green

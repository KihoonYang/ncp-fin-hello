# Console

## URL
```URL
https://www.fin-ncloud.com/nsa/{main-account}
```

## Setup
- 마이페이지 > 계정관리 > 보안설정 > 2차인증 설정 (휴대전화, 이메일)
- MAC Address관리
- VPN 계정관리
- SSL VPN 설치
```URL
https://guide-fin.ncloud-docs.com/docs/sslvpn-download
```
> [!WARNING]  
> - `MAC OS`의 경우 OS의 버전이 업데이트 되면 `BIG-IP Edge Client`가 정상실행되지 않는 경우가 매우 많으므로 업데이트에 유의
> - Console 접속용과 Server 접속용 SSL-VPN을 동시에 사용할 수 없으므로 Parallels를 이용한 이기종 OS를 사용해야 다른 접속용도의 SSL-VPN을 동시에 사용할 수 있다.

## DevOps
- Cloud, Kubernetes등 시스템에서 사용하는 계정은 개발/관리자 개인 계정과 분리 관리
> [!NOTE]  
> PaaS, SaaS 생성 계정관리, API 인증키 관리

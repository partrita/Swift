# Minimax 알고리즘

<p align="center"> <img src="Resources/image1.jpg" {:height="50%" width="50%"} /> </p>

## 런타임 환경
<img src="https://img.shields.io/badge/Swift-5.3-orange.svg?style=flat" />
<img src="https://img.shields.io/badge/Xcode-12.4-blue.svg?style=flat" />
<img src="https://img.shields.io/badge/MacOS-11.2.3-blue.svg?style=flat" />

## 목차
* [일반 정보](#일반-정보)
* [기능](#기능)
* [의사 코드](#의사-코드)
* [데모](#데모)
* [소스](#소스)

## 일반 정보
이것은 ``Tic Tac Toe`` 게임에서 ``minimax 알고리즘``을 구현하고 사용하는 예입니다. Minimax는 게임의 모든 가능한 상태를 깊이 검색하는 알고리즘입니다. 알고리즘에는 두 가지 유형의 플레이어가 있습니다. 게임 상태를 최대화하려는 플레이어와 게임 상태를 최소화하려는 플레이어입니다. tic-tac-toe 게임에는 세 가지 상태가 있습니다.
- `` -1 `` - 최소화 플레이어가 이기는 경우
- `` 0 `` - 동점인 경우
- `` 1 `` - 최대화 플레이어가 이기는 경우

``알파-베타 가지치기`` 이것은 승리로 이어지지 않는 가지의 검색을 중단하는 방법입니다. 최대화 플레이어의 경우 알파, 최소화 플레이어의 경우 베타입니다. 알파-베타 가지치기는 알고리즘의 시간 복잡도를 줄입니다.

매개변수:
- ``검색 깊이`` - 알고리즘이 계산할 깊이 이동 횟수

입력:
- ``실제 보드 상태`` - 플레이어 심볼(십자/원) 배열 형태
- ``두 플레이어 심볼`` - 십자 / 원

출력:
- ``자율(AI) 플레이어를 위한 최상의 이동`` - 위치(행: Int, 열: Int)

## 기능
- 대화형 UIView와 함께 Swift Playground에서 사용 예
- XCode의 단위 테스트

## 의사 코드

```
function alphabeta(node, depth, α, β, maximizingPlayer) is
    if depth = 0 or node is a terminal node then
        return the heuristic value of node
    if maximizingPlayer then
        value := −∞
        for each child of node do
            value := max(value, alphabeta(child, depth − 1, α, β, FALSE))
            if value ≥ β then
                break (* β cutoff *)
            α := max(α, value)
        return value
    else
        value := +∞
        for each child of node do
            value := min(value, alphabeta(child, depth − 1, α, β, TRUE))
            if value ≤ α then
                break (* α cutoff *)
            β := min(β, value)
        return value
```

## 데모

<p align="center"> <img src="Resources/demo.gif" {:height="100%" width="100%"} /> </p>

## 소스
* Minimax 알고리즘: https://en.wikipedia.org/wiki/Minimax
* 알파-베타 가지치기: https://en.wikipedia.org/wiki/Alpha–beta_pruning

## 저자
Michał Nowak(mnowak061) 작성

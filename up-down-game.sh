#!/usr/local/bin/bash
# which bash 명령어로 확인한 경로

echo "1 ~ 100 중 어떤 숫자일까요?"

random_number=$((${RANDOM} % 100 + 1))

function compare() {
  if [ ${random_number} -gt ${input} ]; then
    echo "UP"
  elif [ ${random_number} -lt ${input} ]; then
    echo "DOWN"
  else
    touch Game_Clear
    echo -e "$(date +'%Y년 %m월 %d일 %H시 %M분')\n축하합니다!" > Game_Clear
    echo "Game_Clear를 확인하세요."

    exit
  fi
}

for ((i = 5; i > 0; i--)); do
  echo -e "\n남은 기회: ${i}번"
  echo -n "입력: "
  read input

  compare
done

echo "# 실패! 다시 도전하세요."
echo "정답: ${random_number}"
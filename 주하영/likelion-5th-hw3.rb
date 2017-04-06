#my_numbers 만들기
t=(1..45).to_a
my_numbers=t.sample(6).sort!
#추첨번호 가져오기
require ('open-uri')
require ('json')
page = open("http://www.nlotto.co.kr/common.do?method=getLottoNumber")
lotto_info = page.read
lotto = JSON.parse(lotto_info)
lotto_numbers = [lotto["drwtNo1"],lotto["drwtNo2"],lotto["drwtNo3"],lotto["drwtNo4"],lotto["drwtNo5"],lotto["drwtNo6"]].sort!
bonus_number = lotto["bnusNo"]
#추첨번호 비교하기
match_numbers=my_numbers&lotto_numbers
ranks=["꽝", "2등", "5등", "4등", "3등", "1등"]
rank="꽝"
len=match_numbers.length
if len<=6 and len>=3
  rank=ranks[len-1]
  if match_numbers.length==5
    if my_numbers.include?(bonus_number)
      rank=ranks[1]
    end
  end
end
#로또 번호 안내
puts "'이번주   로또 번호는 #{lotto_numbers}이고, 보너스 번호는 #{bonus_number}입니다.' \n '추첨한 로또 번호는 #{my_numbers}입니다.' \n '겹치는 번호는 #{match_numbers} 입니다.' \n '결과는 #{rank}입니다.'"

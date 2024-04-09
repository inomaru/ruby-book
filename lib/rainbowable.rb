# 実装イメージ
# 1．to_sメソッドを使って自分自身の文字列表現を取得する。
# 2．取得した文字列を1文字ずつループ処理する。
# 3．各文字の手前にANSIエスケープシーケンスを付与する。文字色は31から36まで順に切り替え、最後まで進んだらまた31に戻る。
# 4．各文字を連結して1つの文字列にする。
# 5．最後に文字色をリセットするための\e[0mを付与する。

module Rainbowable
  def rainbow
    colored_chars = []
    to_s.each_char.with_index do |char, count|
      color = 31 + count % 6
      colored_chars << "\e[#{color}m#{char}"
    end
    colored_chars.join + "\e[0m"
  end
end
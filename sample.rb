# このファイルの実行方法
## $ docker compose exec ruby ruby sample.rb

require_relative './lib/rainbowable'

# 便利なショートカットメソッド
class Sample
  def self.border
    puts '----------'
  end
  def self.display_title(title)
    puts "\# #{title}"
  end
end

# メソッドをクラスに読み込み
String.include Rainbowable
Array.include Rainbowable

Sample::display_title('rainbowメソッドを使ってみた')
puts a = [1, 2, 3].rainbow
Sample::border

Sample::display_title('Arrayオブジェクトのモジュール・リスト')
puts Array.included_modules
Sample::border

Sample::display_title('Arrayオブジェクトの先祖クラスまで遡ったモジュール・リスト')
puts Array.ancestors
Sample::border

Sample::display_title('インスタンスに対して任意のモジュールのインクルード有無を確認')
example = [1,2,3]
puts example.is_a?(Rainbowable)
puts example.is_a?(Array)
# 繰り返しを処理するオブジェクト対するメソッドが定義されているデフォルトのモジュール
# map, select, find, count...etc
# include先にeachメソッドが定義されていればEnumerableで定義されているたくさんのメソッドが使えるようになる（eachメソッドがあること前提のモジュール）
puts example.is_a?(Enumerable)
puts example.is_a?(Object)
Sample::border


Sample::display_title('Comparableモジュール')
# Comparableモジュールは比較演算子のメソッドを提供するモジュール
# rubyのデフォルト
# 以下のサンプルは、Comparableモジュールを独自のクラスの中にincludeして応用したもの
## 本来比較できないオブジェクト同士を比較演算子で比較している
class Tempo
  include Comparable
  attr_reader :bpm
  # bpmはBeats Per Minuteの略で音楽の速さを表す単位
  def initialize(bpm)
    @bpm = bpm
  end
  # <=>はComparableモジュールで使われる演算子（メソッド）
  def <=>(other)
    # otherがTempoであればbpm同士を<=>で比較した結果を返す
    # それ以外は比較できないのでnilを返す
    other.is_a?(Tempo) ? bpm <=> other.bpm : nil
  end
  # irb等で結果を見やすくするためにinspectメソッドをオーバーライド
  def inspect
    "#{bpm}bpm"
  end
end
t_120 = Tempo.new(120) #=> 120bpm
t_180 = Tempo.new(180) #=> 180bpm
puts t_120 > t_180   #=> false
puts t_120 <= t_180  #=> true
puts t_120 == t_180  #=> false
Sample::border
# Helper methods defined here can be accessed in any controller or view in the application

module Gurongi
  class App
    module GurongiHelper

      ########################
      # 例外単語位置特定メソッド
      # 日本語の文字列の中に例外の単語(クウガ、ゲゲルなど)があった場合、
      # 該当する文字列の開始位置と終了位置の配列を持つハッシュを返却する。
      def search_exception_points jp
        start_points = []
        end_points = []
        FILTER_WORDS.each do |e|
          if (origin = jp.index(e))
            start_points.push origin
            end_points.push (origin + (e.length - 1))
          end
        end
        ext_potision = {
          :s => start_points.sort ,
          :e => end_points.sort
        }
      end

      ########################
      # 翻訳メソッド
      # 日本語の文字列を受け取り、グロンギ語で翻訳した文字列を返却する
      def translate_gurongi ext_p, jp
        gurongi_array = []
        ext_i = 0
        jp.each_char.each_with_index do |c, i|
          gurongi_array.push(translate_chars(c, jp, ext_p[:s][ext_i] , ext_p[:e][ext_i], i))
          translate_num(c, jp, i)
          if ext_p[:e][ext_i + 1].present?
            ext_i = ext_i + 1 if ext_p[:e][ext_i] < i
          end
        end
        gurongi_array
      end

      ########################
      # 文字変換メソッド
      # 渡された文字によって、翻訳ルールに沿って変換後の文字を返却する
      def translate_chars c, jp, sp, ep, i
        case c
        when 'ー'
          GURONGI_MAP[jp[i - 1]]
        when 'っ','ッ'
          GURONGI_MAP[jp[i + 1]]
        else
          # 数字に変換可能な値の場合数値に変換する
          p GURONGI_MAP[c.to_i]
          translate_num(c ,jp ,i) if c.to_i != 0

          unless jp[i + 1].nil?
            if jp[i + 1].scan(/ゃ|ャ|ゅ|ュ|ょ|ョ|ぁ|ァ|ぃ|ィ|ぇ|ェ|ぉ|ォ/).present?
              return GURONGI_MAP[c + jp[i + 1]]
            end
          end
          if sp.present? && ep.present?
            sp <= i && i <= ep ? c : c = GURONGI_MAP[c]
          else
            GURONGI_MAP[c]
          end
        end
      end

      ########################
      # 数値変換メソッド
      # 日本語の配列から数字を抜き出し９進数に変換する
      def translate_num c, jp, i
        return GURONGI_MAP[c.to_i]
        p c
        p jp
        p i
        p '-----------------------'
        p jp.gsub(/[^0-9]/,"")
        p '-----------------------'
      end

    end
    helpers GurongiHelper
  end
end

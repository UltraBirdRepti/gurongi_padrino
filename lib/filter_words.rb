# PadrinoのModuleクラス
module PadrinoApp
  # yamlファイルから例外単語を読み込む
  class FilterWords
    FILTER_WORDS = YAML.load_file(Padrino.root('/lib/filter_words.yml'))
  end
end

# require modules here
require 'yaml'
require 'pry'

def load_library (file_path)
  file = YAML.load_file(file_path)
  dictionary = {}

  file.each do |name, emoji_array|
    dictionary[name] = {:english => {}, :japanese => {}}
    emoji_array.each_with_index do |emoji, index|
      if index == 0
        dictionary[name][:english] = emoji
      elsif index == 1
        dictionary[name][:japanese] = emoji
      end
    end
  end
  dictionary
end

def get_japanese_emoticon(file_path, emoji)
  dictionary = load_library(file_path)
  japanese_emoji = ""
  dictionary.each do |name, value|
    if emoji == value[:english]
      return japanese_emoji = value[:japanese]
    else
      japanese_emoji = "Sorry, that emoticon was not found"
    end
  end
  return japanese_emoji
end

def get_english_meaning(file_path, emoji)
  dictionary = load_library(file_path)
  eng_name = ""
  dictionary.each do |name, value|
    if emoji == value[:japanese]
     return eng_name = name
    else
      eng_name = "Sorry, that emoticon was not found"
    end
  end
  return eng_name
end
# require modules here
require 'yaml'
require 'pry'

def load_library (file_path)
  dictionary = {}
  
  YAML.load_file("./lib/emoticons.yml").each do |key, value|
    dictionary[key] = {}
    
    value.each_with_index do |element, index|
      dictionary[key] = {:english => value[0], :japanese => value[1]}
    end
  end
 return dictionary
end

def get_japanese_emoticon(file_path, emoji)
  dictionary = load_library(file_path)
  return_message = ""
  dictionary.each do |key, value|
    if emoji == value[:english]
      return value[:japanese]
    else
      return_message = "Sorry, that emoticon was not found"
    end
  end
  return_message
end

def get_english_meaning(file_path, emoji)
   dictionary = load_library(file_path)
   failure_notice = ""
   dictionary.each do |key, value|
     value.each do |inner_key, inner_value|
      if emoji == inner_value
        return key
      else
        failure_notice = "Sorry, that emoticon was not found"
      end
    end
   end
   return failure_notice
 end






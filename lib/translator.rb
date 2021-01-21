require "yaml"
require "pry"
file = YAML.load_file('./lib/emoticons.yml')
puts file.inspect

def load_library(file)
  emoticons = file.each_with_object({}) do |(k, v), emoticons|
    emoticons[k] = Hash[:english, v[0], :japanese, v[1]]
  end
  emoticons
end

def get_japanese_emoticon(file, w_emoticon)
  emoticons = load_library(file)
  j_emoticon = "Sorry, that emoticon was not found"
  emoticons.each do |meaning, emotes|
    if w_emoticon == emotes[:english]
      j_emoticon = emotes[:japanese]
    end 
  end 
  j_emoticon
end

def get_english_meaning(file, j_emoticon)
  emoticons = load_library(file)
  result = "Sorry, that emoticon was not found"
  emoticons.each do |meaning, emotes|
    if j_emoticon == emotes[:japanese]
      result = meaning 
    end 
  end 
  result
end
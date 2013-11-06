guard :rubocop do
  watch(/.+\.rb$/)
  watch('Rakefile')
  watch('Guardfile')
  watch('Gemfile')
  watch('config.ru')
  watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
end

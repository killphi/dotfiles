interactor :off

notification :tmux,
             display_message:        true,
             timeout:                3,
             # the first %s will show the title, the second the message
             default_message_format: '%s >> %s',
             # since we are single line we need a separator
             line_separator:         ' > ',
             # the first %s will show the title, the second the message
             color_location:         'status-left-fg'

if PluginUtil.plugin_names.include? 'bundler'
  guard :bundler do
    watch('Gemfile')
  end
end

if PluginUtil.plugin_names.include? 'rubocop'
  guard :rubocop, all_on_start: false, cli: ['--format', 'simple'] do
    watch(/.+\.rb$/)
    watch('Rakefile')
    watch('Guardfile')
    watch('Gemfile')
    watch('config.ru')
    watch(/(?:.+\/)?\.rubocop(?:_todo)?\.yml$/) {|m| File.dirname(m[0]) }
  end
end

notification :tmux,
             display_message:        true,
             timeout:                3,
             # the first %s will show the title, the second the message
             default_message_format: '%s >> %s',
             # since we are single line we need a separator
             line_separator:         ' > ',
             # the first %s will show the title, the second the message
             color_location:         'status-left-fg'

def has_plugin?(name)
  PluginUtil::plugin_names.include? name
end

begin
  require 'guardrc'
  eval Guardrc.at '~/.guard/bundler.rb' if has_plugin? 'bundler'
  eval Guardrc.at '~/.guard/rubocop.rb' if has_plugin? 'rubocop'
rescue LoadError
  nil
end

#interactor :off

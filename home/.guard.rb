notification :tmux,
             display_message:        true,
             timeout:                3,
             # the first %s will show the title, the second the message
             default_message_format: '%s >> %s',
             # since we are single line we need a separator
             line_separator:         ' > ',
             # the first %s will show the title, the second the message
             color_location:         'status-left-fg'

begin
  require 'guardrc'
  eval Guardrc.at '~/.guard/bundler.rb' if Guard::Bundler
  eval Guardrc.at '~/.guard/rubocop.rb' if Guard::RuboCop
rescue LoadError
  nil
end

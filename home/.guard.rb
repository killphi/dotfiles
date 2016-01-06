def plugin?(name, guard = true)
  if guard
    PluginUtil.plugin_names.include? name
  else
    gems = ::Bundler.environment.current_dependencies.map(&:to_s).join "\n"
    /^#{name}\s/.match(gems) { true }
  end
end

def join(*args)
  [*args].flatten.join ' '
end

if plugin? 'bundler'
  guard :bundler do
    watch('Gemfile')
  end
end

if plugin? 'rspec'
  RSPEC_CMD ||= 'bundle exec rspec'

  RSPEC_ALL ||= 'spec'

  RSPEC_ARGS ||= [
    '--format html',
    '-o spec/reports/rspec.html'
  ]

  RSPEC_OPTIONS ||= {
    all_on_start:   false,
    all_after_pass: true,
    cmd:            join(RSPEC_CMD,
                         '--format doc',
                         '--tag focus',
                         RSPEC_ARGS),
    run_all: {
      cmd: join(RSPEC_CMD,
                '--no-fail-fast',
                '--profile 5',
                '--format Fuubar',
                RSPEC_ARGS)
    }
  }

  def spec(name)
    Dir["#{RSPEC_ALL}/**/#{name}_spec.rb"][0] || RSPEC_ALL
  end

  guard :rspec, RSPEC_OPTIONS do
    watch(%r{^spec\/.+_spec\.rb$})
    watch(%r{^lib\/(.+)\.rb$})   {|m| spec m[1] }
    watch('spec/spec_helper.rb') { RSPEC_ALL }
  end
end

if plugin? 'cucumber'
  CUCUMBER_ALL ||= 'features'

  CUCUMBER_OPTIONS ||= {
    all_on_start:   false,
    all_after_pass: true,
    cli:            '--profile guard'
  }

  def feature(name)
    Dir["#{CUCUMBER_ALL}/**/#{name}.feature"][0] || CUCUMBER_ALL
  end

  guard :cucumber, CUCUMBER_OPTIONS do
    watch(%r{^features\/.+\.feature$})
    watch(%r{^features/step_definitions/(.+)_steps\.rb$}) {|m| feature m[1] }
    watch(%r{^features/support/.+$})                      { CUCUMBER_ALL }
  end
end

if plugin? 'livereload'
  LIVERELOAD_OPTIONS = {
    grace_period: 0.5
  }

  guard :livereload, LIVERELOAD_OPTIONS do
    watch(/.+\.(js|css|html)$/)

    if plugin? 'rails', false
      watch(%r{app/views/.+\.(erb|haml|slim)$})
      watch(%r{app/helpers/.+\.rb})
      watch(%r{config/locales/.+\.yml})

      # Rails Assets Pipeline
      RAILS_ASSETS = %r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}
      watch(RAILS_ASSETS) {|m| "/assets/#{m[3]}" }
    end
  end
end

notification :tmux,
             display_message:        true,
             timeout:                3,
             # the first %s will show the title, the second the message
             default_message_format: '%s >> %s',
             # since we are single line we need a separator
             line_separator:         ' > ',
             # the first %s will show the title, the second the message
             color_location:         'status-left-fg'

interactor :off

require 'rubygems'

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
  warn "maybe you need to: sudo gem install wirble"
end

begin
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  warn "Couldn't load Hirb: #{err}"
  warn "maybe you need to: sudo gem install hirb"
end

if $0 == 'irb' && ENV['RAILS_ENV']
  load '~/bin/dotfiles/railsrc'
end


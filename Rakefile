require 'rake'
require 'erb'
require 'fileutils'

DEPENDENCIES = {
  :osx    => %w/p5-app-ack git-core coreutils vim macvim ruby rb-rubygems/,
  :ubuntu => %w/ack-grep git-core vim gvim/
}

$is_darwin      = `uname`.strip.include? "Darwin"
$has_macports   = system( 'which port &> /dev/null' )
$has_apt        = system( 'which apt-get &> /dev/null' )
$prefix         = ENV['PREFIX'] || ENV['HOME']

namespace :install do
  desc "Fixes dependency issues"
  task :fix_dependencies do
    fix_dependencies
  end

  desc "Install bash config"
  task :bash do
    parse_config :erb_file => 'bash/bash_profile.erb', :final_name => '.bash_profile'
  end

  desc "Install vim config"
  task :vim do
    system 'git submodule update --init'

    FileUtils.cp_r 'vim', File.join( $prefix, '.vim' )

    %w/vimrc gvimrc/.each do |file|
      FileUtils.ln_sf File.join( $prefix, 'vim', file ), File.join( $prefix, ".#{ file }" )
    end
  end

  desc "Install git config"
  task :git do
    parse_config :erb_file => 'git/gitconfig.erb', :final_name => '.gitconfig'
    FileUtils.cp 'git/gitignore', File.join( $prefix, '.gitignore' )
  end

  desc "Copy ack config"
  task :ack do
    FileUtils.cp 'ackrc', File.join( $prefix, '.ackrc' )
  end

  def parse_config opts={}
    erb_file  = File.join File.dirname( __FILE__ ), opts[:erb_file]
    save_to   = File.join $prefix, opts[:final_name]

    erb_env = Proc.new do
      @has_macports = $has_macports
      @has_apt_get  = $has_apt
      binding
    end.call

    erb = ERB.new File.read( erb_file )

    File.open( save_to, 'w' ) do |file|
      file.print erb.result( erb_env )
    end
  end

  def fix_dependencies
    DEPENDENCIES[:osx].each do |dependency|
      system "sudo port install #{ dependency }"
    end if $is_darwin and $has_macports

    DEPENDENCIES[:ubuntu].each do |dependency|
      system "sudo apt-get install #{ dependency }"
    end unless $is_darwin and ! $has_apt

    if ! $has_apt and ! $has_macports
      puts "These dotfiles can't be installed in your system"
      exit! 1
    end
  end
end

task :install => [ "install:fix_dependencies", "install:bash", "install:vim", "install:git", "install:ack" ]

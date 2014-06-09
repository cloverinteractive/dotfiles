require 'rubygems'
require 'bundler/setup'

require 'rake'
require 'erb'
require 'fileutils'
require 'active_support'
require 'active_support/core_ext/object'
require 'term/ansicolor'

include Term::ANSIColor

$is_darwin      = RUBY_PLATFORM.include? 'darwin'
$is_linux       = RUBY_PLATFORM.include? 'linux'

$has_macports   = `which port`.present?
$has_apt        = `which apt-get`.present?

$prefix         = ENV['PREFIX'] || ENV['HOME']
$dotfiles_path  = File.dirname( __FILE__ )

desc "Install bash config"
task :bash do
  parse_config 'bash/bash_profile.erb'
end

desc "Install gem config"
task :gem do
  parse_config 'gem/gemrc.erb'
end

desc "Install vim config"
task :vim do
  system 'git submodule update --init'

  %w/vimrc gvimrc/.each do |file|
    copy_to_build 'vim', file
  end

  backup_and_link 'vim', false
  system "vim +PluginInstall +qall"
end

desc "Install git config"
task :git do
  parse_config 'git/gitconfig.erb'
  copy_to_build 'git', 'gitignore'
end

desc "Install ack config"
task :ack do
  copy_to_build 'ack', 'ackrc'
end

desc "Install tmux config"
task :tmux do
  copy_to_build 'tmux', 'tmux.conf'
end

desc "Removes symlinks and restores .orig files"
task :uninstall do
  Dir[File.join('build', '*').to_s].each do |file|
    restore_from_backup file
  end

  restore_from_backup 'vim' # Undo the vim symlink (this is not under build)
  puts green( bold "All done, thanks for trying it." )
end

def backup_and_link file, use_build_path=true
  file_name = File.basename file
  dst_name  = File.join( $prefix, ".#{ file_name }" )

  unless  File.exists?( "#{ dst_name }.orig" )
    FileUtils.mv( dst_name, "#{ dst_name }.orig" ) if File.exists?( dst_name )
  else
    puts red( bold "There are older backups that need sorting, I can't continue, please check your .orig files" )
    exit! 1
  end

  build = use_build_path ? 'build' : ''
  FileUtils.ln_sf File.join( $dotfiles_path, build, file_name ), dst_name
end

def copy_to_build dir, file_name
  dst_file = File.join 'build', file_name
  FileUtils.cp File.join( dir, file_name ), dst_file

  backup_and_link dst_file
end

def parse_config file
  erb_file    = File.join $dotfiles_path, file
  final_name  = File.basename( file ).split('.').first
  save_to     = File.join $dotfiles_path, 'build', final_name

  erb_env = Proc.new do
    @is_darwin    = $is_darwin
    @is_linux     = $is_linux
    @has_macports = $has_macports
    @has_apt_get  = $has_apt
    @prefix       = $prefix

    binding
  end.call

  erb = ERB.new File.read( erb_file )
  File.open( save_to, 'w' ) { |file| file.print erb.result( erb_env ) }

  backup_and_link save_to
end

def restore_from_backup file
  file_name = File.basename file
  dst_name  = File.join( $prefix, ".#{ file_name }" )

  FileUtils.safe_unlink dst_name
  FileUtils.mv "#{ dst_name }.orig", dst_name if File.exists? "#{ dst_name }.orig"
end

task :install   => [ "bash", "vim", "git", "ack", "gem", "tmux" ]
task :default   => :install

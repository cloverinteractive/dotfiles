require 'rubygems'
require 'bundler/setup'

require 'rake'
require 'erb'
require 'fileutils'
require 'term/ansicolor'

include Term::ANSIColor

$is_darwin      = `uname`.strip.include? "Darwin"
$has_macports   =  `which port`.any?
$has_apt        =  `which apt-get`.any?
$prefix         = ENV['PREFIX'] || ENV['HOME']
$dotfiles_path  = File.dirname( __FILE__ )

namespace :install do
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
  end

  desc "Install pry config"
  task :pry do
    copy_to_build 'pry', 'pryrc'
  end

  desc "Install git config"
  task :git do
    parse_config 'git/gitconfig.erb'
    copy_to_build 'git', 'gitignore'
  end

  desc "Copy ack config"
  task :ack do
    copy_to_build 'ack', 'ackrc'
  end

  desc "Copy tmux config"
  task :tmux do
    copy_to_build 'tmux', 'tmux.conf'
  end

  desc "Create symlinks"
  task :backup_and_link do
    Dir[File.join('build', '*').to_s].each do |file|
      backup_and_link file
    end

    backup_and_link 'vim' # vim needs this to find it's config
    puts green( bold "All done, your older files have now been renamed .orig files" )
  end

  def backup_and_link file
    file_name = File.basename file
    dst_name  = File.join( $prefix, ".#{ file_name }" )

    unless  File.exists?( "#{ dst_name }.orig" )
      FileUtils.mv( dst_name, "#{ dst_name }.orig" ) if File.exists?( dst_name )
    else
      puts red( bold "There are older backups that need sorting, I can't continue, please check your .orig files" )
      exit! 1
    end

    FileUtils.ln_sf File.join( $dotfiles_path, file ), dst_name
  end

  def copy_to_build dir, file_name
    FileUtils.cp File.join( dir, file_name ), File.join( 'build', file_name )
  end

  def parse_config file
    erb_file    = File.join $dotfiles_path, file
    final_name  = File.basename( file ).split('.').first
    save_to     = File.join $dotfiles_path, 'build', final_name

    erb_env = Proc.new do
      @is_darwin    = $is_darwin
      @has_macports = $has_macports
      @has_apt_get  = $has_apt
      @prefix       = $prefix

      binding
    end.call

    erb = ERB.new File.read( erb_file )
    File.open( save_to, 'w' ) { |file| file.print erb.result( erb_env ) }
  end
end

namespace :uninstall do
  desc "Removes symlinks and restores .orig files"
  task :restore do
    Dir[File.join('build', '*').to_s].each do |file|
      restore_from_backup file
    end

    restore_from_backup 'vim' # Undo the vim symlink (this is not under build)
    puts green( bold "All done, thanks for trying it." )
  end

  def restore_from_backup file
    file_name = File.basename file
    dst_name  = File.join( $prefix, ".#{ file_name }" )

    FileUtils.safe_unlink dst_name
    FileUtils.mv "#{ dst_name }.orig", dst_name if File.exists? "#{ dst_name }.orig"
  end
end

task :install   => [ "install:bash", "install:vim", "install:git", "install:ack", "install:gem", "install:backup_and_link", "install:tmux", "install:pry" ]
task :uninstall => "uninstall:restore"
task :default   => :install

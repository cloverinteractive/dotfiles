require 'rake'
require 'erb'
require 'fileutils'
require 'term/ansicolor'

include Term::ANSIColor

$is_darwin      = `uname`.strip.include? "Darwin"
$has_macports   = system( 'which port &> /dev/null' )
$has_apt        = system( 'which apt-get &> /dev/null' )
$prefix         = ENV['PREFIX'] || ENV['HOME']
$dotfiles_path  = File.dirname( __FILE__ )

namespace :install do
  desc "Install bash config"
  task :bash do
    parse_config :erb_file => 'bash/bash_profile.erb', :final_name => 'bash_profile'
  end

  desc "Install vim config"
  task :vim do
    system 'git submodule update --init'

    %w/vimrc gvimrc/.each do |file|
      copy_to_build 'vim', file
    end
  end

  desc "Install git config"
  task :git do
    parse_config :erb_file => 'git/gitconfig.erb', :final_name => 'gitconfig'
    copy_to_build 'git', 'gitignore'
  end

  desc "Copy ack config"
  task :ack do
    copy_to_build 'ack', 'ackrc'
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

  def parse_config opts={}
    erb_file  = File.join $dotfiles_path, opts[:erb_file]
    save_to   = File.join $dotfiles_path, 'build', opts[:final_name]

    erb_env = Proc.new do
      @has_macports = $has_macports
      @has_apt_get  = $has_apt
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

task :install   => [ "install:bash", "install:vim", "install:git", "install:ack", "install:backup_and_link" ]
task :uninstall => "uninstall:restore"

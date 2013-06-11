IGNORE_FILES = ['Rakefile', 'README.markdown', '.gitignore', 'notes', 'files', 'config']

def error(text) STDERR.puts "!  #{text}" end
def info(text, prefix="*") STDOUT.puts "#{prefix}  #{text}" end
def info_cmd(text) info(text, ">") end
def info_rm(text) info(text, "x") end

desc "Install dotfiles."

def link_file(source, destination)
  return if IGNORE_FILES.include?(File.basename(source))

  if File.symlink?(destination)
    symlink_to = File.readlink(destination)
    info_rm "Removing symlink #{destination} --> #{symlink_to}" if symlink_to != source
    FileUtils.rm(destination)
  elsif File.exist?(destination)
    error "#{destination} exists. Will not automatically overwrite a non-symlink. Overwrite (y/n)?"
    print "? "
    if STDIN.gets.match(/^y/i)
      info_rm "Removing #{destination}."
      FileUtils.rm_rf(destination)
    else
      return
    end
  end

  contents = File.read(source) rescue ""

  unless contents.include?('<.replace ')
    FileUtils.ln_s(source, destination)
    info_cmd "ln -s #{source} #{destination}"
  else
    info "#{source} has <.replace> placeholders."
    contents.gsub!(/<\.replace (.+?)>/) {
      begin
        File.read(File.expand_path("~/.#{$1}"))
      rescue => e
        error "Could not replace `#{$&}`: #{e.message}"
        ""
      end
    }
    File.open(destination, 'w') {|f| f.write contents }
    info_cmd "wrote file #{destination}"
  end

end

task :install do
  # Link dot files in home directory.
  Dir["*"].each do |file|
    source = File.join(Dir.pwd, file)
    destination = File.expand_path("~/.#{file}")
    link_file(source, destination)
  end

  # Link dot files in ~/.config directory.
  config_folder = File.expand_path("~/.config")
  unless File.exist?(config_folder)
    Dir::mkdir(config_folder)
  end
  Dir["config/*"].each do |file|
    source = File.join(Dir.pwd, file)
    destination = "#{config_folder}/#{File.basename(file)}"
    link_file(source, destination)
  end

  info "Installing janus for vim."
  janus_folder = File.expand_path("~/.vim/janus")
  if File.exist?(janus_folder)
    info_cmd "#{janus_folder} exists. Will not overwrite existing janus installation. If you would like to upgrade, please remove ~/.vim manually."
  else
    `curl -Lo- https://bit.ly/janus-bootstrap | bash`
  end

end

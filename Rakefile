trap("SIGINT") { exit! }

task :default do
  exec 'rake -T'
end

def puts_and_exec command
  puts command
  exec command
end

desc 'Build site for production'
task :build do
  puts_and_exec 'jekyll build --config _config.yml,_config.production.yml --trace'
end

desc 'Preview and watch changes on local machine (development)'
task :preview do
  puts_and_exec 'jekyll serve --config _config.yml --watch --trace'
end

def run command
  print command
  print " ... "
  if system command
    puts "success"
  else
    puts "fail"
  end
end

desc 'Make square thumbnails of images in /images/ directory'
task :make_thumbs do
  require 'fileutils'
  Dir.chdir File.expand_path('../images', __FILE__);
  thumb = '64px'
  FileUtils.mkdir thumb unless File.directory?(thumb)
  thumbs = Dir.glob("#{thumb}/*.jpg").map{ |t| File.basename(t) }
  todo = Dir.glob('*.jpg') - thumbs
  count = 0
  images = []
  todo.each do |file|
    run "convert -resize 64x64^ -gravity Center -crop 64x64+0+0 +repage -- #{file} #{thumb}/#{file}"
    count += 1
    images << File.realpath("#{thumb}/#{file}");
  end
  if count == 0
    puts "Nothing to do!"
  else
    system "open -a ImageOptim #{images.join(' ')}"
  end
end

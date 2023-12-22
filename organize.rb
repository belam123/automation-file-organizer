require 'fileutils'

def organize_files(download_path)
  Dir.glob(File.join(download_path, '*')).each do |file|
    next if File.directory?(file)

    extension = File.extname(file).downcase[1..-1]
    destination_folder = File.join(download_path, extension)

    FileUtils.mkdir_p(destination_folder) unless Dir.exist?(destination_folder)
    FileUtils.mv(file, File.join(destination_folder, File.basename(file)))
  end
end

puts 'Enter the path to your download folder:'
download_path = gets.chomp

unless Dir.exist?(download_path)
  puts "The specified directory '#{download_path}' does not exist."
  exit
end

organize_files(download_path)

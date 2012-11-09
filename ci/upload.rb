#!/usr/bin/env ruby
require 'net/ftp'

def delete_files(ftp)
  ftp.list.each do |name|
    basename = name.gsub(/.* [a-z]{3} [0-9]{1,2}( ){1,2}[0-9]{2}:[0-9]{2} /i,'')
    next if basename == '.' or basename == '..'

    print basename
    
    if /^d.*/i =~ name
      ftp.chdir(basename)
      delete_files(ftp)
      ftp.chdir("..")
      ftp.rmdir(basename)
    else
      ftp.delete(basename)
    end
  end
end

def upload_files(path, ftp)
  Dir.glob(path+'/**') do |name|
    next if name == '.' or name == '..'

    if File.directory? name
      dir_name = File.basename(name)
      ftp.mkdir(dir_name)
      ftp.chdir(dir_name)
      upload_files(name, ftp)
      ftp.chdir("..")
    else
      ftp.put(name)
    end
  end
end

Net::FTP.open(ENV['FTP_ADDRESS'], ENV['FTP_USERNAME'], ENV['FTP_PASSWORD']) do |ftp|
  ftp.passive = true
  ftp.chdir('public_html/sesi/')
  delete_files(ftp)
  upload_files('build', ftp)
end

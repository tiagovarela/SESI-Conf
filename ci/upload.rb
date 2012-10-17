#!/usr/bin/env ruby
require 'net/ftp'

def upload_path(path, ftp)
  Dir.glob(path+'/**') do |name|
    next if name == '.' or name == '..'

    if File.directory? name
      dir_name = File.basename(name)
      list = ftp.list
      list.map!{ |l| l.gsub!(/.* [a-z]{3} [0-9]{1,2} [0-9]{2}:[0-9]{2} /i,'')}
      puts list
      if list.include? dir_name
        ftp.rmdir(dir_name)
      end
      ftp.mkdir(dir_name)
      ftp.chdir(dir_name)
      upload_path(name, ftp)
      ftp.chdir("..")
    else
      #upload file using ftp
      ftp.put(name)
    end
  end
end

Net::FTP.open(ENV['FTP_ADDRESS'], ENV['FTP_USERNAME'], ENV['FTP_PASSWORD']) do |ftp|
  ftp.passive = true
  ftp.chdir('public_html/sesi/')
  upload_path('build', ftp)
end

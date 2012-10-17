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

def delete_old_files(ftp)
  ftp.list.each do |name|
    basename = name.gsub(/.* [a-z]{3} [0-9]{1,2} [0-9]{2}:[0-9]{2} /i,'')
    next if basename == '.' or basename == '..'
    if name =~ /$d.*/i
      ftp.chdir(basename)
      delete_old_files(ftp)
      ftp.chdir("..")
    else
      ftp.delete(basename)
    end
  end
end

Net::FTP.open(ENV['FTP_ADDRESS'], ENV['FTP_USERNAME'], ENV['FTP_PASSWORD']) do |ftp|
  ftp.passive = true
  ftp.chdir('public_html/sesi/')
  delete_old_files(ftp)
  upload_path('build', ftp)
end

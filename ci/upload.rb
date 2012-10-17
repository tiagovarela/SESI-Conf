#!/usr/bin/env ruby
require 'net/ftp'

Net::FTP.open(ENV['FTP_ADDRESS'], ENV['FTP_USERNAME'], ENV['FTP_PASSWORD']) do |ftp|
  ftp.chdir('public_html/sesi/')
  ftp.put('build/404.html')
end
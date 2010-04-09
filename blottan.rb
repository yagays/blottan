#!/usr/bin/env ruby
require 'date'
require 'rubygems'
require 'nokogiri'
require 'pp'


def choice(abst,h,id)
  abst.scan(/((northern|southern|eastern|western) blotting)/i).each do |elem|
    h[id => elem[1].downcase] = 1
  end
end

("0141".."0740").each do |elem|
  h = Hash.new
  h.default = 0
  idlist = []
  namelist = [:y, "northern","southern","eastern","western"]
  doc = Nokogiri::XML(open("MEDLINE/medline10n#{elem}.xml"))
  doc.search("MedlineCitationSet/MedlineCitation").each do |block|
    id = block.at("PMID").inner_text
    y = block.search("Article/Journal/JournalIssue/PubDate/Year").inner_text.to_i 
    if y > 1975
      h[id => :y] = y
      idlist.push id
      choice(block.search("Article/Abstract/AbstractText").inner_text,h,id)
     end
  end

  n = elem[1,3]
  f = open("result/#{n}.csv","w")
  f.puts "id," + namelist.join(",")

  idlist.each.each do |id|
    
    tmp = [id]
    namelist.each do |e|
      tmp.push h[id => e] 
    end
    if tmp[2..5] != [0,0,0,0]
      f.puts tmp.join(",")
    end
  end
  f.close
  puts "#{n}.csv end"
end

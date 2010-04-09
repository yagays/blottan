("141".."740").each do |e|
  `tail -n +2 #{e}.csv >> medline.csv`
end

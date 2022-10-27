3.times do |num|
  Message.create(content: "#{num}番目のメッセージ", user_id: User.first.id)
  puts "#{num}番目のメッセージを作成。"
end

puts "メッセージの作成が完了。"
json.overlapping_followers @overlapping_followers do |follower|
  json.text tweet.full_text
  json.id tweet.id
end
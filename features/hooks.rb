Before do
  log 'New Test'
  @start_at = Time.now
end

After do
  @finished_at = Time.now
  test_time = (@finished_at - @start_at).round(3)
  log "Test was running #{test_time} seconds"
end
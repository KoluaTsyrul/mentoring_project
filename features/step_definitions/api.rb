Given(/^Get method$/) do
  @url = 'https://jsonplaceholder.typicode.com'
  response = Faraday.get "#{@url}/posts/1"
  log response.status
  log response.body
end

Then(/^Create post$/) do
  post = Faraday.post("https://jsonplaceholder.typicode.com/posts",
                      '{
          "title": "test",
          "body"": "cucs",
          "userId": 1
      }',
                      "Content-Type" => "text/json")
  log post.status
  log post.body
end

And(/^Update post$/) do
  faraday_put = Faraday.put(
      "#{@url}/posts/1",
      '{
       "id": 1,
      "title": "update",
      "body": "post",
      "userId": 1
    }',
      "Content-Type" => "application/json")
  log faraday_put.status
  log faraday_put.body
end

And(/^get all posts$/) do
  response = Faraday.get "#{@url}/posts/101"
  log response.status
  log response.body
end

And(/^delete post$/) do
  response = Faraday.delete "#{@url}/posts/1"
  log response.status
end


<% if user_signed_in? %>
  <h1>New Log Entry</h1>
  <%= form_for [@user, @post] do |f| %>
    <%= f.label(:title, "Title") %>
    <%= f.text_field(:title) %>
    <%= f.label(:date, "Date") %>
    <%= f.date_select :date %>
    <%= f.label(:body, "Workout Details") %>
    <%= f.text_field(:body) %>
    <%= f.label(:tags, "Tags") %>
    <%= f.text_field(:tags) %>
    <%= f.submit("Submit Entry") %>
  <% end %>

  <% unless @posts.nil? %>
    <% @posts.each do |post| %>
      <%= post.title %>
      <%= post.date %>
      <%= post.body %>
      <% post.tags.each do |tag| %>
        <%= tag %>
      <% end %>
      <%= post.created_at %>
    <% end %>
  <% end %>
<% end %>

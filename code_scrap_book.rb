<h3>Add video</h3>
<%= form_for [@post, @video] do |f| %>
  <%= f.label(:video_url, "Video Url") %>
  <%= f.text_field(:video_url) %>
<% end %>

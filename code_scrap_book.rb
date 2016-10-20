# <div className="" key={video.id}>
#   <li className="">
#     <p><a href={video_url}>{video.title}</a></p>
#     <p><iframe src="//www.youtube.com/embed/`${video.embed_id}`"></iframe></p>
    <p>Created by: {video.user.username}, at: {video.created_at.strftime("%e, %b, %Y, %H:%M:%S %p")}</p>
    <div className="">{comment}</div>
  </li>
</div>


<p>Tags: raw video.tag_list.map { |t| link_to t, tag_path(t) }.join(", ")</p>


<%= will_paginate @videos %>

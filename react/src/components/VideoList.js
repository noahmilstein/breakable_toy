import React from 'react';
import Video from './Video';

const VideoList = props => {
  let videos = props.videos.map(video => {
    let video_url = `/videos/${video.id}`;

    return(
      <Video
        key={video.id}
        id={video.id}
        video_url={video_url}
        embed_id={video.embed_id}
        title={video.title}
        created_at={video.created_at}
      />
    );
  });
  return(
    <div>
      <ol>
        {videos}
      </ol>
    </div>
  );
};

export default VideoList;

import React from 'react';

const Video = props => {
  let url = `//www.youtube.com/embed/${props.embed_id}`;

  return(
    <div>
      <li>
        <p><a href={props.video_url}>{props.title}</a></p>
        <p><iframe src={url}></iframe></p>
        <p>{props.created_at}</p>
      </li>
    </div>
  );
};

export default Video;

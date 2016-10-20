import React, { Component } from 'react';
import VideoList from './VideoList';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      videos: [],
      current_user: false,
      interval: null,
      comments: []
    }
    this.getVideos = this.getVideos.bind(this);
  }

  // getVideoComment(id) {
  //   $.ajax({
  //     url: `/videos/${id}`,
  //     contentType: 'application/json'
  //   })
  //   .done(data => {
  //     debugger;
  //     return( data.comment )
  //   });
  // }

  getVideos() {
    $.ajax({
      url: '/videos.json',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ videos: data.videos });
      this.setState({ current_user: data.current_user });
    });
  }

  componentDidMount() {
    this.getVideos()
    let interval = setInterval(function() {
      this.getVideos();
    }.bind(this), 2000);
    this.setState({ interval: interval });
  }

  componentWillUnMount() {
    clearInterval(this.state.interval);
  }

  render() {
    return(
      <div>
        <VideoList
          videos={this.state.videos}
        />
      </div>
    );
  }
}

export default App;

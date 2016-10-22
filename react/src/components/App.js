import React, { Component } from 'react';
import MenuBar from './MenuBar';

export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUser: "",
      admin: "",
      userName: "",
      avatar: ""
    };
    this.getUser = this.getUser.bind(this);
  }

  getUser() {
    $.ajax({
      url: '/',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ currentUser: data.currentUser, admin: data.admin, userName: data.userName, avatar: data.avatar });
    });
  }

  componentDidMount() {
    this.getUser();
  }
  render() {
    return(
      <div className="container">
        <MenuBar
          currentUser={this.state.currentUser}
          admin={this.state.admin}
          userName={this.state.userName}
          avatar={this.state.avatar}
        />
      </div>
    );
  }
};

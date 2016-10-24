import React, { Component } from 'react';
import { ButtonToolbar, ButtonGroup, Button, DropdownButton, MenuItem } from 'react-bootstrap';

export default class MenuBar extends Component {
  constructor(props) {
    super(props);
  }
  render() {
    let signOut = ""
    let signIn = ""
    let signUp = ""
    let index = ""
    let indexUrl = ""
    let indexName = ""
    let loggedInAs = ""
    let userName = this.props.userName
    let avatar = `${this.props.avatar}`
    let image = ""
    let dropDown = ""
    const resize = {
      height: "20px"
    }
    const size = {
      height: "54px"
    }

    if (this.props.currentUser === false) {
      if (this.props.admin === false) {
        indexUrl = "/users/coach_index"
        indexName = "Coach Index"
        loggedInAs = <Button bsStyle="primary" href="/users/show_profile" id="myProfileButton">Logged in as {userName} {image}</Button>
      } else {
        indexUrl = "/users/trainee_index"
        indexName = "Trainee Index"
        loggedInAs = <Button bsStyle="primary" href="/users/show_profile" id="myProfileButton">Logged in as coach: {userName}{image}</Button>
      }
      signOut = <Button bsStyle="primary" href="/users/sign_out" data-method="delete">Sign Out</Button>
      image = <img src={avatar} alt="mustache" className="img-responsive pull-right" style={resize}/>
      dropDown =  <DropdownButton bsStyle="primary" title="Menu" id="dropdownButton" style={size}>
                    <MenuItem eventKey="1" href='/home/about' id="aboutButton">About</MenuItem>
                    <MenuItem eventKey="2" href='/users/show_profile' id="myProfileButton">My Profile</MenuItem>
                    <MenuItem eventKey="3" href='/users/show_log' id="myLogButton">My Log</MenuItem>
                    <MenuItem eventKey="4" href='/videos' id="videoIndexButton">Video Index</MenuItem>
                    <MenuItem eventKey="5" id="userIndexButton" href={indexUrl}>{indexName}</MenuItem>
                  </DropdownButton>
    } else {
      signIn = <Button bsStyle="primary" href="/users/sign_in">Sign In</Button>
      signUp = <Button bsStyle="primary" href="/users/sign_up">Sign Up</Button>
      dropDown =  <DropdownButton bsStyle="primary" title="Menu" id="dropdownButton" style={size}>
                    <MenuItem eventKey="1" href='/home/about' id="aboutButton">About</MenuItem>
                  </DropdownButton>
    }

    return(
      <div className="row">
        <ButtonToolbar bsStyle="primary" id="buttonToolBar" >
          <ButtonGroup id="buttonGroup" justified>
            <Button bsStyle="primary" href='/' id="myProfileButton">Home</Button>
            {dropDown}
            {loggedInAs}
            {signOut}
            {signIn}
            {signUp}
          </ButtonGroup>
        </ButtonToolbar>
      </div>
    )
  }
}

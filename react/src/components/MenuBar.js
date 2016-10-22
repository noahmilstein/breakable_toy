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
    const resize = {
      height: "20px"
    }


    if (this.props.currentUser === false) {
      signOut = <Button href="/users/sign_out" data-method="delete">Sign Out</Button>
      image = <img src={avatar} alt="mustache" className="img-responsive pull-right" style={resize}/>
      if (this.props.admin === false) {
        indexUrl = "/users/coach_index"
        indexName = "Coach Index"
        loggedInAs = <Button href="/users/show_profile" id="myProfileButton">Logged in as {userName} {image}</Button>
      } else {
        indexUrl = "/users/trainee_index"
        indexName = "Trainee Index"
        loggedInAs = <Button href="/users/show_profile" id="myProfileButton">Logged in as coach: {userName}{image}</Button>
      }
    } else {
      signIn = <Button href="/users/sign_in" style={resize}>Sign In</Button>
      signUp = <Button href="/users/sign_up" style={resize}>Sign Up</Button>
    }

    return(
      <div className="row">
        <ButtonToolbar id="buttonToolBar" >
          <ButtonGroup id="buttonGroup" justified>
            <Button href='/' id="myProfileButton">Home</Button>
            <DropdownButton title="Menu" id="dropdownButton">
              <MenuItem eventKey="1" href='/users/show_profile' id="myProfileButton">My Profile</MenuItem>
              <MenuItem eventKey="2" href='/users/show_log' id="myLogButton">My Log</MenuItem>
              <MenuItem eventKey="3" href='/videos' id="videoIndexButton">Video Index</MenuItem>
              <MenuItem eventKey="4" id="userIndexButton" href={indexUrl}>{indexName}</MenuItem>
            </DropdownButton>
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

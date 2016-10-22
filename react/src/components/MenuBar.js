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
    if (this.props.currentUser === false) {
      signOut = <Button href="/users/sign_out" data-method="delete">Sign Out</Button>
      if (this.props.admin === false) {
        indexUrl = "/users/coach_index"
        indexName = "Coach Index"
      } else {
        indexUrl = "/users/trainee_index"
        indexName = "Trainee Index"
      }
    } else {
      signIn = <Button href="/users/sign_in">Sign In</Button>
      signUp = <Button href="/users/sign_up">Sign Up</Button>
    }

    return(
      <ButtonToolbar id="buttonToolBar">
        <ButtonGroup id="buttonGroup">
          {signOut}
          {signIn}
          {signUp}
          <DropdownButton title="Menu" id="dropdownButton">
           <MenuItem eventKey="1" href='/' id="myProfileButton">Home</MenuItem>
           <MenuItem eventKey="2" href='/users/show_profile' id="myProfileButton">My Profile</MenuItem>
           <MenuItem eventKey="3" href='/users/show_log' id="myLogButton">My Log</MenuItem>
           <MenuItem eventKey="4" href='/videos' id="videoIndexButton">Video Index</MenuItem>
           <MenuItem eventKey="5" id="userIndexButton" href={indexUrl}>{indexName}</MenuItem>
         </DropdownButton>
        </ButtonGroup>
      </ButtonToolbar>
    )
  }
}

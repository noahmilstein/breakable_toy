return(
  <div className="row">
    <ButtonToolbar id="buttonToolBar" >
      <ButtonGroup id="buttonGroup" justified>
        {signOut}
        {signIn}
        {signUp}
        {loggedInAs}
        <DropdownButton title="Menu" id="dropdownButton">
          <MenuItem eventKey="1" href='/' id="myProfileButton">Home</MenuItem>
          <MenuItem eventKey="2" href='/users/show_profile' id="myProfileButton">My Profile</MenuItem>
          <MenuItem eventKey="3" href='/users/show_log' id="myLogButton">My Log</MenuItem>
          <MenuItem eventKey="4" href='/videos' id="videoIndexButton">Video Index</MenuItem>
          <MenuItem eventKey="5" id="userIndexButton" href={indexUrl}>{indexName}</MenuItem>
       </DropdownButton>
      </ButtonGroup>
    </ButtonToolbar>
  </div>
)

import React, {Component} from 'react'
import {
  Box
  Button
  Collapsible
  Heading
  Grommet
  Layer
  ResponsiveContext
} from 'grommet'
import {FormClose, Menu } from 'grommet-icons'

theme =
  global:
    colors:
      brand: '#228BE6'
    font:
      family: 'Roboto'
      size: '14px'
      height: '20px'

AppBar = (props) ->
  <Box
    tag='header'
    direction='row'
    align='center'
    justify='between'
    background='brand'
    pad={left: 'medium', right: 'small', vertical: 'small'}
    elevation='medium'
    style={zIndex: '1' }
    {...props}
  />

class App extends Component
  constructor: (props) ->
    super props
    @state =
      showSidebar: false
      userName: null

  componentDidMount: ->
    @fetchUserName()

  fetchUserName: ->
    res = await fetch('/api/getUsername')
    user = await res.json()
    @setState
      userName: user.username

  handleMenuClick: (e) =>
    @setState (prevState) ->
      showSidebar: not prevState.showSidebar

  handleCloseClick: (e) =>
    @setState
      showSidebar: off

  render: ->
    {showSidebar, userName} = @state
    <Grommet theme={theme} full>
      <ResponsiveContext.Consumer>
        {(size) =>
          <Box fill>
            <AppBar>
              <Heading level='3' margin='none'>{if userName then "Hello #{userName}" else 'Loading.. please wait!'}</Heading>
              <Button
                icon={<Menu/>}
                onClick={@handleMenuClick}/>
            </AppBar>
            <Box direction='row' flex overflow={horizontal: 'hidden'}>
              <Box flex align='center' justify='center'>
                app body
              </Box>
              {if not showSidebar || size isnt 'small' then (
                <Collapsible direction="horizontal" open={showSidebar}>
                  <Box flex
                    width='medium'
                     background='light-2'
                     elevation='small'
                     align='center'
                     justify='center'>
                    sidebar
                  </Box>
                </Collapsible>
              ) else (
                <Layer>
                  <Box
                    background='light-2'
                    tag='header'
                    justify='end'
                    align='center'
                    direction='row'>
                    <Button
                      icon={<FormClose/>}
                      onClick={@handleCloseClick}/>
                  </Box>
                  <Box fill
                    background='light-2'
                    align='center'
                    justify='center'>
                    sidebar
                  </Box>
                </Layer>
              )}
            </Box>
          </Box>
        }
      </ResponsiveContext.Consumer>
    </Grommet>

export default App

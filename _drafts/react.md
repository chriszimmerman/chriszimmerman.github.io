React
  -uses components
  -Inputs are props and state
    -props cannot be changed but state can
    -try not to include state

  Model + component = DOM

  The way to change the DOM is to change the model

  A component's render() function updates the fake DOM.
  React comopares fake DOM to page's real DOM and updates if there are any changes


  React.createClass() - creates components

  States are used when a component needs to change independently of its parent
  Components with state have more complexity

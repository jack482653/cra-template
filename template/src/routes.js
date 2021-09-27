import React from 'react';
import {Switch, Route, BrowserRouter as Router} from 'react-router-dom';
import App from 'containers/application';

export function Routes() {
  return (
    <Router>
      <Switch>
        <Route exact path="/" render={() => <App />} />
      </Switch>
    </Router>
  );
}

Routes.propTypes = {};

export default Routes;
